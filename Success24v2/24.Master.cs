using System;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Globalization;

namespace Success24v2
{
    public partial class _24 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    GenerateNavigation();

                    DataTable navDt = Utility._GetDataTable24("Select * from SiteNavigation where Site = 'Success24' order by Orderby");
                    var programInfo = GetProgramsChildInfo(navDt); // returns (pageSlugDisplay, pageTitle)
                    Utility._SetLocationsHome(_LiteralLocationAll, null, programInfo.Item1, programInfo.Item2);
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + Server.HtmlEncode(ex.Message));
                    _LiteralNavDesktop.Text = "";
                }
            }
        }

        private Tuple<string, string> GetProgramsChildInfo(DataTable navDt)
        {
            string defaultSlug = "Data-Science-Training-Institute";
            string defaultTitle = "Data Science Training Institute";

            try
            {
                if (navDt == null || navDt.Rows.Count == 0)
                    return Tuple.Create(defaultSlug, defaultTitle);

                // Get City
                string city = Convert.ToString(HttpContext.Current.Session["City"] ?? "").Trim();
                if (string.IsNullOrEmpty(city))
                    city = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DefaultCity"] ?? "").Trim();

                string citySlug = city.Replace(" ", "-");

                string currentPath = HttpContext.Current.Request.Url.AbsolutePath.ToLowerInvariant();

                // Find Programs parent
                var parentRows = navDt.Select("ParentID IS NULL OR ParentID = 0");
                DataRow programsParent = null;

                foreach (DataRow p in parentRows)
                {
                    string pTitle = Convert.ToString(p["Title"] ?? "");
                    string pNav = Convert.ToString(p["Navurl"] ?? "");
                    if (pTitle.IndexOf("Programs", StringComparison.OrdinalIgnoreCase) >= 0 ||
                        pNav.IndexOf("Programs", StringComparison.OrdinalIgnoreCase) >= 0)
                    {
                        programsParent = p;
                        break;
                    }
                }

                if (programsParent == null)
                    return Tuple.Create(defaultSlug, defaultTitle);

                // Get children
                string pid = Convert.ToString(programsParent["ID"] ?? "");
                DataRow[] children = navDt.Select("ParentID = " + pid);

                if (children.Length == 0)
                    return Tuple.Create(defaultSlug, defaultTitle);

                // Default first child
                DataRow selectedChild = children[0];

                foreach (DataRow child in children)
                {
                    string childTitle = Convert.ToString(child["Title"] ?? "").Replace("_#City#_", "").Trim();
                    string childSlug = Utility.GenerateSlug(childTitle).ToLowerInvariant();

                    if (currentPath.Contains(childSlug))
                    {
                        selectedChild = child;
                        break;
                    }
                }

                string rawTitle = Convert.ToString(selectedChild["Title"] ?? "");

                // Footer link slug = {title}-Training-Institute-in-{city}
                string slugPart = rawTitle.Replace(" ", "-");

                string pageSlugDisplay = $"{slugPart}-Training-Institute";

                // Footer title text = Title with spacing
                string pageTitle = $"{rawTitle} Training Institute";

                return Tuple.Create(pageSlugDisplay, pageTitle);
            }
            catch
            {
                return Tuple.Create(defaultSlug, defaultTitle);
            }
        }


        private void GenerateNavigation()
        {
            try
            {
                DataTable dt = Utility._GetDataTable24("Select * from SiteNavigation where Site = 'Success24' order by Orderby");
                if (dt == null || dt.Rows.Count == 0)
                {
                    _LiteralNavDesktop.Text = "";
                    return;
                }

                string host = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["HostURL"] ?? "").TrimEnd('/');
                string city = Convert.ToString(HttpContext.Current.Session["City"] ?? "").Trim();
                if (string.IsNullOrEmpty(city))
                    city = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DefaultCity"] ?? "").Trim();
                string citySlug = string.IsNullOrEmpty(city) ? "" : city.Replace(" ", "-");

                StringBuilder dsktp = new StringBuilder();
                StringBuilder mobileSb = new StringBuilder();
                DataRow[] parents = dt.Select("ParentID IS NULL OR ParentID = 0");

                string BuildUrl(string rawNavUrl, bool includeCity)
                {
                    if (string.IsNullOrWhiteSpace(rawNavUrl))
                        return host + (includeCity && !string.IsNullOrEmpty(citySlug) ? "/" + citySlug : "");

                    string nav = rawNavUrl.Replace("_#City#_", city).Trim();
                    nav = nav.TrimStart('/').Replace(" ", "-");

                    if (nav.StartsWith("http://", StringComparison.OrdinalIgnoreCase) || nav.StartsWith("https://", StringComparison.OrdinalIgnoreCase))
                        return nav;

                    if (includeCity && !string.IsNullOrEmpty(citySlug))
                        return host + "/" + citySlug + "/" + nav;

                    return host + "/" + nav;
                }

                foreach (DataRow row in parents)
                {
                    string idRaw = Convert.ToString(row["ID"] ?? "");
                    string title = Convert.ToString(row["Title"] ?? "").Replace("_#City#_", city);
                    string parentNav = Convert.ToString(row["Navurl"] ?? "");

                    // get children safely depending on ID type
                    DataRow[] children;
                    if (int.TryParse(idRaw, out int numericId))
                        children = dt.Select("ParentID = " + numericId);
                    else
                        children = dt.Select("ParentID = '" + idRaw.Replace("'", "''") + "'");

                    // detect Programs parent (adjust if needed)z
                    bool isProgramsParent = (!string.IsNullOrEmpty(title) && title.IndexOf("Programs", StringComparison.OrdinalIgnoreCase) >= 0)
                                            || (!string.IsNullOrEmpty(parentNav) && parentNav.IndexOf("Programs", StringComparison.OrdinalIgnoreCase) >= 0);

                    if (children.Length == 0)
                    {
                        // leaf item: include city only for Programs if desired
                        string url = BuildUrl(parentNav, includeCity: isProgramsParent);
                        dsktp.AppendFormat("<li><a href='{0}' class='hover:text-orange-400'>{1}</a></li>", HttpUtility.HtmlAttributeEncode(url), HttpUtility.HtmlEncode(title));

                        // mobile: single item
                        mobileSb.AppendFormat("<li><a href='{0}' class='block py-2 px-3 text-sm text-gray-800 hover:text-orange-500'>{1}</a></li>", HttpUtility.HtmlAttributeEncode(url), HttpUtility.HtmlEncode(title));
                    }
                    else
                    {
                        // For Programs parent: parent link should default to first child (with city)
                        string parentDefaultLink = null;
                        if (isProgramsParent && children.Length > 0)
                        {
                            string firstChildNav = Convert.ToString(children[0]["Navurl"] ?? "");
                            parentDefaultLink = BuildUrl(firstChildNav, includeCity: true);
                        }

                        dsktp.AppendFormat("<li class='group relative inline-block'>");

                        if (!string.IsNullOrEmpty(parentDefaultLink))
                        {
                            dsktp.AppendFormat("<a href='{0}' class='hover:text-orange-400 flex items-center gap-1 font-medium transition-colors text-black'>{1} <i class='fas fa-chevron-down text-[10px]'></i></a>", HttpUtility.HtmlAttributeEncode(parentDefaultLink), HttpUtility.HtmlEncode(title));
                        }
                        else
                        {
                            dsktp.AppendFormat("<button class='hover:text-orange-400 flex items-center gap-1 font-medium transition-colors text-black'>{0} <i class='fas fa-chevron-down text-[10px]'></i></button>", HttpUtility.HtmlEncode(title));
                        }

                        dsktp.Append("<div class='absolute hidden group-hover:block bg-white text-gray-800 shadow-2xl rounded-xl p-8 top-full left-1/2 transform -translate-x-1/2 w-max max-w-[95vw] z-[9999] mt-2 border border-gray-100'>");
                        dsktp.Append("<div class='grid grid-cols-3 gap-10'>");

                        int itemsPerColumn = (int)Math.Ceiling((double)children.Length / 3);
                        int columnIndex = 0;
                        int itemCount = 0;

                        dsktp.Append("<div class='flex flex-col gap-3'>");

                        foreach (DataRow child in children)
                        {
                            string childNav = Convert.ToString(child["Navurl"] ?? "");
                            string childTitle = Convert.ToString(child["Title"] ?? "").Replace("_#City#_", city);

                            string childUrl = BuildUrl(childNav, includeCity: isProgramsParent);

                            dsktp.AppendFormat("<a href='{0}' class='block py-2 px-3 hover:text-orange-600 hover:bg-orange-50 rounded-md transition-all duration-200 text-[15px] whitespace-normal leading-tight'>{1}</a>", HttpUtility.HtmlAttributeEncode(childUrl), HttpUtility.HtmlEncode(childTitle));

                            itemCount++;
                            if (itemCount == itemsPerColumn && columnIndex < 2)
                            {
                                dsktp.Append("</div><div class='flex flex-col gap-3'>");
                                columnIndex++;
                                itemCount = 0;
                            }
                        }

                        dsktp.Append("</div></div></div></li>");

                        // mobile: parent with children (vertical)
                        mobileSb.AppendFormat("<li class='border-b pb-2 mb-2'><div class='font-medium py-2'>{0}</div><ul class='pl-3'>", HttpUtility.HtmlEncode(title));
                        foreach (DataRow child in children)
                        {
                            string childNav = Convert.ToString(child["Navurl"] ?? "");
                            string childTitle = Convert.ToString(child["Title"] ?? "").Replace("_#City#_", city);
                            string childUrl = BuildUrl(childNav, includeCity: isProgramsParent);
                            mobileSb.AppendFormat("<li><a href='{0}' class='block py-2 px-3 text-sm text-gray-700 hover:text-orange-500'>{1}</a></li>", HttpUtility.HtmlAttributeEncode(childUrl), HttpUtility.HtmlEncode(childTitle));
                        }
                        mobileSb.Append("</ul></li>");
                    }
                }

                _LiteralNavDesktop.Text = dsktp.ToString();
                // wrap mobile list for display inside the mobile menu
                _LiteralNavMobile.Text = "<ul class='flex flex-col'>" + mobileSb.ToString() + "</ul>";
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + (ex.ToString()));
                _LiteralNavDesktop.Text = "";
                _LiteralNavMobile.Text = "";
            }
        }
    }
}