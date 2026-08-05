using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Success24v2
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly string conStr = ConfigurationManager.ConnectionStrings["S24"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Clear();
                Session.Abandon();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrWhiteSpace(userName) || string.IsNullOrWhiteSpace(password))
            {
                ShowMessage("Please enter your login details.", false);
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
            // Caller / Admin Login - Users Table
            // ==========================================
            using (SqlConnection userCon = new SqlConnection(conStr))
            {
                userCon.Open();

                string userQuery = @"
        SELECT ID, Name, Email, Password, Role, IsActive
        FROM Members
        WHERE Email = @UserName";

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
            //use it in fututre it is commented by me
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                string query = @"SELECT ID, FirstName, LastName, PasswordHash, PasswordSalt, IsLoginActive
                                 FROM StudentRegistration
                                 WHERE (PrimaryMobile = @UserName OR Email1 = @UserName)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserName", userName);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            bool isActive = Convert.ToBoolean(dr["IsLoginActive"]);
                            if (!isActive)
                            {
                                ShowMessage("Your login is inactive. Please contact support.", false);
                                return;
                            }

                            string storedHash = Convert.ToString(dr["PasswordHash"]);
                            string storedSalt = Convert.ToString(dr["PasswordSalt"]);

                            if (SecurityHelper.VerifyPassword(password, storedHash, storedSalt))
                            {
                                Session["StudentID"] = Convert.ToInt32(dr["ID"]);
                                Session["StudentName"] = Convert.ToString(dr["FirstName"]) + " " + Convert.ToString(dr["LastName"]);
                                dr.Close();

                                string updateLogin = "UPDATE StudentRegistration SET LastLoginOn = GETDATE() WHERE ID = @ID";
                                using (SqlCommand updateCmd = new SqlCommand(updateLogin, con))
                                {
                                    updateCmd.Parameters.AddWithValue("@ID", Convert.ToInt32(Session["StudentID"]));
                                    updateCmd.ExecuteNonQuery();
                                }

                                Response.Redirect("RegistartionForm.aspx");
                            }
                            else
                            {
                                ShowMessage("Invalid password.", false);
                            }
                        }
                        else
                        {
                            ShowMessage("No account found with this email or mobile number.", false);
                        }
                    }
                }
            }
        }

        private void ShowMessage(string text, bool success)
        {
            lblMessage.Text = text;
            lblMessage.CssClass = success ? "msg msg-success" : "msg msg-error";
        }
    }
}