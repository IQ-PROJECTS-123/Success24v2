using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

namespace Success24v2
{
    public partial class Register : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["S24"].ConnectionString;
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
            // BASIC REQUIRED FIELD VALIDATION
            // ==========================================

            if (string.IsNullOrWhiteSpace(firstname))
            {
                ShowMessage(
                    "Please enter your first name.",
                    false);

                return;
            }


            if (string.IsNullOrWhiteSpace(dob))
            {
                ShowMessage(
                    "Please enter your date of birth.",
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
            // NAME VALIDATION
            // ONLY A-Z AND SPACE
            // ==========================================

            if (!Regex.IsMatch(
                    firstname,
                    @"^[A-Za-z ]+$"))
            {
                ShowMessage(
                    "First name should contain alphabets only.",
                    false);

                return;
            }


            if (!string.IsNullOrWhiteSpace(lastname) &&
                !Regex.IsMatch(
                    lastname,
                    @"^[A-Za-z ]+$"))
            {
                ShowMessage(
                    "Last name should contain alphabets only.",
                    false);

                return;
            }


            if (!string.IsNullOrWhiteSpace(fatherName) &&
                !Regex.IsMatch(
                    fatherName,
                    @"^[A-Za-z ]+$"))
            {
                ShowMessage(
                    "Father name should contain alphabets only.",
                    false);

                return;
            }


            if (!string.IsNullOrWhiteSpace(guardianName) &&
                !Regex.IsMatch(
                    guardianName,
                    @"^[A-Za-z ]+$"))
            {
                ShowMessage(
                    "Guardian name should contain alphabets only.",
                    false);

                return;
            }


            if (!string.IsNullOrWhiteSpace(guardianRelationship) &&
                !Regex.IsMatch(
                    guardianRelationship,
                    @"^[A-Za-z ]+$"))
            {
                ShowMessage(
                    "Guardian relationship should contain alphabets only.",
                    false);

                return;
            }


            // ==========================================
            // MOBILE NUMBER VALIDATION
            // EXACTLY 10 DIGITS
            // ==========================================

            if (!Regex.IsMatch(
                    primaryMobile,
                    @"^[0-9]{10}$"))
            {
                ShowMessage(
                    "Primary mobile number must contain exactly 10 digits.",
                    false);

                return;
            }


            if (!Regex.IsMatch(
                    whatsApp,
                    @"^[0-9]{10}$"))
            {
                ShowMessage(
                    "WhatsApp number must contain exactly 10 digits.",
                    false);

                return;
            }


            if (!string.IsNullOrWhiteSpace(secondaryMobile) &&
                !Regex.IsMatch(
                    secondaryMobile,
                    @"^[0-9]{10}$"))
            {
                ShowMessage(
                    "Secondary mobile number must contain exactly 10 digits.",
                    false);

                return;
            }


            if (!Regex.IsMatch(
                    guardianContact,
                    @"^[0-9]{10}$"))
            {
                ShowMessage(
                    "Guardian contact number must contain exactly 10 digits.",
                    false);

                return;
            }


            // ==========================================
            // EMAIL VALIDATION
            // ==========================================

            string emailPattern =
                @"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$";


            if (!Regex.IsMatch(
                    primaryEmail,
                    emailPattern))
            {
                ShowMessage(
                    "Please enter a valid primary email address. Example: example@gmail.com",
                    false);

                return;
            }


            if (!string.IsNullOrWhiteSpace(secondaryEmail) &&
                !Regex.IsMatch(
                    secondaryEmail,
                    emailPattern))
            {
                ShowMessage(
                    "Please enter a valid secondary email address.",
                    false);

                return;
            }


            // ==========================================
            // DATE OF BIRTH VALIDATION
            // FORMAT: DD/MM/YYYY
            // ==========================================

            DateTime parsedDOB;


            if (!DateTime.TryParseExact(
                    dob,
                    "dd/MM/yyyy",
                    CultureInfo.InvariantCulture,
                    DateTimeStyles.None,
                    out parsedDOB))
            {
                ShowMessage(
                    "Date of birth must be in DD/MM/YYYY format. Example: 01/01/2000",
                    false);

                return;
            }


            // DOB cannot be future date

            if (parsedDOB > DateTime.Today)
            {
                ShowMessage(
                    "Date of birth cannot be a future date.",
                    false);

                return;
            }


            // ==========================================
            // GRADUATION YEAR VALIDATION
            // ==========================================

            if (!Regex.IsMatch(graduationYear, @"^[0-9]{4}$"))
            {
                ShowMessage(
                    "Graduation passout year must be exactly 4 digits. Example: 2020",
                    false);

                return;
            }

            int parsedGraduationYear = Convert.ToInt32(graduationYear);

            if (parsedGraduationYear < 1900 ||
                parsedGraduationYear > DateTime.Now.Year + 1)
            {
                ShowMessage(
                    "Please enter a valid graduation passout year.",
                    false);

                return;
            }


            // ==========================================
            // MASTERS YEAR VALIDATION
            // ==========================================

            int parsedMastersYear = 0;

            if (!string.IsNullOrWhiteSpace(mastersYear))
            {
                if (!Regex.IsMatch(mastersYear, @"^[0-9]{4}$"))
                {
                    ShowMessage(
                        "Masters passout year must be exactly 4 digits. Example: 2020",
                        false);

                    return;
                }

                parsedMastersYear = Convert.ToInt32(mastersYear);

                if (parsedMastersYear < 1900 ||
                    parsedMastersYear > DateTime.Now.Year + 1)
                {
                    ShowMessage(
                        "Please enter a valid masters passout year.",
                        false);

                    return;
                }
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
                        WHERE PrimaryMobile = @PrimaryMobile";


                    using (SqlCommand checkCmd =
                        new SqlCommand(
                            checkQuery,
                            con))
                    {
                        checkCmd.Parameters.Add(
                            "@PrimaryMobile",
                            SqlDbType.VarChar,
                            20
                        ).Value = primaryMobile;


                        int existing =
                            Convert.ToInt32(
                                checkCmd.ExecuteScalar());


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
                        WHERE Email1 = @Email";


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
                                emailCmd.ExecuteScalar());


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
                        new SqlCommand(
                            query,
                            con))
                    {

                        // ==========================================
                        // FIRST NAME
                        // ==========================================

                        cmd.Parameters.Add(
                            "@FirstName",
                            SqlDbType.VarChar,
                            250
                        ).Value = firstname;


                        // ==========================================
                        // LAST NAME
                        // ==========================================

                        cmd.Parameters.Add(
                            "@LastName",
                            SqlDbType.VarChar,
                            250
                        ).Value =
                            string.IsNullOrWhiteSpace(lastname)
                                ? (object)DBNull.Value
                                : lastname;


                        // ==========================================
                        // DATE OF BIRTH
                        // ==========================================

                        cmd.Parameters.Add(
                            "@DOB",
                            SqlDbType.Date
                        ).Value = parsedDOB;


                        // ==========================================
                        // COURSE
                        // ==========================================

                        cmd.Parameters.Add(
                            "@Course",
                            SqlDbType.VarChar,
                            100
                        ).Value = course;


                        // ==========================================
                        // GRADUATION
                        // ==========================================

                        cmd.Parameters.Add(
                            "@Qualification",
                            SqlDbType.VarChar,
                            250
                        ).Value = graduation;


                        // ==========================================
                        // GRADUATION YEAR
                        // ==========================================

                        cmd.Parameters.Add(
                            "@PassoutYear",
                            SqlDbType.Int
                        ).Value = parsedGraduationYear;


                        // ==========================================
                        // MASTERS
                        // ==========================================

                        cmd.Parameters.Add(
                            "@MastersQualification",
                            SqlDbType.VarChar,
                            250
                        ).Value =
                            string.IsNullOrWhiteSpace(masters)
                                ? (object)DBNull.Value
                                : masters;


                        // ==========================================
                        // MASTERS YEAR
                        // ==========================================

                        cmd.Parameters.Add(
                            "@MastersPassoutYear",
                            SqlDbType.Int
                        ).Value =
                            string.IsNullOrWhiteSpace(mastersYear)
                                ? (object)DBNull.Value
                                : parsedMastersYear;


                        // ==========================================
                        // PRIMARY MOBILE
                        // ==========================================

                        cmd.Parameters.Add(
                            "@PrimaryMobile",
                            SqlDbType.VarChar,
                            20
                        ).Value = primaryMobile;


                        // ==========================================
                        // WHATSAPP
                        // ==========================================

                        cmd.Parameters.Add(
                            "@WhatsappNo",
                            SqlDbType.VarChar,
                            20
                        ).Value = whatsApp;


                        // ==========================================
                        // SECONDARY MOBILE
                        // ==========================================

                        cmd.Parameters.Add(
                            "@SecondaryMobile",
                            SqlDbType.VarChar,
                            20
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                secondaryMobile)
                                ? (object)DBNull.Value
                                : secondaryMobile;


                        // ==========================================
                        // PRIMARY EMAIL
                        // ==========================================

                        cmd.Parameters.Add(
                            "@Email1",
                            SqlDbType.VarChar,
                            250
                        ).Value = primaryEmail;


                        // ==========================================
                        // SECONDARY EMAIL
                        // ==========================================

                        cmd.Parameters.Add(
                            "@Email2",
                            SqlDbType.VarChar,
                            250
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                secondaryEmail)
                                ? (object)DBNull.Value
                                : secondaryEmail;


                        // ==========================================
                        // FATHER
                        // ==========================================

                        cmd.Parameters.Add(
                            "@FatherName",
                            SqlDbType.VarChar,
                            250
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                fatherName)
                                ? (object)DBNull.Value
                                : fatherName;


                        // ==========================================
                        // GUARDIAN
                        // ==========================================

                        cmd.Parameters.Add(
                            "@GuardianName",
                            SqlDbType.VarChar,
                            250
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                guardianName)
                                ? (object)DBNull.Value
                                : guardianName;


                        // ==========================================
                        // GUARDIAN RELATIONSHIP
                        // ==========================================

                        cmd.Parameters.Add(
                            "@GuardianRelationship",
                            SqlDbType.VarChar,
                            100
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                guardianRelationship)
                                ? (object)DBNull.Value
                                : guardianRelationship;


                        // ==========================================
                        // GUARDIAN CONTACT
                        // ==========================================

                        cmd.Parameters.Add(
                            "@ParentNo",
                            SqlDbType.VarChar,
                            20
                        ).Value = guardianContact;


                        // ==========================================
                        // CURRENT ADDRESS
                        // ==========================================

                        cmd.Parameters.Add(
                            "@CurrentAddress",
                            SqlDbType.VarChar,
                            -1
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                currentAddress)
                                ? (object)DBNull.Value
                                : currentAddress;


                        // ==========================================
                        // PERMANENT ADDRESS
                        // ==========================================

                        cmd.Parameters.Add(
                            "@PermanentAddress",
                            SqlDbType.VarChar,
                            -1
                        ).Value =
                            string.IsNullOrWhiteSpace(
                                permanentAddress)
                                ? (object)DBNull.Value
                                : permanentAddress;


                        // ==========================================
                        // REFERENCE
                        // ==========================================

                        cmd.Parameters.Add(
                            "@Reference",
                            SqlDbType.VarChar,
                            250
                        ).Value = reference;


                        // ==========================================
                        // EXECUTE INSERT
                        // ==========================================

                        int rowsAffected =
                            cmd.ExecuteNonQuery();


                        if (rowsAffected > 0)
                        {
                            bool emailSent = SendRegistrationEmail(
                                firstname,
                                lastname,
                                dob,
                                course,
                                graduation,
                                graduationYear,
                                masters,
                                mastersYear,
                                primaryMobile,
                                whatsApp,
                                secondaryMobile,
                                primaryEmail,
                                secondaryEmail,
                                fatherName,
                                guardianName,
                                guardianRelationship,
                                guardianContact,
                                currentAddress,
                                permanentAddress,
                                reference
                            );

                            if (emailSent)
                            {
                                ShowMessage(
                                    "Registration completed successfully.",
                                    true);
                            }
                           

                            ClearForm();
                        }
                        else
                        {
                            ShowMessage(
                                "Registration failed.",
                                false);
                        }
                    }
                }
            }


            // ==========================================
            // EXCEPTIONS
            // ==========================================

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


        private bool SendRegistrationEmail(string firstname,string lastname,string dob,string course,string graduation,string graduationYear,string masters,string mastersYear,string primaryMobile,string whatsApp,string secondaryMobile,string primaryEmail,string secondaryEmail,string fatherName,string guardianName,string guardianRelationship,string guardianContact,string currentAddress,string permanentAddress,string reference)
        {
            try
            {
                using (MailMessage mail = new MailMessage())
                {
                    // Three email recipients
                    mail.To.Add("shrikantkumar.info@gmail.com");
                    mail.To.Add("radha@legalex.in");
                    mail.To.Add("shivani.ranaut@orbex.co.in");
                    mail.To.Add("priya@teceonsoft.com");

                    mail.Subject = "New Student Registration - Success24";
                    mail.IsBodyHtml = true;

                    // Encode user-provided values before inserting into HTML
                    Func<string, string> safe = value =>
                        HttpUtility.HtmlEncode(value ?? "");

                    mail.Body = @"
                <html>
                <body style='font-family:Arial,sans-serif;color:#1f2937;'>
                    <h2 style='color:#ea580c;'>New Student Registration</h2>
                    <p>A new student registration has been submitted.</p>

                    <table cellpadding='8' cellspacing='0'
                        style='border-collapse:collapse;width:100%;'
                        border='1'>
                        <tr><th align='left'>Field</th><th align='left'>Details</th></tr>
                        <tr><td>First Name</td><td>" + safe(firstname) + @"</td></tr>
                        <tr><td>Last Name</td><td>" + safe(lastname) + @"</td></tr>
                        <tr><td>Date of Birth</td><td>" + safe(dob) + @"</td></tr>
                        <tr><td>Course</td><td>" + safe(course) + @"</td></tr>
                        <tr><td>Graduation Qualification</td><td>" + safe(graduation) + @"</td></tr>
                        <tr><td>Graduation Passout Year</td><td>" + safe(graduationYear) + @"</td></tr>
                        <tr><td>Masters Qualification</td><td>" + safe(masters) + @"</td></tr>
                        <tr><td>Masters Passout Year</td><td>" + safe(mastersYear) + @"</td></tr>
                        <tr><td>Primary Mobile</td><td>" + safe(primaryMobile) + @"</td></tr>
                        <tr><td>WhatsApp Number</td><td>" + safe(whatsApp) + @"</td></tr>
                        <tr><td>Secondary Mobile</td><td>" + safe(secondaryMobile) + @"</td></tr>
                        <tr><td>Primary Email</td><td>" + safe(primaryEmail) + @"</td></tr>
                        <tr><td>Secondary Email</td><td>" + safe(secondaryEmail) + @"</td></tr>
                        <tr><td>Father Name</td><td>" + safe(fatherName) + @"</td></tr>
                        <tr><td>Guardian Name</td><td>" + safe(guardianName) + @"</td></tr>
                        <tr><td>Guardian Relationship</td><td>" + safe(guardianRelationship) + @"</td></tr>
                        <tr><td>Guardian Contact</td><td>" + safe(guardianContact) + @"</td></tr>
                        <tr><td>Current Address</td><td>" + safe(currentAddress) + @"</td></tr>
                        <tr><td>Permanent Address</td><td>" + safe(permanentAddress) + @"</td></tr>
                        <tr><td>Reference</td><td>" + safe(reference) + @"</td></tr>
                    </table>

                    <p style='margin-top:20px;color:#6b7280;'>
                        This is an automated email from Success24.
                    </p>
                </body>
                </html>";

                    using (SmtpClient smtp = new SmtpClient())
                    {
                        smtp.Send(mail);
                    }
                }

                return true;
            }
            catch (Exception)
            {
                // Registration is already saved; email failure should not undo it.
                // Log the exception on the server in production.
                return false;
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
        // SHOW MESSAGE
        // ==========================================

        private void ShowMessage(
            string message,
            bool success)
        {
            string safeMessage =
                HttpUtility.JavaScriptStringEncode(
                    message);


            string icon =
                success
                    ? "success"
                    : "error";


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
                true);
        }
    }
}
    
