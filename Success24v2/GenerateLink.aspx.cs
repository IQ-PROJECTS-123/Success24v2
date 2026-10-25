using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class GenerateLink : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsAdminOrCallerLoggedIn())
            {
                Response.Redirect("~/AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                pnlGenerated.Visible = false;
                lblMessage.Text = "";
            }
        }

        private bool IsAdminOrCallerLoggedIn()
        {
            // AdminUsers table se logged-in Admin
            if (Session["AdminID"] != null)
                return true;

            // Members table se logged-in Admin/Caller
            if (Session["UserID"] != null && Session["Role"] != null)
            {
                string role = Convert.ToString(Session["Role"]);

                return role.Equals("Admin", StringComparison.OrdinalIgnoreCase)
                    || role.Equals("Caller", StringComparison.OrdinalIgnoreCase);
            }

            return false;
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            // Recheck authorization when the button is clicked.
            if (!IsAdminOrCallerLoggedIn())
            {
                Response.Redirect("~/AdminLogin.aspx");
                return;
            }

            pnlGenerated.Visible = false;
            lblMessage.Text = "";
            lblMessage.CssClass = "message";

            byte[] bytes = new byte[32];

            using (RandomNumberGenerator rng =
                   RandomNumberGenerator.Create())
            {
                rng.GetBytes(bytes);
            }

            string gid = BitConverter.ToString(bytes)
                .Replace("-", "").ToLowerInvariant();

            string cs = ConfigurationManager
                .ConnectionStrings["S24"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                using (SqlCommand cmd = new SqlCommand(@"
                    INSERT INTO dbo.SuccessStoryLinks
                        (gID, CreatedByAdminID)
                    VALUES
                        (@gid, @adminId);", con))
                {
                    cmd.Parameters.Add("@gid", SqlDbType.NVarChar, 64)
                        .Value = gid;

                    int adminId;
                    if (int.TryParse(
                        Convert.ToString(Session["AdminID"]),
                        out adminId))
                    {
                        cmd.Parameters.Add("@adminId", SqlDbType.Int)
                            .Value = adminId;
                    }
                    else
                    {
                        cmd.Parameters.Add("@adminId", SqlDbType.Int)
                            .Value = DBNull.Value;
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                string url = Request.Url.GetLeftPart(UriPartial.Authority)
                    + ResolveUrl("~/successstory.aspx?id=")
                    + HttpUtility.UrlEncode(gid);

                lnkGenerated.NavigateUrl = url;
                lnkGenerated.Text = url;
                pnlGenerated.Visible = true;

                lblMessage.Text = "One-time link generated successfully.";
                lblMessage.CssClass = "message success";
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.TraceError(
                    "GenerateLink Error: " + ex);

                lblMessage.Text =
                    "Unable to generate link. Please try again.";

                lblMessage.CssClass = "message error";
            }
        }
    }
}