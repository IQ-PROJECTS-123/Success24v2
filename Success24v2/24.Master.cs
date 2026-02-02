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
                    DataTable dt = Utility._GetDataTable24("Select * from SiteNavigation where Active=1 order by Orderby");
                    if (dt == null || dt.Rows.Count == 0) return;

                    StringBuilder dsktp = new StringBuilder();
                    DataRow[] parents = dt.Select("ParentID IS NULL OR ParentID = 0");

                    string host = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["HostURL"]).TrimEnd('/');
                    string city = Convert.ToString(HttpContext.Current.Session["City"]);
                    if (string.IsNullOrEmpty(city))
                        city = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DefaultCity"]);
                    string citySlug = city.Replace(" ", "-");

                    foreach (DataRow row in parents)
                    {
                        string id = row["ID"].ToString();
                        string title = row["Title"].ToString().Replace("_#City#_", city);
                        string parentNav = Convert.ToString(row["Navurl"]);

                        DataRow[] children = dt.Select("ParentID = " + id);

                        // detect Programs parent (adjust if your title differs)
                        bool isProgramsParent = title.IndexOf("Program", StringComparison.OrdinalIgnoreCase) >= 0
                                                || parentNav.IndexOf("Program", StringComparison.OrdinalIgnoreCase) >= 0;

                        if (children.Length == 0)
                        {
                            // static pages (no city) except if this is a Programs leaf (rare)
                            string url;
                            if (isProgramsParent)
                                url = host + "/" + citySlug + "/" + parentNav.Replace("_#City#_", city).Replace(" ", "-");
                            else
                                url = host + "/" + parentNav.Replace("_#City#_", "").Replace(" ", "-");

                            dsktp.AppendFormat("<li><a href='{0}' class='hover:text-orange-400'>{1}</a></li>", url, title);
                        }
                        else
                        {
                            dsktp.AppendFormat("<li class='group relative inline-block'>");
                            dsktp.AppendFormat("<button class='hover:text-orange-400 flex items-center gap-1 font-medium transition-colors text-white'>{0} <i class='fas fa-chevron-down text-[10px]'></i></button>", HttpUtility.HtmlEncode(title));
                            dsktp.Append("<div class='absolute hidden group-hover:block bg-white text-gray-800 shadow-2xl rounded-xl p-8 top-full left-1/2 transform -translate-x-1/2 w-max max-w-[95vw] z-[9999] mt-2 border border-gray-100'>");
                            dsktp.Append("<div class='grid grid-cols-3 gap-10'>");

                            int itemsPerColumn = (int)Math.Ceiling((double)children.Length / 3);
                            int columnIndex = 0;
                            int itemCount = 0;

                            dsktp.Append("<div class='flex flex-col gap-3'>");

                            foreach (DataRow child in children)
                            {
                                string childNav = Convert.ToString(child["Navurl"]);
                                string childTitle = Convert.ToString(child["Title"]).Replace("_#City#_", city);

                                string childUrl;
                                if (isProgramsParent)
                                    childUrl = host + "/" + citySlug + "/" + childNav.Replace("_#City#_", city).Replace(" ", "-");
                                else
                                    childUrl = host + "/" + childNav.Replace("_#City#_", "").Replace(" ", "-");

                                dsktp.AppendFormat("<a href='{0}' class='block py-2 hover:text-orange-500'>{1}</a>", childUrl, childTitle);

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
                    // keep simple diagnostics
                    Response.Write("Error: " + Server.HtmlEncode(ex.Message));
                    _LiteralNavDesktop.Text = "";
                }
            }
        }
    }
}