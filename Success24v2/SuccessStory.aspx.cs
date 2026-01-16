using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class SuccessStory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = Utility._GetDataTable("SELECT * FROM Placement ORDER BY Batch DESC, [OrderBy] DESC");
                _LiteralSuccess.Text = dt.Rows.Count.ToString();
                foreach (DataRow dr in dt.Rows)
                {
                    Literal1.Text += String.Format(@" <div class=""col-md-6 col-lg-4 col-xl-3 wow fadeInUp"" data-wow-delay=""0.1s"">
                 <div class=""event-item rounded"">
                     <div class=""position-relative"">
                         <img src=""{0}""  class=""img-fluid rounded-top w-100"" alt=""Image"">
                         <div class=""bg-primary text-white fw-bold rounded d-inline-block position-absolute p-2"" style=""top: 0; right: 0;"">{5}</div>
                         <div class=""d-flex justify-content-between border-start border-end bg-white px-2 py-2 w-100 position-absolute"" style=""bottom: 0; left: 0; opacity: 0.8;"">
                             <a href=""#"" class=""text-dark""><i class=""fas fa-rupee-sign text-primary""></i> {1}/-</a>
                             <a href=""#"" class=""text-dark""><span class=""fas fa-map-marker-alt text-primary""></span> {2}</a>
                         </div>
                     </div>
                     <div class=""border border-top-0 rounded-bottom p-4"">
                        
                         <p class=""mb-3""><b>{3}</b><br />{4}</p>                        
                     </div>
                 </div>
             </div>", Convert.ToString(dr["ImageURL"]), Convert.ToString(dr["salary"]), Convert.ToString(dr["Location"]), Convert.ToString(dr["Title"]).ToUpper(), Convert.ToString(dr["Company"]), Convert.ToString(dr["Batch"]));
                }
                dt = Utility._GetDataTable("select count(ID) as Active from student where Active=1");
                _LiteralPrac.Text = dt.Rows[0][0].ToString();
            }
        }
    }
}