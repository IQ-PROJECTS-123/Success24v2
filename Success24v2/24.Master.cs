    using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class _24 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    DataTable _DataTable = Utility._GetDataTable24("Select * from SiteNavigation where Active=1 order by Orderby");
            //    foreach (DataRow dr in _DataTable.Rows)
            //    {
            //        if (String.IsNullOrEmpty(Convert.ToString(dr["ParentID"])) && String.IsNullOrEmpty(Convert.ToString(dr["dropdownnav"])))
            //            _LiteralNav.Text += String.Format("<a href='{0}' class='nav-item nav-link'>{1}</a>", Convert.ToString(dr["Navurl"]), Convert.ToString(dr["Title"]));
            //        else
            //        {
            //            if (String.IsNullOrEmpty(Convert.ToString(dr["ParentID"])) && !String.IsNullOrEmpty(Convert.ToString(dr["dropdownnav"])))
            //            {
            //                _LiteralNav.Text += String.Format(@"<div class='nav-item dropdown'><a href='#' class='nav-link dropdown-toggle' data-bs-toggle='dropdown'>{0}</a><div class='dropdown-menu m-0'>", Convert.ToString(dr["Title"]));
            //                DataRow[] _Rows = _DataTable.Select("ParentID=" + Convert.ToString(dr["ID"]));
            //                foreach (DataRow dr1 in _Rows)
            //                {
            //                    _LiteralNav.Text += String.Format("<a href='{0}' class='dropdown-item'>{1}</a>", Convert.ToString(dr1["Navurl"]), Convert.ToString(dr1["Title"]));
            //                }
            //                _LiteralNav.Text += "</div></div>";
            //            }

            //        }
            //    }
            //}
        }
    }
}