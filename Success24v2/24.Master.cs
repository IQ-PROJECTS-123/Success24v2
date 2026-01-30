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

                    foreach (DataRow row in parents)
                    {
                        string id = row["ID"].ToString();
                        string title = row["Title"].ToString().Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"]));//Data Science Training Institute in _#City#_
                        string url = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["HostURL"])+ Convert.ToString(HttpContext.Current.Session["City"]).Replace(" ", "-") +"/"+ (row["Navurl"].ToString().Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"]))).Replace(" ","-");

                          DataRow[] children = dt.Select("ParentID = " + id);

                        if (children.Length == 0)
                        {
                            dsktp.AppendFormat("<li><a href='{0}' class='hover:text-orange-400'>{1}</a></li>", url, title);
                        }
                        else
                        {
                            dsktp.AppendFormat("<li class='group relative'><button class='hover:text-orange-400 flex items-center gap-1'>{0} <i class='fas fa-chevron-down text-[10px]'></i></button>", title);
                            dsktp.Append("<div class='absolute hidden group-hover:block bg-white text-gray-800 shadow-xl rounded-lg p-4 min-w-[200px] top-full left-0'>");


                            foreach (DataRow child in children)
                            {
                                url = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["HostURL"]) + Convert.ToString(HttpContext.Current.Session["City"]).Replace(" ", "-") + "/" + (child["Navurl"].ToString().Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"]))).Replace(" ", "-");

                                dsktp.AppendFormat("<a href='{0}' class='block py-2 hover:text-orange-500'>{1}</a>", url, child["Title"]);
                            }

                            dsktp.Append("</div></li>");
                        }
                    }

                    _LiteralNavDesktop.Text = dsktp.ToString();
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}