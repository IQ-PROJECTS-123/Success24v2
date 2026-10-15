using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class EditLeads : System.Web.UI.Page
    {
        private readonly string connectionString =
            ConfigurationManager.ConnectionStrings["S24"].ConnectionString;

        private int LeadID
        {
            get
            {
                int id;
                return int.TryParse(Request.QueryString["id"], out id) && id > 0
                    ? id : 0;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null ||
               Session["Role"] == null ||
               !Session["Role"].ToString().Equals(
                   "Admin", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("~/AdminLogin.aspx");
                return;
            }

            if (LeadID == 0)
            {
                Response.Redirect("~/LeadManagement.aspx");
                return;
            }

            if (!IsPostBack)
                LoadLead();
        }

        private void LoadLead()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(@"
                SELECT ID, Name, Email, Phone, Qualification, Stream, PassingYear
                FROM dbo.Leads
                WHERE ID = @ID", con))
            {
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = LeadID;
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (!reader.Read())
                    {
                        Response.Redirect("~/LeadManagement.aspx");
                        return;
                    }

                    txtName.Text = Convert.ToString(reader["Name"]);
                    txtEmail.Text = Convert.ToString(reader["Email"]);
                    txtPhone.Text = Convert.ToString(reader["Phone"]);
                    txtQualification.Text =
                        reader["Qualification"] == DBNull.Value
                        ? "" : Convert.ToString(reader["Qualification"]);
                    txtStream.Text =
                        reader["Stream"] == DBNull.Value
                        ? "" : Convert.ToString(reader["Stream"]);
                    txtPassingYear.Text =
                        reader["PassingYear"] == DBNull.Value
                        ? "" : Convert.ToString(reader["PassingYear"]);
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string qualification = txtQualification.Text.Trim();
            string stream = txtStream.Text.Trim();
            string yearText = txtPassingYear.Text.Trim();

            if (string.IsNullOrWhiteSpace(name) ||
                !Regex.IsMatch(name, @"^[A-Za-z ]+$"))
            {
                ShowMessage("Enter a valid name using English letters and spaces.", false);
                return;
            }

            if (!Regex.IsMatch(email,
                @"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"))
            {
                ShowMessage("Enter a valid email address.", false);
                return;
            }

            if (!Regex.IsMatch(phone, @"^[0-9]{10}$"))
            {
                ShowMessage("Phone number must contain exactly 10 digits.", false);
                return;
            }

            int? passingYear = null;

            if (!string.IsNullOrWhiteSpace(yearText))
            {
                int year;

                if (!Regex.IsMatch(yearText, @"^[0-9]{4}$") ||
                    !int.TryParse(yearText, out year) ||
                    year < 1900 || year > DateTime.Now.Year + 1)
                {
                    ShowMessage("Enter a valid 4-digit passing year.", false);
                    return;
                }

                passingYear = year;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand(@"
                    UPDATE dbo.Leads
                    SET Name = @Name,
                        Email = @Email,
                        Phone = @Phone,
                        Qualification = @Qualification,
                        Stream = @Stream,
                        PassingYear = @PassingYear
                    WHERE ID = @ID", con))
                {
                    cmd.Parameters.Add("@Name", SqlDbType.VarChar, 250).Value = name;
                    cmd.Parameters.Add("@Email", SqlDbType.VarChar, 250).Value = email;
                    cmd.Parameters.Add("@Phone", SqlDbType.VarChar, 20).Value = phone;

                    cmd.Parameters.Add("@Qualification", SqlDbType.VarChar, 250).Value =
                        string.IsNullOrWhiteSpace(qualification)
                        ? (object)DBNull.Value : qualification;

                    cmd.Parameters.Add("@Stream", SqlDbType.VarChar, 250).Value =
                        string.IsNullOrWhiteSpace(stream)
                        ? (object)DBNull.Value : stream;

                    cmd.Parameters.Add("@PassingYear", SqlDbType.Int).Value =
                        passingYear.HasValue
                        ? (object)passingYear.Value : DBNull.Value;

                    cmd.Parameters.Add("@ID", SqlDbType.Int).Value = LeadID;

                    con.Open();

                    if (cmd.ExecuteNonQuery() == 0)
                    {
                        ShowMessage("Lead not found. It may have been deleted.", false);
                        return;
                    }
                }

                Response.Redirect("~/LeadManagement.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.TraceError("Edit lead error: " + ex);
                ShowMessage("Unable to update lead. Please try again.", false);
            }
        }

        private void ShowMessage(string message, bool success)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = success
                ? "edit-message edit-success"
                : "edit-message edit-error";

        }
    }
}