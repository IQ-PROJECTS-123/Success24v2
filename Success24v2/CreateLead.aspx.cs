using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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


            string name =
                txtName.Text.Trim();

            string email =
                txtEmail.Text.Trim();

            string phone =
                txtPhone.Text.Trim();

            string qualification =
                txtQualification.Text.Trim();

            string stream =
                txtStream.Text.Trim();


            int? passingYear = null;

            int year;

            if (!string.IsNullOrWhiteSpace(
                    txtPassingYear.Text))
            {
                if (int.TryParse(
                    txtPassingYear.Text.Trim(),
                    out year))
                {
                    passingYear = year;
                }
                else
                {
                    ShowMessage(
                        "Please enter a valid passing year.",
                        false);

                    return;
                }
            }


            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"

                        INSERT INTO Leads
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

                        SELECT CAST(
                            SCOPE_IDENTITY()
                            AS BIGINT
                        );";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@Name",
                            SqlDbType.VarChar,
                            250
                        ).Value = name;


                        cmd.Parameters.Add(
                            "@Email",
                            SqlDbType.VarChar,
                            250
                        ).Value =
                            string.IsNullOrWhiteSpace(email)
                                ? (object)DBNull.Value
                                : email;


                        cmd.Parameters.Add(
                            "@Phone",
                            SqlDbType.VarChar,
                            20
                        ).Value = phone;


                        cmd.Parameters.Add(
                            "@Qualification",
                            SqlDbType.VarChar,
                            250
                        ).Value =
                            string.IsNullOrWhiteSpace(qualification)
                                ? (object)DBNull.Value
                                : qualification;


                        cmd.Parameters.Add(
                            "@Stream",
                            SqlDbType.VarChar,
                            250
                        ).Value =
                            string.IsNullOrWhiteSpace(stream)
                                ? (object)DBNull.Value
                                : stream;


                        cmd.Parameters.Add(
                            "@PassingYear",
                            SqlDbType.Int
                        ).Value =
                            passingYear.HasValue
                                ? (object)passingYear.Value
                                : DBNull.Value;


                        con.Open();


                        // ==========================================
                        // CHECK COMPLETE DUPLICATE LEAD
                        // ==========================================

                        string checkQuery = @"
                            SELECT COUNT(*)
                            FROM Leads
                            WHERE
                                LTRIM(RTRIM(Name)) = LTRIM(RTRIM(@Name))

                                AND ISNULL(LTRIM(RTRIM(Email)), '') =
                                    ISNULL(LTRIM(RTRIM(@Email)), '')

                                AND LTRIM(RTRIM(Phone)) =
                                    LTRIM(RTRIM(@Phone))

                                AND ISNULL(LTRIM(RTRIM(Qualification)), '') =
                                    ISNULL(LTRIM(RTRIM(@Qualification)), '')

                                AND ISNULL(LTRIM(RTRIM(Stream)), '') =
                                    ISNULL(LTRIM(RTRIM(@Stream)), '')

                                AND (
                                    PassingYear = @PassingYear
                                    OR (
                                        PassingYear IS NULL
                                        AND @PassingYear IS NULL
                                    )
                                )
                        ";


                        using (SqlCommand checkCmd =
                            new SqlCommand(checkQuery, con))
                        {
                            checkCmd.Parameters.Add(
                                "@Name",
                                SqlDbType.VarChar,
                                250
                            ).Value = name;


                            checkCmd.Parameters.Add(
                                "@Email",
                                SqlDbType.VarChar,
                                250
                            ).Value =
                                string.IsNullOrWhiteSpace(email)
                                    ? (object)DBNull.Value
                                    : email;


                            checkCmd.Parameters.Add(
                                "@Phone",
                                SqlDbType.VarChar,
                                20
                            ).Value = phone;


                            checkCmd.Parameters.Add(
                                "@Qualification",
                                SqlDbType.VarChar,
                                250
                            ).Value =
                                string.IsNullOrWhiteSpace(qualification)
                                    ? (object)DBNull.Value
                                    : qualification;


                            checkCmd.Parameters.Add(
                                "@Stream",
                                SqlDbType.VarChar,
                                250
                            ).Value =
                                string.IsNullOrWhiteSpace(stream)
                                    ? (object)DBNull.Value
                                    : stream;


                            checkCmd.Parameters.Add(
                                "@PassingYear",
                                SqlDbType.Int
                            ).Value =
                                passingYear.HasValue
                                    ? (object)passingYear.Value
                                    : DBNull.Value;


                            int existingLead =
                                Convert.ToInt32(
                                    checkCmd.ExecuteScalar()
                                );


                            if (existingLead > 0)
                            {
                                ShowMessage(
                                    "This lead already exists with the same information.",
                                    false
                                );

                                return;
                            }
                        }


                        // ==========================================
                        // INSERT NEW LEAD
                        // ==========================================

                        long newLeadID =
                            Convert.ToInt64(
                                cmd.ExecuteScalar()
                            );


                        ShowMessage(
                            "Lead created successfully. Lead ID: "
                            + newLeadID,
                            true);


                        ClearForm();
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "Unable to create lead. "
                    + ex.Message,
                    false);
            }


        }
    }
}