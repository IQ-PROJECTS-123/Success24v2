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


        // Detect known link-preview crawlers.
        private bool IsLinkPreviewCrawler()
        {
            string userAgent = Request.UserAgent ?? "";

            string[] crawlerNames =
            {
                "WhatsApp",
                "facebookexternalhit",
                "Facebot",
                "Twitterbot",
                "LinkedInBot",
                "TelegramBot",
                "Slackbot",
                "Discordbot",
                "SkypeUriPreview",
                "Pinterest",
                "Google-InspectionTool"
            };

            foreach (string crawler in crawlerNames)
            {
                if (userAgent.IndexOf(
                    crawler,
                    StringComparison.OrdinalIgnoreCase) >= 0)
                {
                    return true;
                }
            }

            return false;
        }

        private bool IsValidGid(string gid)
        {
            if (string.IsNullOrWhiteSpace(gid) || gid.Length != 64)
                return false;

            foreach (char c in gid)
            {
                bool isHex =
                    (c >= '0' && c <= '9') ||
                    (c >= 'a' && c <= 'f') ||
                    (c >= 'A' && c <= 'F');

                if (!isHex)
                    return false;
            }

            return true;
        }

        private bool AuthorizeSuccessStory()
        {
            // Existing logged-in placement user access.
            bool isPlacementUser =
                Session["IsPlacementUser"] != null &&
                Convert.ToBoolean(Session["IsPlacementUser"]);

            if (isPlacementUser)
                return true;

            string gid = Request.QueryString["id"];

            if (!IsValidGid(gid))
            {
                DenySuccessStoryAccess();
                return false;
            }

            // Allow postbacks in the same session after authorization.
            if (IsPostBack &&
                Session["SuccessStoryLinkGid"] != null &&
                string.Equals(
                    Convert.ToString(Session["SuccessStoryLinkGid"]),
                    gid,
                    StringComparison.OrdinalIgnoreCase))
            {
                return true;
            }

            string cs = ConfigurationManager
                .ConnectionStrings["S24"].ConnectionString;

            try
            {
                // Preview crawlers check the token without consuming it.
                if (IsLinkPreviewCrawler())
                {
                    using (SqlConnection con = new SqlConnection(cs))
                    using (SqlCommand cmd = new SqlCommand(@"
                        SELECT COUNT(1)
                        FROM dbo.SuccessStoryLinks
                        WHERE gID = @gid
                          AND IsUsed = 0;", con))
                    {
                        cmd.Parameters.Add(
                            "@gid", SqlDbType.NVarChar, 64).Value = gid;

                        con.Open();

                        int count = Convert.ToInt32(cmd.ExecuteScalar());

                        if (count == 1)
                            return true;
                    }

                    DenySuccessStoryAccess();
                    return false;
                }

                // Normal browser request: consume the token once.
                using (SqlConnection con = new SqlConnection(cs))
                using (SqlCommand cmd = new SqlCommand(@"
                    DELETE FROM dbo.SuccessStoryLinks
                    WHERE gID = @gid
                      AND IsUsed = 0;", con))
                {
                    cmd.Parameters.Add(
                        "@gid", SqlDbType.NVarChar, 64).Value = gid;

                    con.Open();

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected == 1)
                    {
                        Session["SuccessStoryLinkGid"] = gid;
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.TraceError(
                    "SuccessStory authorization failed: " + ex);
            }

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