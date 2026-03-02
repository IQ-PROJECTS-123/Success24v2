using System;
using System.Data;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Diagnostics;
using System.Configuration;

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
                    // read route value (if any)
                    string slug = Page.RouteData.Values["Slug"] as string ?? string.Empty;
                    if (!string.IsNullOrEmpty(slug))
                    {
                        // For debugging / diagnostics; replace with filtering logic as needed.
                        global::System.Diagnostics.Trace.WriteLine($"SuccessStory: route slug = '{slug}'");
                        // TODO: use 'slug' to filter the placement query (e.g., WHERE SlugColumn = @slug)
                    }

                    // Build URL helper using same logic as in 24.Master.cs
                    string host = Convert.ToString(ConfigurationManager.AppSettings["HostURL"] ?? "").TrimEnd('/');
                    string city = Convert.ToString(Session["City"] ?? "").Trim();
                    if (string.IsNullOrEmpty(city))
                        city = Convert.ToString(ConfigurationManager.AppSettings["DefaultCity"] ?? "").Trim();
                    string citySlug = string.IsNullOrEmpty(city) ? "" : city.Replace(" ", "-");

                    string BuildUrl(string rawNavUrl, bool includeCity)
                    {
                        if (string.IsNullOrWhiteSpace(rawNavUrl))
                            return host + (includeCity && !string.IsNullOrEmpty(citySlug) ? "/" + citySlug : "");

                        string nav = rawNavUrl.Replace("_#City#_", city).Trim();
                        nav = nav.TrimStart('/').Replace(" ", "-");

                        if (nav.StartsWith("http://", StringComparison.OrdinalIgnoreCase) ||
                            nav.StartsWith("https://", StringComparison.OrdinalIgnoreCase))
                            return nav;

                        if (includeCity && !string.IsNullOrEmpty(citySlug))
                            return host + "/" + citySlug + "/" + nav;

                        return host + "/" + nav;
                    }

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

                            // Use raw title for slug generation, display title uppercase
                            string rawTitle = Convert.ToString(dr["Title"] ?? "");
                            string title = HttpUtility.HtmlEncode(rawTitle).ToUpperInvariant();
                            string company = HttpUtility.HtmlEncode(Convert.ToString(dr["Company"]));
                            string batch = HttpUtility.HtmlEncode(Convert.ToString(dr["Batch"]));

                            // generate slug using same Utility method pattern as master page
                            string itemSlug = string.IsNullOrWhiteSpace(rawTitle) ? "placement" : Utility.GenerateSlug(rawTitle).ToLowerInvariant();
                            string nav = $"Placements/{itemSlug}";

                            // Build final absolute (or relative-to-host) URL
                            string placementUrl = BuildUrl(nav, includeCity: false);
                            string encodedPlacementUrl = HttpUtility.HtmlAttributeEncode(placementUrl);

                            sb.AppendFormat(@"
                            <div class=""col-md-6 col-lg-4 col-xl-3 wow fadeInUp"" data-wow-delay=""0.{0}s"">
                                <a href=""{7}"" class=""text-decoration-none"">
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
                                </a>
                            </div>", delayStep, image, title, salary, location, company, batch, encodedPlacementUrl);

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