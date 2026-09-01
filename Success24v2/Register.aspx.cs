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
    public partial class Register : System.Web.UI.Page
    {
        private readonly string connectionString =
            ConfigurationManager
                .ConnectionStrings["S24"]
                .ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;


            // ==========================================
            // GET FORM VALUES
            // ==========================================

            string firstname =
                txtFirstName.Text.Trim();
            string lastname =
                txtLastName.Text.Trim();

            string dob =
                txtDOB.Text.Trim();
            string course =
                ddlCourse.SelectedValue;

            string graduation =
                txtGraduation.Text.Trim();

            string graduationYear =
                txtGraduationYear.Text.Trim();

            string masters =
                txtMasters.Text.Trim();

            string mastersYear =
                txtMastersYear.Text.Trim();

            string primaryMobile =
                txtPrimaryMobile.Text.Trim();

            string whatsApp =
                txtWhatsApp.Text.Trim();

            string secondaryMobile =
                txtSecondaryMobile.Text.Trim();

            string primaryEmail =
                txtPrimaryEmail.Text.Trim();

            string secondaryEmail =
                txtSecondaryEmail.Text.Trim();

            string fatherName =
                txtFatherName.Text.Trim();

            string guardianName =
                txtGuardianName.Text.Trim();

            string guardianRelationship =
                txtGuardianRelationship.Text.Trim();

            string guardianContact =
                txtGuardianContact.Text.Trim();

            string currentAddress =
                txtCurrentAddress.Text.Trim();

            string permanentAddress =
                txtPermanentAddress.Text.Trim();

            string reference =
                txtReference.Text.Trim();


            // ==========================================
            // BASIC VALIDATION
            // ==========================================

            if (string.IsNullOrWhiteSpace(firstname))
            {
                ShowMessage(
                    "Please enter your first name.",
                    false);

                return;
            }
           

            if (string.IsNullOrWhiteSpace(primaryMobile))
            {
                ShowMessage(
                    "Please enter your primary mobile number.",
                    false);

                return;
            }


            if (string.IsNullOrWhiteSpace(primaryEmail))
            {
                ShowMessage(
                    "Please enter your primary email address.",
                    false);

                return;
            }


            if (string.IsNullOrWhiteSpace(graduation))
            {
                ShowMessage(
                    "Please enter your graduation qualification.",
                    false);

                return;
            }


            if (string.IsNullOrWhiteSpace(graduationYear))
            {
                ShowMessage(
                    "Please enter your graduation passout year.",
                    false);

                return;
            }

            if (string.IsNullOrWhiteSpace(course))
            {
                ShowMessage(
                    "Please select a course.",
                    false);

                return;
            }
            if (string.IsNullOrWhiteSpace(reference))
            {
                ShowMessage(
                    "Please enter your reference.",
                    false);

                return;
            }


            // ==========================================
            // DATABASE
            // ==========================================

            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    con.Open();


                    // ==========================================
                    // CHECK DUPLICATE MOBILE
                    // ==========================================

                    string checkQuery = @"
                        SELECT COUNT(*)
                        FROM StudentRegistration
                        WHERE PrimaryMobile = @PrimaryMobile
                    ";


                    using (SqlCommand checkCmd =
                        new SqlCommand(checkQuery, con))
                    {
                        checkCmd.Parameters.Add(
                            "@PrimaryMobile",
                            SqlDbType.VarChar,
                            20
                        ).Value = primaryMobile;


                        int existing =
                            Convert.ToInt32(
                                checkCmd.ExecuteScalar()
                            );


                        if (existing > 0)
                        {
                            ShowMessage(
                                "This mobile number is already registered.",
                                false);

                            return;
                        }
                    }


                    // ==========================================
                    // CHECK DUPLICATE EMAIL
                    // ==========================================

                    string emailCheckQuery = @"
                        SELECT COUNT(*)
                        FROM StudentRegistration
                        WHERE Email1 = @Email
                    ";


                    using (SqlCommand emailCmd =
                        new SqlCommand(
                            emailCheckQuery,
                            con))
                    {
                        emailCmd.Parameters.Add(
                            "@Email",
                            SqlDbType.VarChar,
                            250
                        ).Value = primaryEmail;


                        int existingEmail =
                            Convert.ToInt32(
                                emailCmd.ExecuteScalar()
                            );


                        if (existingEmail > 0)
                        {
                            ShowMessage(
                                "This email address is already registered.",
                                false);

                            return;
                        }
                    }


                    // ==========================================
                    // INSERT
                    // ==========================================

                    string query = @"

                        INSERT INTO StudentRegistration
                        (
                            FirstName,
                            LastName,
                            DOB,
                            Course,

                            Qualification,
                            PassoutYear,

                            MastersQualification,
                            MastersPassoutYear,

                            PrimaryMobile,
                            WhatsappNo,
                            SecondaryMobile,

                            Email1,
                            Email2,

                            FatherName,
                            GuardianName,
                            GuardianRelationship,
                            ParentNo,

                            CurrentAddress,
                            PermanentAddress,

                            ReferenceName                           
                        )

                        VALUES
                        (
                            @FirstName,
                            @LastName,  
                            @DOB,
                            @Course,

                            @Qualification,
                            @PassoutYear,

                            @MastersQualification,
                            @MastersPassoutYear,

                            @PrimaryMobile,
                            @WhatsappNo,
                            @SecondaryMobile,

                            @Email1,
                            @Email2,

                            @FatherName,
                            @GuardianName,
                            @GuardianRelationship,
                            @ParentNo,

                            @CurrentAddress,
                            @PermanentAddress,

                            @Reference                           
                    )";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        // Full Name
                        cmd.Parameters.Add(
                            "@FirstName",
                            SqlDbType.VarChar,
                            250
                        ).Value = firstname;

                        cmd.Parameters.Add(
                            "@LastName",
                            SqlDbType.VarChar,
                            250
                        ).Value = lastname;


                        // Date of Birth
                        cmd.Parameters.Add(
                            "@DOB",
                            SqlDbType.Date
                        ).Value =
                            string.IsNullOrWhiteSpace(dob)
                                ? (object)DBNull.Value
                                : DateTime.Parse(dob);

                        // Course
                        cmd.Parameters.Add("@Course",
                            SqlDbType.VarChar,
                            100
                        ).Value = course;

                        // Graduation
                        cmd.Parameters.Add(
                            "@Qualification",
                            SqlDbType.VarChar,
                            250
                        ).Value = graduation;


                        // Graduation Year
                        cmd.Parameters.Add(
                            "@PassoutYear",
                            SqlDbType.Int
                        ).Value =
                            string.IsNullOrWhiteSpace(graduationYear)
                                ? (object)DBNull.Value
                                : Convert.ToInt32(
                                    graduationYear);


                        // Masters
                        cmd.Parameters.Add(
                            "@MastersQualification",
                            SqlDbType.VarChar,
                            250
                        ).Value =
                            string.IsNullOrWhiteSpace(masters)
                                ? (object)DBNull.Value
                                : masters;


                        // Masters Year
                        cmd.Parameters.Add(
                            "@MastersPassoutYear",
                            SqlDbType.Int
                        ).Value =
                            string.IsNullOrWhiteSpace(mastersYear)
                                ? (object)DBNull.Value
                                : Convert.ToInt32(
                                    mastersYear);


                        // Primary Mobile
                        cmd.Parameters.Add(
                            "@PrimaryMobile",
                            SqlDbType.VarChar,
                            20
                        ).Value = primaryMobile;


                        // WhatsApp
                        cmd.Parameters.Add(
                            "@WhatsappNo",
                            SqlDbType.VarChar,
                            20
                        ).Value =
                            string.IsNullOrWhiteSpace(whatsApp)
                                ? (object)DBNull.Value
                                : whatsApp;


                        // Secondary Mobile
                        cmd.Parameters.Add(
                            "@SecondaryMobile",
                            SqlDbType.VarChar,
                            20
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                secondaryMobile)
                                ? (object)DBNull.Value
                                : secondaryMobile;


                        // Primary Email
                        cmd.Parameters.Add(
                            "@Email1",
                            SqlDbType.VarChar,
                            250
                        ).Value = primaryEmail;


                        // Secondary Email
                        cmd.Parameters.Add(
                            "@Email2",
                            SqlDbType.VarChar,
                            250
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                secondaryEmail)
                                ? (object)DBNull.Value
                                : secondaryEmail;


                        // Father
                        cmd.Parameters.Add(
                            "@FatherName",
                            SqlDbType.VarChar,
                            250
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                fatherName)
                                ? (object)DBNull.Value
                                : fatherName;


                        // Guardian
                        cmd.Parameters.Add(
                            "@GuardianName",
                            SqlDbType.VarChar,
                            250
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                guardianName)
                                ? (object)DBNull.Value
                                : guardianName;


                        // Guardian Relationship
                        cmd.Parameters.Add(
                            "@GuardianRelationship",
                            SqlDbType.VarChar,
                            100
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                guardianRelationship)
                                ? (object)DBNull.Value
                                : guardianRelationship;


                        // Guardian Contact
                        cmd.Parameters.Add(
                            "@ParentNo",
                            SqlDbType.VarChar,
                            20
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                guardianContact)
                                ? (object)DBNull.Value
                                : guardianContact;


                        // Current Address
                        cmd.Parameters.Add(
                            "@CurrentAddress",
                            SqlDbType.VarChar,
                            -1
                        ).Value =
                            string.IsNullOrWhiteSpace(currentAddress)
                                ? (object)DBNull.Value
                                : currentAddress;


                        // Permanent Address
                        cmd.Parameters.Add(
                            "@PermanentAddress",
                            SqlDbType.VarChar,
                            -1
                        ).Value =
                            string.IsNullOrWhiteSpace(permanentAddress)
                                ? (object)DBNull.Value
                                : permanentAddress;


                        // Reference
                        cmd.Parameters.Add(
                            "@Reference",
                            SqlDbType.VarChar,
                            250
                        ).Value =
                            string.IsNullOrWhiteSpace(reference)
                                ? (object)DBNull.Value
                                : reference;


                        // ==========================================
                        // EXECUTE INSERT
                        // ==========================================

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ShowMessage(
                                "Registration completed successfully.",
                                true);

                            ClearForm();
                        }
                        else
                        {
                            ShowMessage(
                                "Registration failed. No data was inserted.",
                                false);
                        }
                    }
                }
            }
            catch (FormatException)
            {
                ShowMessage(
                    "Please enter valid date and year values.",
                    false);
            }
            catch (SqlException ex)
            {
                ShowMessage(
                    "Unable to save registration. "
                    + ex.Message,
                    false);
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "Something went wrong. "
                    + ex.Message,
                    false);
            }
        }


        // ==========================================
        // CLEAR FORM
        // ==========================================

        private void ClearForm()
        {
            txtFirstName.Text = "";

            txtLastName.Text = "";

            txtDOB.Text = ""; 
            
            ddlCourse.SelectedIndex = 0;

            txtGraduation.Text = "";

            txtGraduationYear.Text = "";

            txtMasters.Text = "";

            txtMastersYear.Text = "";

            txtPrimaryMobile.Text = "";

            txtWhatsApp.Text = "";

            txtSecondaryMobile.Text = "";

            txtPrimaryEmail.Text = "";

            txtSecondaryEmail.Text = "";

            txtFatherName.Text = "";

            txtGuardianName.Text = "";

            txtGuardianRelationship.Text = "";

            txtGuardianContact.Text = "";

            txtCurrentAddress.Text = "";

            txtPermanentAddress.Text = "";

            txtReference.Text = "";
        }


        // ==========================================
        // MESSAGE
        // ==========================================

        private void ShowMessage(string message, bool success)
        {
            string safeMessage =
                HttpUtility.JavaScriptStringEncode(message);

            string icon =
                success ? "success" : "error";

            string title =
                success
                    ? "Registration Successful!"
                    : "Registration Failed!";

            string script = $@"
        Swal.fire({{
            icon: '{icon}',
            title: '{title}',
            text: '{safeMessage}',
            confirmButtonText: 'OK'
        }});
    ";

            ScriptManager.RegisterStartupScript(
                this,
                this.GetType(),
                "RegistrationMessage",
                script,
                true
            );
        }
    }
}
    
