using System;
using System.Data;
using System.Text;
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
                    DataTable dt = Utility._GetDataTable24(
                        "SELECT * FROM SiteNavigation WHERE Active = 1 ORDER BY Orderby");

                    if (dt == null || dt.Rows.Count == 0) return;

                    StringBuilder desktopNav = new StringBuilder();

                    DataRow[] parents = dt.Select("ParentID IS NULL OR ParentID = 0");

                    foreach (DataRow row in parents)
                    {
                        string id = row["ID"].ToString();
                        string title = row["Title"].ToString();
                        string url = row["Navurl"].ToString();

                        DataRow[] children = dt.Select("ParentID = " + id);

                        if (children.Length == 0)
                        {
                            desktopNav.AppendFormat(
                                "<li><a href='{0}' class='hover:text-orange-400'>{1}</a></li>",
                                url, title);
                        }
                        else
                        {
                            desktopNav.AppendFormat(
                                "<li class='group relative'>" +
                                "<button class='hover:text-orange-400 flex items-center gap-1'>{0} " +
                                "<i class='fas fa-chevron-down text-[10px]'></i></button>",
                                title);

                            desktopNav.Append(
                                "<div class='absolute hidden group-hover:block bg-white text-gray-800 " +
                                "shadow-xl rounded-lg p-4 min-w-[200px] top-full left-0'>");

                            foreach (DataRow child in children)
                            {
                                desktopNav.AppendFormat(
                                    "<a href='{0}' class='block py-2 hover:text-orange-500'>{1}</a>",
                                    child["Navurl"], child["Title"]);
                            }

                            desktopNav.Append("</div></li>");
                        }
                    }

                    _LiteralNavDesktop.Text = desktopNav.ToString();
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}
