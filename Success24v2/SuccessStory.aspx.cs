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
                try
                {
                    // Load placement rows
                    DataTable dt = Utility._GetDataTable("SELECT * FROM Placement ORDER BY Batch DESC, OrderBy DESC");
                    int successCount = (dt != null) ? dt.Rows.Count : 0;

                    // Build cards
                    var sb = new StringBuilder();
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        int delayStep = 1;
                        foreach (DataRow dr in dt.Rows)
                        {
                            string image = HttpUtility.HtmlEncode(Convert.ToString(dr["ImageURL"]));
                            if (string.IsNullOrWhiteSpace(image))
                                image = "img/placeholder.png";

                            string salary = HttpUtility.HtmlEncode(Convert.ToString(dr["salary"]));
                            if (string.IsNullOrWhiteSpace(salary))
                                salary = "N/A";

                            string location = HttpUtility.HtmlEncode(Convert.ToString(dr["Location"]));
                            if (string.IsNullOrWhiteSpace(location))
                                location = "Unknown";

                            string title = HttpUtility.HtmlEncode(Convert.ToString(dr["Title"])).ToUpperInvariant();
                            string company = HttpUtility.HtmlEncode(Convert.ToString(dr["Company"]));
                            string batch = HttpUtility.HtmlEncode(Convert.ToString(dr["Batch"]));

                            sb.AppendFormat(@"
                            <div class=""col-md-6 col-lg-4 col-xl-3 wow fadeInUp"" data-wow-delay=""0.{0}s"">
                                <div class=""event-item rounded shadow-sm bg-white border h-100"">
                                    
                                    <div class=""card-img-wrap"">
                                        <img src=""{1}"" alt=""{2}"" />
                                        <div class=""bg-primary text-white fw-bold rounded position-absolute p-2"" style=""top: 10px; right: 10px; z-index:2;"">{6}</div>
                                        <div class=""d-flex justify-content-between bg-white px-2 py-2 position-absolute w-100"" style=""bottom: 0; left: 0; opacity: 0.9;"">
                                            <span class=""text-dark small fw-bold""><i class=""fas fa-rupee-sign text-primary""></i> {3}</span>
                                            <span class=""text-dark small fw-bold""><i class=""fas fa-map-marker-alt text-primary""></i> {4}</span>
                                        </div>
                                    </div>

                                    <div class=""p-4 text-center mt-auto"">
                                        <h5 class=""mb-1 fw-bold text-dark"">{2}</h5>
                                        <p class=""mb-0 text-primary fw-bold"">{5}</p>
                                    </div>

                                </div>
                            </div>", delayStep, image, title, salary, location, company, batch);

                            delayStep = (delayStep % 9) + 1;
                        }
                    }
                    else
                    {
                        sb.Append(@"<div class=""col-12""><div class=""alert alert-info mb-0"">No success stories found.</div></div>");
                    }

                    Literal1.Text = sb.ToString();

                    dt = Utility._GetDataTable("SELECT COUNT(ID) AS Active FROM student WHERE Active = 1");
                    int practCount = (dt != null && dt.Rows.Count > 0) ? Convert.ToInt32(dt.Rows[0][0]) : 0;

                    _LiteralSuccess.Text = successCount.ToString();
                    _LiteralPrac.Text = practCount.ToString();
                }
                catch (Exception)
                {
                    Literal1.Text = @"<div class=""col-12""><div class=""alert alert-danger"">Unable to load stories right now.</div></div>";
                    _LiteralSuccess.Text = "0";
                    _LiteralPrac.Text = "0";
                }
            }
        }
    }
}