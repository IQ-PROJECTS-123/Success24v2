using System;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;

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

                    Utility._SetLocationsHome(_LiteralLocationAll, null, "Data-Science-Training-Institute", "Data-science-Training-Institute");
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + Server.HtmlEncode(ex.Message));
                    _LiteralNavDesktop.Text = "";
                }
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
                            // Render parent as an anchor that navigates to first child, keep dropdown
                            dsktp.AppendFormat("<a href='{0}' class='hover:text-orange-400 flex items-center gap-1 font-medium transition-colors text-white'>{1} <i class='fas fa-chevron-down text-[10px]'></i></a>", HttpUtility.HtmlAttributeEncode(parentDefaultLink), HttpUtility.HtmlEncode(title));
                        }
                        else
                        {
                            // Non-programs parent or no default link: render button label (no navigation on parent)
                            dsktp.AppendFormat("<button class='hover:text-orange-400 flex items-center gap-1 font-medium transition-colors text-white'>{0} <i class='fas fa-chevron-down text-[10px]'></i></button>", HttpUtility.HtmlEncode(title));
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

                            // Only program links include the city slug
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
                    }
                }

                _LiteralNavDesktop.Text = dsktp.ToString();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " +(ex.ToString()));
                _LiteralNavDesktop.Text = "";
            }
        }
    }
}