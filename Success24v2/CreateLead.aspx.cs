using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class CreateLead : System.Web.UI.Page
    {
        private readonly string connectionString =
           ConfigurationManager
           .ConnectionStrings["S24"]
           .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Only Admin should access this page
            if (Session["UserID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (Session["Role"] == null ||
                !Session["Role"].ToString()
                    .Equals(
                        "Admin",
                        StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("MyLeads.aspx");
                return;
            }

        }

        private void ClearForm()
        {
            txtName.Text = "";

            txtEmail.Text = "";

            txtPhone.Text = "";

            txtQualification.Text = "";

            txtStream.Text = "";

            txtPassingYear.Text = "";
        }


        private void ShowMessage(
            string message,
            bool success)
        {
            lblMessage.Text = message;

            lblMessage.CssClass =
                success
                    ? "message success-message"
                    : "message error-message";
        }

        protected void btnSaveLead_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string qualification = txtQualification.Text.Trim();
            string stream = txtStream.Text.Trim();

            // Passing Year validation
            int? passingYear = null;
            string passingYearText = txtPassingYear.Text.Trim();

            if (!string.IsNullOrWhiteSpace(passingYearText))
            {
                if (!Regex.IsMatch(passingYearText, @"^[0-9]{4}$"))
                {
                    ShowMessage(
                        "Passing Year must be exactly 4 digits. Example: 2020",
                        false);
                    return;
                }

                int year = Convert.ToInt32(passingYearText);

                if (year < 1900 || year > DateTime.Now.Year + 1)
                {
                    ShowMessage("Please enter a valid passing year.", false);
                    return;
                }

                passingYear = year;
            }

            // Name validation
            if (!Regex.IsMatch(name, @"^[A-Za-z ]+$"))
            {
                ShowMessage(
                    "Full Name should contain alphabets only.",
                    false);
                return;
            }

            // Phone validation
            if (!Regex.IsMatch(phone, @"^[0-9]{10}$"))
            {
                ShowMessage(
                    "Phone number must contain exactly 10 digits.",
                    false);
                return;
            }

            // Email validation
            string emailPattern =
                @"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$";

            if (!Regex.IsMatch(email, emailPattern))
            {
                ShowMessage(
                    "Please enter a valid email address.",
                    false);
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    using (SqlTransaction transaction =
                        con.BeginTransaction(IsolationLevel.Serializable))
                    {
                        try
                        {
                            // Duplicate check:
                            // Name + Phone + Email
                            // Stream, Qualification and PassingYear are ignored.

                            string checkQuery = @"
                        SELECT TOP (1) ID
                        FROM dbo.Leads WITH (UPDLOCK, HOLDLOCK)
                        WHERE LOWER(LTRIM(RTRIM(ISNULL(Name, ''))))
                                  = LOWER(LTRIM(RTRIM(@Name))
                            )
                          AND LTRIM(RTRIM(ISNULL(Phone, '')))
                                  = LTRIM(RTRIM(@Phone))
                          AND LOWER(LTRIM(RTRIM(ISNULL(Email, ''))))
                                  = LOWER(LTRIM(RTRIM(@Email)));
                    ";

                            using (SqlCommand checkCmd =
                                new SqlCommand(checkQuery, con, transaction))
                            {
                                checkCmd.Parameters.Add(
                                    "@Name", SqlDbType.VarChar, 250).Value = name;

                                checkCmd.Parameters.Add(
                                    "@Phone", SqlDbType.VarChar, 20).Value = phone;

                                checkCmd.Parameters.Add(
                                    "@Email", SqlDbType.VarChar, 250).Value = email;

                                object existingLead = checkCmd.ExecuteScalar();

                                if (existingLead != null &&
                                    existingLead != DBNull.Value)
                                {
                                    transaction.Rollback();

                                    ShowMessage(
                                        "Duplicate lead! This Name, Phone and Email already exist.",
                                        false);
                                    return;
                                }
                            }

                            // Insert lead only when no matching record exists
                            string insertQuery = @"
                        INSERT INTO dbo.Leads
                        (
                            Name,
                            Email,
                            Phone,
                            Qualification,
                            Stream,
                            PassingYear,
                            Status,
                            CreatedOn
                        )
                        VALUES
                        (
                            @Name,
                            @Email,
                            @Phone,
                            @Qualification,
                            @Stream,
                            @PassingYear,
                            'New',
                            GETDATE()
                        );

                        SELECT CAST(SCOPE_IDENTITY() AS BIGINT);
                    ";

                            long newLeadID;

                            using (SqlCommand cmd =
                                new SqlCommand(insertQuery, con, transaction))
                            {
                                cmd.Parameters.Add(
                                    "@Name", SqlDbType.VarChar, 250).Value = name;

                                cmd.Parameters.Add(
                                    "@Email", SqlDbType.VarChar, 250).Value = email;

                                cmd.Parameters.Add(
                                    "@Phone", SqlDbType.VarChar, 20).Value = phone;

                                cmd.Parameters.Add(
                                    "@Qualification", SqlDbType.VarChar, 250).Value =
                                    string.IsNullOrWhiteSpace(qualification)
                                        ? (object)DBNull.Value
                                        : qualification;

                                cmd.Parameters.Add(
                                    "@Stream", SqlDbType.VarChar, 250).Value =
                                    string.IsNullOrWhiteSpace(stream)
                                        ? (object)DBNull.Value
                                        : stream;

                                cmd.Parameters.Add(
                                    "@PassingYear", SqlDbType.Int).Value =
                                    passingYear.HasValue
                                        ? (object)passingYear.Value
                                        : DBNull.Value;

                                newLeadID = Convert.ToInt64(cmd.ExecuteScalar());
                            }

                            transaction.Commit();

                            ShowMessage(
                                "Lead created successfully. Lead ID: " + newLeadID,
                                true);

                            ClearForm();
                        }
                        catch
                        {
                            try
                            {
                                transaction.Rollback();
                            }
                            catch
                            {
                                // Transaction may already be completed.
                            }

                            throw;
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                // Log ex on the server in production.
                System.Diagnostics.Trace.TraceError(
                    "CreateLead SQL error: " + ex);

                ShowMessage(
                    "Unable to create lead. Please try again.",
                    false);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.TraceError(
                    "CreateLead error: " + ex);

                ShowMessage(
                    "Unable to create lead. Please try again.",
                    false);
            }


        }
    }
}