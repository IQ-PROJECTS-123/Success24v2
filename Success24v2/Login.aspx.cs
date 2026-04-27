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