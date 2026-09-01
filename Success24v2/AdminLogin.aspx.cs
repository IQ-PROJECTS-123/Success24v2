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

            // Special Placement Login
            if (userName.Equals("iqindia", StringComparison.OrdinalIgnoreCase)
                && password == "iqindia123#")
            {
                Session["StudentID"] = "success24";
                Session["StudentName"] = "Placement User";
                Session["IsPlacementUser"] = true;

                Response.Redirect("SuccessStory.aspx");
                return;
            }

            // ==========================================
            // STATIC ADMIN LOGIN
            // ==========================================
            if (userName == "admin" && password == "Shri@123")
            {
                Session["UserID"] = 0;
                Session["UserName"] = "Admin";
                Session["Role"] = "Admin";

                Response.Redirect("LeadManagement.aspx");
                return;
            }

            // ==========================================
            // STATIC ADMIN LOGIN
            // ==========================================
            if (userName == "admin" && password == "Success24@123")
            {
                Session["UserID"] = 0;
                Session["UserName"] = "Admin";
                Session["Role"] = "Admin";

                Response.Redirect("AdminPanel.aspx");
                return;
            }
            // ==========================================
            // Caller / Admin Login - Users Table
            // ==========================================
            using (SqlConnection userCon = new SqlConnection(conStr))
            {
                userCon.Open();

                string userQuery = @" SELECT ID, Name, Email, Password, Role, IsActive FROM Members WHERE Email = @UserName";

                using (SqlCommand userCmd = new SqlCommand(userQuery, userCon))
                {
                    userCmd.Parameters.AddWithValue("@UserName", userName);

                    using (SqlDataReader userDr = userCmd.ExecuteReader())
                    {
                        if (userDr.Read())
                        {
                            bool isActive = Convert.ToBoolean(userDr["IsActive"]);

                            if (!isActive)
                            {
                                ShowMessage("Your account is inactive.", false);
                                return;
                            }

                            string storedPassword =
                                Convert.ToString(userDr["Password"]);

                            if (password == storedPassword)
                            {
                                // ADD CALLER SESSION
                                Session["UserID"] =
                                    Convert.ToInt32(userDr["ID"]);

                                Session["UserName"] =
                                    Convert.ToString(userDr["Name"]);

                                Session["Role"] =
                                    Convert.ToString(userDr["Role"]);

                                string role =
                                    Convert.ToString(userDr["Role"]);

                                if (role.Equals(
                                    "Admin",
                                    StringComparison.OrdinalIgnoreCase))
                                {
                                    Response.Redirect("LeadManagement.aspx");
                                }
                                else
                                {
                                    Response.Redirect("MyLeads.aspx");
                                }

                                return;
                            }

                            ShowMessage("Invalid password.", false);
                            return;
                        }
                    }
                }
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"SELECT ID, FullName, UserName, PasswordHash, PasswordSalt, IsActive FROM dbo.AdminUsers WHERE UserName = @UserName";

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