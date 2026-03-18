using System;

namespace Success24v2
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        // 🔐 Change these credentials as needed
        private const string ADMIN_USERNAME = "admin";
        private const string ADMIN_PASSWORD = "Success@24";

        protected void Page_Load(object sender, EventArgs e)
        {
            // If already logged in, go straight to dashboard
            if (Session["IsAdmin"] != null && (bool)Session["IsAdmin"])
                Response.Redirect("AdminDashboard.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text.Trim() == ADMIN_USERNAME &&
                txtPassword.Text.Trim() == ADMIN_PASSWORD)
            {
                Session["IsAdmin"] = true;
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                pnlError.Visible = true;
            }
        }
    }
}