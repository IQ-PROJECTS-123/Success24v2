using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Success24v2
{
    public partial class Signup : System.Web.UI.Page
    {
        private readonly string conStr = ConfigurationManager.ConnectionStrings["S24"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            // 🔹 BASIC VALIDATION
            if (string.IsNullOrWhiteSpace(fullName) ||
                string.IsNullOrWhiteSpace(mobile) ||
                string.IsNullOrWhiteSpace(password))
            {
                ShowMessage("Please fill all required fields.", false);
                return;
            }

            if (password != confirmPassword)
            {
                ShowMessage("Password and confirm password do not match.", false);
                return;
            }

            // 🔥 UPDATED PASSWORD RULE (MIN 8 + STRONG)
            if (!IsValidPassword(password))
            {
                ShowMessage("Password must be at least 8 characters and include uppercase, lowercase, number, and special character.", false);
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                // 🔹 CHECK IF USER EXISTS
                string checkQuery = @"SELECT COUNT(*) 
                                      FROM StudentRegistration 
                                      WHERE PrimaryMobile = @PrimaryMobile OR Email1 = @Email1";

                using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@PrimaryMobile", mobile);
                    checkCmd.Parameters.AddWithValue("@Email1", email);

                    int exists = Convert.ToInt32(checkCmd.ExecuteScalar());

                    if (exists > 0)
                    {
                        ShowMessage("An account with this mobile number or email already exists.", false);
                        return;
                    }
                }

                // 🔹 PASSWORD HASHING
                string salt = GenerateSalt();
                string hash = HashPassword(password, salt);

                // 🔹 SPLIT NAME
                string[] parts = fullName.Split(new char[] { ' ' }, 2, StringSplitOptions.RemoveEmptyEntries);
                string firstName = parts.Length > 0 ? parts[0] : fullName;
                string lastName = parts.Length > 1 ? parts[1] : "";

                // 🔹 INSERT USER
                string insertQuery = @"
                INSERT INTO StudentRegistration
                (
                    FirstName, LastName, Email1, PrimaryMobile,
                    PasswordHash, PasswordSalt, IsLoginActive,
                    LoginCreatedOn, CurrentStep, CompletionPercent,
                    IsProfileCompleted, CreatedOn, Active, VerificationStatus
                )
                VALUES
                (
                    @FirstName, @LastName, @Email1, @PrimaryMobile,
                    @PasswordHash, @PasswordSalt, 1,
                    GETDATE(), 1, 0,
                    0, GETDATE(), 1, 'Draft'
                );
                SELECT SCOPE_IDENTITY();";

                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Email1", email);
                    cmd.Parameters.AddWithValue("@PrimaryMobile", mobile);
                    cmd.Parameters.AddWithValue("@PasswordHash", hash);
                    cmd.Parameters.AddWithValue("@PasswordSalt", salt);

                    int studentId = Convert.ToInt32(cmd.ExecuteScalar());

                    Session["StudentID"] = studentId;
                    Session["StudentName"] = fullName;

                    Response.Redirect("Login.aspx");
                }
            }
        }

        // 🔐 PASSWORD VALIDATION
        private bool IsValidPassword(string password)
        {
            if (string.IsNullOrWhiteSpace(password) || password.Length < 8)
                return false;

            bool hasUpper = false;
            bool hasLower = false;
            bool hasDigit = false;
            bool hasSpecial = false;

            foreach (char c in password)
            {
                if (char.IsUpper(c)) hasUpper = true;
                else if (char.IsLower(c)) hasLower = true;
                else if (char.IsDigit(c)) hasDigit = true;
                else hasSpecial = true;
            }

            return hasUpper && hasLower && hasDigit && hasSpecial;
        }

        // 🔐 SALT GENERATION
        private string GenerateSalt()
        {
            return Guid.NewGuid().ToString();
        }

        // 🔐 HASH PASSWORD
        private string HashPassword(string password, string salt)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                var combined = System.Text.Encoding.UTF8.GetBytes(password + salt);
                var hash = sha256.ComputeHash(combined);
                return Convert.ToBase64String(hash);
            }
        }

        // 🔔 MESSAGE DISPLAY
        private void ShowMessage(string text, bool success)
        {
            lblMessage.Text = text;
            lblMessage.CssClass = success ? "msg msg-success" : "msg msg-error";
        }
    }
}