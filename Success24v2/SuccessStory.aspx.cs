using System;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;

namespace Success24v2
{
    public partial class SuccessStory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                string logoPositionClass = "right-3 top-3";
                string logoSizeClass = "h-10";
                string logoContainerPadding = "p-1";

                DataTable dt = Utility._GetDataTable("SELECT * FROM Placement ORDER BY Batch DESC, [OrderBy] DESC");
                _LiteralSuccess.Text = dt.Rows.Count.ToString();

                var sb = new StringBuilder();

                foreach (DataRow dr in dt.Rows)
                {
                    string photo = Convert.ToString(dr["ImageURL"]);
                    if (string.IsNullOrWhiteSpace(photo)) photo = "/img/default-avatar.jpg";

                    string logo = "";
                    string[] logoCandidates = { "CompanyLogo", "LogoUrl", "Logo", "CompanyLogoURL", "LogoImage" };
                    foreach (var c in logoCandidates)
                    {
                        if (dr.Table.Columns.Contains(c) && !String.IsNullOrEmpty(Convert.ToString(dr[c])))
                        {
                            logo = Convert.ToString(dr[c]);
                            break;
                        }
                    }

                    string name = Convert.ToString(dr["Title"]);
                    string company = Convert.ToString(dr["Company"]);
                    string location = Convert.ToString(dr["Location"]);
                    string salary = Convert.ToString(dr["salary"]);
                    string batch = Convert.ToString(dr["Batch"]);

                    string companyText = company + (string.IsNullOrEmpty(location) ? "" : ", " + location);

                    string logoHtml = String.Empty;
                    if (!String.IsNullOrEmpty(logo))
                    {
                        logoHtml = $"<div class='absolute {logoPositionClass} bg-white rounded-md {logoContainerPadding} shadow-sm flex items-center justify-center'><img src='{HttpUtility.HtmlAttributeEncode(logo)}' alt='company logo' class='{logoSizeClass} w-auto object-contain' /></div>";
                    }

                    sb.AppendFormat(@"
                         <div class='bg-white card border border-gray-200 shadow-sm overflow-visible rounded-lg'>
                              <div class='relative'>
                                   <div class='bg-orange-200 h-28 rounded-t-lg'></div>
                                     {0}
                                   </div>

                                       <div class='-mt-16 flex justify-center relative z-20'>
                                          <img src='{1}' alt='{2}' class='w-32 h-32 rounded-full border-4 border-white object-cover shadow-md' />
                                        </div>

                                       <div class='px-6 pb-6 pt-4 text-gray-800'>
                                       <div class='font-semibold text-gray-900 mb-2'>Name: {2}</div>
                                       <div class='text-sm text-gray-700 mb-2'><strong>Company:</strong> {3}</div>
                                       <div class='text-sm text-gray-600'><strong>Salary:</strong> {4}/- &nbsp;&nbsp; <strong>Batch:</strong> {5}</div>
                                  </div>
                               </div>",
                        logoHtml,
                        HttpUtility.HtmlAttributeEncode(photo),
                        HttpUtility.HtmlEncode(name),
                        HttpUtility.HtmlEncode(companyText),
                        HttpUtility.HtmlEncode(salary),
                        HttpUtility.HtmlEncode(batch)
                    );
                }
                Literal1.Text = sb.ToString();
                dt = Utility._GetDataTable("select count(ID) as Active from student where Active=1");
                _LiteralPrac.Text = dt.Rows[0][0].ToString();
            }
        }
    }
}