using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Text;
using System.Web;
using System.Web.UI;

namespace Success24v2
{
    public partial class SuccessStory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!AuthorizeSuccessStory())
                return;
            if (!IsPostBack)
            {

                try
                {
                    // Add this line for security purpose
                    //bool isPlacementUser =
                    //   Session["IsPlacementUser"] != null &&
                    //   Convert.ToBoolean(Session["IsPlacementUser"]);

                    //if (!isPlacementUser)
                    //{
                    //    Response.Redirect("~/Login.aspx");
                    //    return;
                    //}

                    _LiteralSuccess.Text = "0";
                    _LiteralPrac.Text = "0";

                    string slug = Page.RouteData.Values["Slug"] as string ?? string.Empty;
                    if (!string.IsNullOrEmpty(slug))
                    {
                        global::System.Diagnostics.Trace.WriteLine($"Success Story: route slug = '{slug}'");
                    }

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

                    DataTable dtPlacement = Utility._GetDataTable("SELECT * FROM Placement ORDER BY Batch DESC, OrderBy DESC");

                    int successCount = 0;
                    if (dtPlacement != null)
                    {
                        successCount = dtPlacement.Rows.Count;
                    }

                    // Build cards
                    var sb = new StringBuilder();
                    if (dtPlacement != null && dtPlacement.Rows.Count > 0)
                    {
                        int delayStep = 1;

                        foreach (DataRow dr in dtPlacement.Rows)
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

                            string rawTitle = Convert.ToString(dr["Title"] ?? "");
                            string title = HttpUtility.HtmlEncode(rawTitle).ToUpperInvariant();
                            string company = HttpUtility.HtmlEncode(Convert.ToString(dr["Company"]));
                            string batch = HttpUtility.HtmlEncode(Convert.ToString(dr["Batch"]));

                            string itemSlug = string.IsNullOrWhiteSpace(rawTitle)
                                ? "Success Story"
                                : Utility.GenerateSlug(rawTitle).ToLowerInvariant();

                            string nav = $"Success Story/{itemSlug}";
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

                    // Load active student count safely
                    int practCount = 0;
                    DataTable dtStudent = Utility._GetDataTable("SELECT COUNT(ID) AS Active FROM student WHERE Active = 1");

                    if (dtStudent != null && dtStudent.Rows.Count > 0)
                    {
                        int.TryParse(Convert.ToString(dtStudent.Rows[0]["Active"]), out practCount);
                    }

                    // Final assignment - always numeric only
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


        private bool AuthorizeSuccessStory()
        {
            // Condition 1: Existing logged-in placement user
            bool isPlacementUser =
                Session["IsPlacementUser"] != null &&
                Convert.ToBoolean(Session["IsPlacementUser"]);

            if (isPlacementUser)
                return true;

            string gid = Request.QueryString["id"];

            if (string.IsNullOrWhiteSpace(gid))
            {
                DenySuccessStoryAccess();
                return false;
            }

            // Allow postbacks for the page that already consumed this link.
            if (IsPostBack &&
                Session["SuccessStoryLinkGid"] != null &&
                string.Equals(
                    Convert.ToString(Session["SuccessStoryLinkGid"]),
                    gid,
                    StringComparison.Ordinal))
            {
                return true;
            }

            string cs = ConfigurationManager
                .ConnectionStrings["S24"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                using (SqlCommand cmd = new SqlCommand(@"
            DELETE FROM dbo.SuccessStoryLinks
            WHERE gID = @gid
              AND IsUsed = 0;", con))
                {
                    cmd.Parameters.Add("@gid", SqlDbType.NVarChar, 64)
                        .Value = gid;

                    con.Open();

                    int rowsAffected = cmd.ExecuteNonQuery();

                    // Token must exist and be unused.
                    if (rowsAffected == 1)
                    {
                        // Remember the token for this page's postbacks.
                        Session["SuccessStoryLinkGid"] = gid;

                        // IMPORTANT: First access is now authorized.
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.TraceError(
                    "SuccessStory authorization failed: " + ex);
            }

            // Missing, already-consumed, or invalid token.
            DenySuccessStoryAccess();
            return false;
        }


        private void DenySuccessStoryAccess()
        {
            Response.Clear();
            Response.StatusCode = 403;
            Response.TrySkipIisCustomErrors = true;
            Response.ContentType = "text/html";

            Response.Write(@"
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset='utf-8'>
                <meta name='viewport' content='width=device-width, initial-scale=1'>
                <title>Link Expired</title>
                <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
            </head>
            <body>
            <script>
                Swal.fire({
                    icon: 'warning',
                    title: 'Link Already Used!',
                    text: 'This link is invalid or has already been used.',
                    confirmButtonText: 'OK',
                    confirmButtonColor: '#f97316',
                    allowOutsideClick: false
                }).then(function () {
                    window.location.href = 'Default.aspx';
                });
            </script>
            </body>
            </html>");

            Response.End();
        }

    }
}