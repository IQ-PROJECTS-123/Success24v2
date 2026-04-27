using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class StudentRegistrationPage : Page
    {
        private readonly string conStr = ConfigurationManager.ConnectionStrings["S24"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadStudentData();
            }
        }

        private int StudentID
        {
            get { return Convert.ToInt32(Session["StudentID"]); }
        }

        private void LoadStudentData()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"SELECT * FROM StudentRegistration WHERE ID = @ID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ID", StudentID);
                    con.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            txtFirstName.Text = Convert.ToString(dr["FirstName"]);
                            txtLastName.Text = Convert.ToString(dr["LastName"]);
                            txtFatherName.Text = Convert.ToString(dr["FatherName"]);
                            txtQualification.Text = Convert.ToString(dr["Qualification"]);
                            txtPassoutYear.Text = Convert.ToString(dr["PassoutYear"]);
                            txtBatchNo.Text = Convert.ToString(dr["BatchNo"]);
                            txtDOB.Text = dr["DOB"] == DBNull.Value ? "" : Convert.ToDateTime(dr["DOB"]).ToString("yyyy-MM-dd");

                            string course = Convert.ToString(dr["Course"]);
                            if (ddlCourse.Items.FindByValue(course) != null)
                                ddlCourse.SelectedValue = course;

                            txtSecondaryMobile.Text = Convert.ToString(dr["SecondaryMobile"]);
                            txtEmail1.Text = Convert.ToString(dr["Email1"]);
                            txtEmail2.Text = Convert.ToString(dr["Email2"]);
                            txtWhatsappNo.Text = Convert.ToString(dr["WhatsappNo"]);
                            txtParentNo.Text = Convert.ToString(dr["ParentNo"]);
                            txtAadharNo.Text = Convert.ToString(dr["AadharNo"]);
                            txtPANNo.Text = Convert.ToString(dr["PANNo"]);
                            txtPassportNo.Text = Convert.ToString(dr["PassportNo"]);
                            txtReferenceName.Text = Convert.ToString(dr["ReferenceName"]);
                            txtCurrentAddress.Text = Convert.ToString(dr["CurrentAddress"]);
                            txtPermanentAddress.Text = Convert.ToString(dr["PermanentAddress"]);

                            int currentStep = dr["CurrentStep"] == DBNull.Value ? 1 : Convert.ToInt32(dr["CurrentStep"]);
                            int completion = dr["CompletionPercent"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CompletionPercent"]);
                            string status = Convert.ToString(dr["VerificationStatus"]);
                            string rejectionReason = Convert.ToString(dr["RejectionReason"]);

                            hfCurrentStep.Value = currentStep.ToString();
                            litProgressText.Text = completion.ToString();
                            divProgress.Style["width"] = completion + "%";

                            string safeStatus = string.IsNullOrWhiteSpace(status) ? "Draft" : status;
                            string statusClass = "inline-block rounded-full px-3 py-2 text-xs font-extrabold uppercase tracking-wide ";

                            if (safeStatus == "Pending")
                                statusClass += "bg-orange-100 text-orange-700";
                            else if (safeStatus == "Verified")
                                statusClass += "bg-green-100 text-green-700";
                            else if (safeStatus == "Rejected")
                                statusClass += "bg-red-100 text-red-700";
                            else
                                statusClass += "bg-yellow-100 text-yellow-700";

                            litStatus.Text = "<span class='" + statusClass + "'>" + safeStatus + "</span>";

                            if (safeStatus == "Rejected")
                            {
                                litRejectedAlert.Text = "<div class='mt-4 rounded-2xl border border-red-200 bg-red-50 px-4 py-4 text-sm font-semibold text-red-700'><strong>Your application was rejected.</strong><br/>Reason: " +
                                    Server.HtmlEncode(rejectionReason) +
                                    "<br/>Please update your details and resubmit.</div>";
                            }
                            else
                            {
                                litRejectedAlert.Text = "";
                            }

                            litPhoto.Text = CreatePhotoPreview(Convert.ToString(dr["PhotoPath"]));
                            litAadharFront.Text = CreateDocLink(Convert.ToString(dr["AadharFrontPath"]), "View uploaded file");
                            litAadharBack.Text = CreateDocLink(Convert.ToString(dr["AadharBackPath"]), "View uploaded file");
                            litPANCard.Text = CreateDocLink(Convert.ToString(dr["PANCardPath"]), "View uploaded file");
                            litMarksheet10.Text = CreateDocLink(Convert.ToString(dr["Marksheet10Path"]), "View uploaded file");
                            litMarksheet12.Text = CreateDocLink(Convert.ToString(dr["Marksheet12Path"]), "View uploaded file");
                            litDegree.Text = CreateDocLink(Convert.ToString(dr["DegreeOrLastYearMarksheetPath"]), "View uploaded file");

                            ShowStep(currentStep);

                            bool isReadOnly = (safeStatus == "Pending" || safeStatus == "Verified");
                            if (isReadOnly)
                            {
                                btnSaveStep.Enabled = false;
                                btnNext.Enabled = false;
                                btnPrevious.Enabled = false;
                                btnSendForVerification.Enabled = false;

                                if (fuPhoto != null) fuPhoto.Enabled = false;
                                if (fuAadharFront != null) fuAadharFront.Enabled = false;
                                if (fuAadharBack != null) fuAadharBack.Enabled = false;
                                if (fuPANCard != null) fuPANCard.Enabled = false;
                                if (fuMarksheet10 != null) fuMarksheet10.Enabled = false;
                                if (fuMarksheet12 != null) fuMarksheet12.Enabled = false;
                                if (fuDegree != null) fuDegree.Enabled = false;

                                ShowMessage("This application is under review or already verified. Editing is disabled.", true);
                            }

                            btnSendForVerification.Visible = currentStep == 7;
                        }
                    }
                }
            }
        }

        private string CreateDocLink(string path, string text)
        {
            if (string.IsNullOrWhiteSpace(path))
                return "";

            return "<div><a class='mt-2 inline-block font-bold text-orange-600 hover:text-orange-700 hover:underline' href='" + ResolveUrl(path) + "' target='_blank'>" + text + "</a></div>";
        }

        private string CreatePhotoPreview(string path)
        {
            if (string.IsNullOrWhiteSpace(path))
                return "";

            return "<div class='mt-3'>" +
                   "<a href='" + ResolveUrl(path) + "' target='_blank'>" +
                   "<img src='" + ResolveUrl(path) + "' alt='Student Photo' style='width:120px;height:120px;object-fit:cover;border-radius:16px;border:1px solid #fdba74;box-shadow:0 10px 25px rgba(234,88,12,.10);' />" +
                   "</a>" +
                   "<div style='margin-top:8px;'><a class='font-bold text-orange-600 hover:text-orange-700 hover:underline' href='" + ResolveUrl(path) + "' target='_blank'>View uploaded photo</a></div>" +
                   "</div>";
        }

        private void ShowStep(int step)
        {
            pnlStep1.Visible = step == 1;
            pnlStep2.Visible = step == 2;
            pnlStep3.Visible = step == 3;
            pnlStep4.Visible = step == 4;
            pnlStep5.Visible = step == 5;
            pnlStep6.Visible = step == 6;
            pnlStep7.Visible = step == 7;

            btnPrevious.Visible = step > 1;
            btnNext.Visible = step < 7;
            btnSendForVerification.Visible = step == 7;

            HighlightCurrentStep(step);
        }

        private void HighlightCurrentStep(int step)
        {
            ResetStepClasses();

            SetStepChipClass(stepChip1, step, 1);
            SetStepChipClass(stepChip2, step, 2);
            SetStepChipClass(stepChip3, step, 3);
            SetStepChipClass(stepChip4, step, 4);
            SetStepChipClass(stepChip5, step, 5);
            SetStepChipClass(stepChip6, step, 6);
            SetStepChipClass(stepChip7, step, 7);
        }

        private void ResetStepClasses()
        {
            string baseClass = "inline-flex items-center justify-center rounded-full border border-orange-300 bg-orange-50 px-4 py-2 text-xs font-extrabold uppercase tracking-wide text-orange-700";
            stepChip1.Attributes["class"] = baseClass;
            stepChip2.Attributes["class"] = baseClass;
            stepChip3.Attributes["class"] = baseClass;
            stepChip4.Attributes["class"] = baseClass;
            stepChip5.Attributes["class"] = baseClass;
            stepChip6.Attributes["class"] = baseClass;
            stepChip7.Attributes["class"] = baseClass;
        }

        private void SetStepChipClass(HtmlGenericControl chip, int currentStep, int chipStep)
        {
            string baseClass = "inline-flex items-center justify-center rounded-full px-4 py-2 text-xs font-extrabold uppercase tracking-wide";
            if (chipStep < currentStep)
                chip.Attributes["class"] = baseClass + " border border-green-300 bg-green-100 text-green-700";
            else if (chipStep == currentStep)
                chip.Attributes["class"] = baseClass + " border border-orange-600 bg-gradient-to-r from-orange-500 to-orange-600 text-white shadow-lg";
            else
                chip.Attributes["class"] = baseClass + " border border-orange-300 bg-orange-50 text-orange-700";
        }

        protected void btnSaveStep_Click(object sender, EventArgs e)
        {
            int step = Convert.ToInt32(hfCurrentStep.Value);
            SaveStep(step, true);
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            int step = Convert.ToInt32(hfCurrentStep.Value);

            if (!ValidateCurrentStep(step))
                return;

            if (SaveStep(step, false))
            {
                step++;
                hfCurrentStep.Value = step.ToString();
                ShowStep(step);
                UpdateProgress(step);
            }
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            int step = Convert.ToInt32(hfCurrentStep.Value);
            if (step > 1)
            {
                step--;
                hfCurrentStep.Value = step.ToString();
                ShowStep(step);
                UpdateProgress(step);
            }
        }

        protected void btnSendForVerification_Click(object sender, EventArgs e)
        {
            ClearValidationStyles();

            if (!ValidateCurrentStep(7))
                return;

            if (!SaveStep(7, false))
                return;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"UPDATE StudentRegistration
                                 SET IsSubmittedForVerification = 1,
                                     SubmittedForVerificationOn = GETDATE(),
                                     VerificationStatus = 'Pending',
                                     RejectionReason = NULL,
                                     IsProfileCompleted = 1,
                                     CompletionPercent = 100,
                                     SubmittedOn = GETDATE(),
                                     ResubmittedOn = GETDATE(),
                                     CurrentStep = 7,
                                     LastUpdatedOn = GETDATE()
                                 WHERE ID = @ID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ID", StudentID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            ShowMessage("Your application has been sent for verification successfully.", true);
            LoadStudentData();
        }

        private bool SaveStep(int step, bool showSavedMessage)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@ID", StudentID);

                        switch (step)
                        {
                            case 1:
                                cmd.CommandText = @"UPDATE StudentRegistration
                                                    SET FirstName=@FirstName,
                                                        LastName=@LastName,
                                                        FatherName=@FatherName,
                                                        ParentNo=@ParentNo,
                                                        CurrentStep=1,
                                                        CompletionPercent=14,
                                                        LastUpdatedOn=GETDATE()
                                                    WHERE ID=@ID";
                                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim().ToUpper());
                                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim().ToUpper());
                                cmd.Parameters.AddWithValue("@FatherName", txtFatherName.Text.Trim().ToUpper());
                                cmd.Parameters.AddWithValue("@ParentNo", txtParentNo.Text.Trim().ToUpper());
                                break;

                            case 2:
                                cmd.CommandText = @"UPDATE StudentRegistration
                                                    SET Qualification=@Qualification,
                                                        PassoutYear=@PassoutYear,
                                                        CurrentStep=2,
                                                        CompletionPercent=28,
                                                        LastUpdatedOn=GETDATE()
                                                    WHERE ID=@ID";
                                cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim().ToUpper());
                                cmd.Parameters.AddWithValue("@PassoutYear", txtPassoutYear.Text.Trim().ToUpper());
                                break;

                            case 3:
                                cmd.CommandText = @"UPDATE StudentRegistration
                                                    SET DOB=@DOB,
                                                        Course=@Course,
                                                        SecondaryMobile=@SecondaryMobile,
                                                        CurrentStep=3,
                                                        CompletionPercent=42,
                                                        LastUpdatedOn=GETDATE()
                                                    WHERE ID=@ID";
                                cmd.Parameters.AddWithValue("@DOB", string.IsNullOrWhiteSpace(txtDOB.Text) ? (object)DBNull.Value : Convert.ToDateTime(txtDOB.Text));
                                cmd.Parameters.AddWithValue("@Course", ddlCourse.SelectedValue.ToUpper());
                                cmd.Parameters.AddWithValue("@SecondaryMobile", txtSecondaryMobile.Text.Trim().ToUpper());
                                break;

                            case 4:
                                cmd.CommandText = @"UPDATE StudentRegistration
                                                    SET Email1=@Email1,
                                                        Email2=@Email2,
                                                        WhatsappNo=@WhatsappNo,
                                                        CurrentStep=4,
                                                        CompletionPercent=57,
                                                        LastUpdatedOn=GETDATE()
                                                    WHERE ID=@ID";
                                cmd.Parameters.AddWithValue("@Email1", txtEmail1.Text.Trim().ToUpper());
                                cmd.Parameters.AddWithValue("@Email2", txtEmail2.Text.Trim().ToUpper());
                                cmd.Parameters.AddWithValue("@WhatsappNo", txtWhatsappNo.Text.Trim().ToUpper());
                                break;

                            case 5:
                                cmd.CommandText = @"UPDATE StudentRegistration
                                                    SET AadharNo=@AadharNo,
                                                        PANNo=@PANNo,
                                                        PassportNo=@PassportNo,
                                                        ReferenceName=@ReferenceName,
                                                        CurrentStep=5,
                                                        CompletionPercent=71,
                                                        LastUpdatedOn=GETDATE()
                                                    WHERE ID=@ID";
                                cmd.Parameters.AddWithValue("@AadharNo", txtAadharNo.Text.Trim().ToUpper());
                                cmd.Parameters.AddWithValue("@PANNo", txtPANNo.Text.Trim().ToUpper());
                                cmd.Parameters.AddWithValue("@PassportNo", txtPassportNo.Text.Trim().ToUpper());
                                cmd.Parameters.AddWithValue("@ReferenceName", txtReferenceName.Text.Trim().ToUpper());
                                break;

                            case 6:
                                cmd.CommandText = @"UPDATE StudentRegistration
                                                    SET CurrentAddress=@CurrentAddress,
                                                        PermanentAddress=@PermanentAddress,
                                                        CurrentStep=6,
                                                        CompletionPercent=85,
                                                        LastUpdatedOn=GETDATE()
                                                    WHERE ID=@ID";
                                cmd.Parameters.AddWithValue("@CurrentAddress", txtCurrentAddress.Text.Trim().ToUpper());
                                cmd.Parameters.AddWithValue("@PermanentAddress", txtPermanentAddress.Text.Trim().ToUpper());
                                break;

                            case 7:
                                string photoPath = SavePhotoFile(fuPhoto, "Photo");
                                string aadharFront = ValidateAndSaveDocument(fuAadharFront, "aadharfront");
                                string aadharBack = ValidateAndSaveDocument(fuAadharBack, "aadharback");
                                string panCard = ValidateAndSaveDocument(fuPANCard, "pancard");
                                string marksheet10 = ValidateAndSaveDocument(fuMarksheet10, "tenthmarksheet");
                                string marksheet12 = ValidateAndSaveDocument(fuMarksheet12, "twelfthmarksheet");
                                string degree = ValidateAndSaveDocument(fuDegree, "degree");

                                cmd.CommandText = @"UPDATE StudentRegistration
                                                    SET PhotoPath=COALESCE(NULLIF(@PhotoPath,''),PhotoPath),
                                                        AadharFrontPath=COALESCE(NULLIF(@AadharFrontPath,''),AadharFrontPath),
                                                        AadharBackPath=COALESCE(NULLIF(@AadharBackPath,''),AadharBackPath),
                                                        PANCardPath=COALESCE(NULLIF(@PANCardPath,''),PANCardPath),
                                                        Marksheet10Path=COALESCE(NULLIF(@Marksheet10Path,''),Marksheet10Path),
                                                        Marksheet12Path=COALESCE(NULLIF(@Marksheet12Path,''),Marksheet12Path),
                                                        DegreeOrLastYearMarksheetPath=COALESCE(NULLIF(@DegreePath,''),DegreeOrLastYearMarksheetPath),
                                                        CurrentStep=7,
                                                        CompletionPercent=100,
                                                        LastUpdatedOn=GETDATE()
                                                    WHERE ID=@ID";

                                cmd.Parameters.AddWithValue("@PhotoPath", photoPath);
                                cmd.Parameters.AddWithValue("@AadharFrontPath", aadharFront);
                                cmd.Parameters.AddWithValue("@AadharBackPath", aadharBack);
                                cmd.Parameters.AddWithValue("@PANCardPath", panCard);
                                cmd.Parameters.AddWithValue("@Marksheet10Path", marksheet10);
                                cmd.Parameters.AddWithValue("@Marksheet12Path", marksheet12);
                                cmd.Parameters.AddWithValue("@DegreePath", degree);
                                break;
                        }

                        cmd.ExecuteNonQuery();
                    }
                }

                UpdateProgress(step);

                if (step == 7)
                    LoadStudentData();

                if (showSavedMessage)
                    ShowMessage("Step saved successfully.", true);

                return true;
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message, false);
                return false;
            }
        }

        private bool ValidateCurrentStep(int step)
        {
            ClearValidationStyles();

            switch (step)
            {
                case 1:
                    if (string.IsNullOrWhiteSpace(txtFirstName.Text))
                        return ValidationFail(txtFirstName, "First Name is required.");
                    if (string.IsNullOrWhiteSpace(txtLastName.Text))
                        return ValidationFail(txtLastName, "Last Name is required.");
                    if (string.IsNullOrWhiteSpace(txtFatherName.Text))
                        return ValidationFail(txtFatherName, "Father Name is required.");
                    if (string.IsNullOrWhiteSpace(txtParentNo.Text))
                        return ValidationFail(txtParentNo, "Parents Number is required.");
                    break;

                case 2:
                    if (string.IsNullOrWhiteSpace(txtQualification.Text))
                        return ValidationFail(txtQualification, "Qualification is required.");
                    if (string.IsNullOrWhiteSpace(txtPassoutYear.Text))
                        return ValidationFail(txtPassoutYear, "Passout Year is required.");
                    break;

                case 3:
                    if (string.IsNullOrWhiteSpace(txtDOB.Text))
                        return ValidationFail(txtDOB, "Date of Birth is required.");
                    if (string.IsNullOrWhiteSpace(ddlCourse.SelectedValue))
                        return ValidationFail(ddlCourse, "Course is required.");
                    break;

                case 4:
                    if (string.IsNullOrWhiteSpace(txtEmail1.Text))
                        return ValidationFail(txtEmail1, "Primary Email is required.");
                    if (string.IsNullOrWhiteSpace(txtWhatsappNo.Text))
                        return ValidationFail(txtWhatsappNo, "WhatsApp Number is required.");
                    break;

                case 5:
                    if (string.IsNullOrWhiteSpace(txtAadharNo.Text))
                        return ValidationFail(txtAadharNo, "Aadhar Number is required.");
                    if (string.IsNullOrWhiteSpace(txtPANNo.Text))
                        return ValidationFail(txtPANNo, "PAN Number is required.");
                    if (string.IsNullOrWhiteSpace(txtReferenceName.Text))
                        return ValidationFail(txtReferenceName, "Reference Name is required.");
                    break;

                case 6:
                    if (string.IsNullOrWhiteSpace(txtCurrentAddress.Text))
                        return ValidationFail(txtCurrentAddress, "Current Address is required.");
                    if (string.IsNullOrWhiteSpace(txtPermanentAddress.Text))
                        return ValidationFail(txtPermanentAddress, "Permanent Address is required.");
                    break;

                case 7:
                    if (string.IsNullOrWhiteSpace(litPhoto.Text) && (fuPhoto == null || !fuPhoto.HasFile))
                        return ValidationFail(fuPhoto, "Student Photo is required.");

                    if (string.IsNullOrWhiteSpace(litAadharFront.Text) && (fuAadharFront == null || !fuAadharFront.HasFile))
                        return ValidationFail(fuAadharFront, "Aadhar Front is required.");

                    if (string.IsNullOrWhiteSpace(litAadharBack.Text) && (fuAadharBack == null || !fuAadharBack.HasFile))
                        return ValidationFail(fuAadharBack, "Aadhar Back is required.");

                    if (string.IsNullOrWhiteSpace(litPANCard.Text) && (fuPANCard == null || !fuPANCard.HasFile))
                        return ValidationFail(fuPANCard, "PAN Card is required.");

                    if (string.IsNullOrWhiteSpace(litMarksheet10.Text) && (fuMarksheet10 == null || !fuMarksheet10.HasFile))
                        return ValidationFail(fuMarksheet10, "10th Marksheet is required.");

                    if (string.IsNullOrWhiteSpace(litMarksheet12.Text) && (fuMarksheet12 == null || !fuMarksheet12.HasFile))
                        return ValidationFail(fuMarksheet12, "12th Marksheet is required.");

                    if (string.IsNullOrWhiteSpace(litDegree.Text) && (fuDegree == null || !fuDegree.HasFile))
                        return ValidationFail(fuDegree, "Degree / Last Year Marksheet is required.");
                    break;
            }

            return true;
        }

        private bool ValidationFail(WebControl control, string message)
        {
            if (control != null)
                control.CssClass += " border-red-500 ring-4 ring-red-100 bg-red-50";

            ShowMessage(message, false);
            return false;
        }

        private void ClearValidationStyles()
        {
            txtFirstName.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtLastName.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtFatherName.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtParentNo.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtQualification.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtPassoutYear.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtDOB.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            ddlCourse.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtSecondaryMobile.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtEmail1.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtEmail2.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtWhatsappNo.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtAadharNo.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtPANNo.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtPassportNo.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtReferenceName.CssClass = "input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtCurrentAddress.CssClass = "textarea-box w-full min-h-[130px] rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            txtPermanentAddress.CssClass = "textarea-box w-full min-h-[130px] rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200";
            fuPhoto.CssClass = "upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none";
            fuAadharFront.CssClass = "upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none";
            fuAadharBack.CssClass = "upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none";
            fuPANCard.CssClass = "upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none";
            fuMarksheet10.CssClass = "upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none";
            fuMarksheet12.CssClass = "upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none";
            fuDegree.CssClass = "upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none";
        }

        private void UpdateProgress(int step)
        {
            int progress = 0;

            switch (step)
            {
                case 1: progress = 14; break;
                case 2: progress = 28; break;
                case 3: progress = 42; break;
                case 4: progress = 57; break;
                case 5: progress = 71; break;
                case 6: progress = 85; break;
                case 7: progress = 100; break;
            }

            litProgressText.Text = progress.ToString();
            divProgress.Style["width"] = progress + "%";
        }

        private string SavePhotoFile(FileUpload fu, string prefix)
        {
            if (fu == null || !fu.HasFile)
                return "";

            string ext = Path.GetExtension(fu.FileName).ToLower();
            string[] allowedImageExt = { ".jpg", ".jpeg", ".png", ".webp" };

            bool isAllowed = false;
            foreach (string item in allowedImageExt)
            {
                if (ext == item)
                {
                    isAllowed = true;
                    break;
                }
            }

            if (!isAllowed)
                throw new Exception("Photo must be JPG, JPEG, PNG, or WEBP.");

            if (fu.PostedFile.ContentLength > 2 * 1024 * 1024)
                throw new Exception("Photo size must be less than 2MB.");

            string folder = Server.MapPath("~/FormPics/");
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            string fileName = StudentID + "_photo_" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + ext;
            string fullPath = Path.Combine(folder, fileName);
            fu.SaveAs(fullPath);

            return "~/FormPics/" + fileName;
        }

        private string ValidateAndSaveDocument(FileUpload fu, string requiredName)
        {
            if (fu == null || !fu.HasFile)
                return "";

            string originalFileName = Path.GetFileNameWithoutExtension(fu.FileName).Trim().ToLower();
            string ext = Path.GetExtension(fu.FileName).ToLower();
            string[] allowedExt = { ".jpg", ".jpeg", ".png", ".pdf" };

            if (originalFileName != requiredName.ToLower())
                throw new Exception("Invalid file name. Please upload file named exactly: " + requiredName.ToUpper());

            bool isAllowed = false;
            foreach (string item in allowedExt)
            {
                if (ext == item)
                {
                    isAllowed = true;
                    break;
                }
            }

            if (!isAllowed)
                throw new Exception("Invalid file type for " + requiredName.ToUpper() + ". Only JPG, JPEG, PNG, PDF allowed.");

            if (fu.PostedFile.ContentLength > 2 * 1024 * 1024)
                throw new Exception(requiredName.ToUpper() + " file size must be less than 2MB.");

            string folder = Server.MapPath("~/FormPics/");
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            string fileName = StudentID + "_" + requiredName + ext;
            string fullPath = Path.Combine(folder, fileName);
            fu.SaveAs(fullPath);

            return "~/FormPics/" + fileName;
        }

        private void ShowMessage(string text, bool success)
        {
            lblMessage.Text = text;
            lblMessage.CssClass = success
                ? "mt-4 block rounded-2xl border border-green-200 bg-green-50 px-4 py-3 text-sm font-semibold text-green-700"
                : "mt-4 block rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-sm font-semibold text-red-700";
        }
    }
}