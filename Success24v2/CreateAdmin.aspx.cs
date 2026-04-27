using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Success24v2
{
    public partial class CreateAdmin : System.Web.UI.Page
    {
        private readonly string conStr = ConfigurationManager.ConnectionStrings["S24"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCreateAdmin_Click(object sender, EventArgs e)
        {
            string fullName = "Main Admin";
            string userName = "admin";
            string password = "P@ssw0rd@2424";

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                // ✅ Check if admin already exists
                string checkQuery = "SELECT COUNT(*) FROM dbo.AdminUsers WHERE UserName = @UserName";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@UserName", userName);
                    int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                    if (count > 0)
                    {
                        lblMessage.Text = "⚠ Admin already exists.<br/>Username: admin<br/>Password: P@ssw0rd@2424";
                        return;
                    }
                }

                // 🔐 Generate secure hash
                string salt = SecurityHelper.GenerateSalt();
                string hash = SecurityHelper.HashPassword(password, salt);

                // ✅ Insert admin
                string insertQuery = @"
                    INSERT INTO dbo.AdminUsers
                    (FullName, UserName, PasswordHash, PasswordSalt, IsActive, CreatedOn)
                    VALUES
                    (@FullName, @UserName, @PasswordHash, @PasswordSalt, 1, GETDATE())";

                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    cmd.Parameters.AddWithValue("@FullName", fullName);
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    cmd.Parameters.AddWithValue("@PasswordHash", hash);
                    cmd.Parameters.AddWithValue("@PasswordSalt", salt);

                    cmd.ExecuteNonQuery();
                }
            }

            lblMessage.Text = "✅ Admin created successfully!<br/><br/>Username: admin<br/>Password: P@ssw0rd@2424";
        }
    }
}