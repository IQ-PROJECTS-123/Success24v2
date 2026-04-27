using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Success24v2
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        private readonly string conStr = ConfigurationManager.ConnectionStrings["S24"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // If already logged in, send to admin panel
            if (!IsPostBack && Session["AdminID"] != null)
            {
                Response.Redirect("AdminDashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrWhiteSpace(userName) || string.IsNullOrWhiteSpace(password))
            {
                ShowMessage("Please enter username and password.", false);
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"
                    SELECT ID, FullName, UserName, PasswordHash, PasswordSalt, IsActive
                    FROM dbo.AdminUsers
                    WHERE UserName = @UserName";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserName", userName);

                    con.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (!dr.Read())
                        {
                            ShowMessage("Admin user not found.", false);
                            return;
                        }

                        bool isActive = Convert.ToBoolean(dr["IsActive"]);
                        if (!isActive)
                        {
                            ShowMessage("This admin account is inactive.", false);
                            return;
                        }

                        string storedHash = Convert.ToString(dr["PasswordHash"]);
                        string storedSalt = Convert.ToString(dr["PasswordSalt"]);

                        bool isValidPassword = SecurityHelper.VerifyPassword(password, storedHash, storedSalt);

                        if (!isValidPassword)
                        {
                            ShowMessage("Invalid password.", false);
                            return;
                        }

                        Session["AdminID"] = Convert.ToInt32(dr["ID"]);
                        Session["AdminName"] = Convert.ToString(dr["FullName"]);
                        Session["AdminUserName"] = Convert.ToString(dr["UserName"]);
                    }
                }
            }

            Response.Redirect("AdminDashboard.aspx");
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = isSuccess ? "msg msg-success" : "msg msg-error";
        }
    }
}