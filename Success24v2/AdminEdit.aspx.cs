using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class AdminEdit : System.Web.UI.Page
    {
        private readonly string conStr = ConfigurationManager.ConnectionStrings["S24"].ConnectionString;

        private int StudentID
        {
            get
            {
                int id;
                return int.TryParse(Convert.ToString(Request.QueryString["ID"]), out id) ? id : 0;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (StudentID <= 0)
            {
                Response.Redirect("AdminDashboard.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadStudent();
            }
        }

        private void LoadStudent()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT * FROM StudentRegistration WHERE ID=@ID";
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
                            txtBatchNo.Text = Convert.ToString(dr["BatchNo"]);
                            txtQualification.Text = Convert.ToString(dr["Qualification"]);
                            txtPassoutYear.Text = Convert.ToString(dr["PassoutYear"]);
                            txtDOB.Text = dr["DOB"] == DBNull.Value ? "" : Convert.ToDateTime(dr["DOB"]).ToString("yyyy-MM-dd");

                            string course = Convert.ToString(dr["Course"]);
                            if (ddlCourse.Items.FindByValue(course) != null)
                                ddlCourse.SelectedValue = course;

                            txtPrimaryMobile.Text = Convert.ToString(dr["PrimaryMobile"]);
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

                            string verificationStatus = Convert.ToString(dr["VerificationStatus"]);
                            if (ddlStatus.Items.FindByValue(verificationStatus) != null)
                                ddlStatus.SelectedValue = verificationStatus;
                            else
                                ddlStatus.SelectedIndex = 0;

                            txtCompletionPercent.Text = Convert.ToString(dr["CompletionPercent"]);
                            txtRemarks.Text = Convert.ToString(dr["RejectionReason"]);
                            if (string.IsNullOrWhiteSpace(txtRemarks.Text))
                                txtRemarks.Text = Convert.ToString(dr["VerificationRemarks"]);

                            litStatus.Text = BuildStatusBadge(verificationStatus);

                            string photoPath = Convert.ToString(dr["PhotoPath"]);
                            litPhoto.Text = BuildPhotoPreview(photoPath);
                            litPhotoCard.Text = BuildPhotoCard(photoPath);

                            litAadharFront.Text = BuildLink(Convert.ToString(dr["AadharFrontPath"]));
                            litAadharBack.Text = BuildLink(Convert.ToString(dr["AadharBackPath"]));
                            litPANCard.Text = BuildLink(Convert.ToString(dr["PANCardPath"]));
                            litMarksheet10.Text = BuildLink(Convert.ToString(dr["Marksheet10Path"]));
                            litMarksheet12.Text = BuildLink(Convert.ToString(dr["Marksheet12Path"]));
                            litDegree.Text = BuildLink(Convert.ToString(dr["DegreeOrLastYearMarksheetPath"]));
                        }
                    }
                }
            }
        }

        private string BuildStatusBadge(string status)
        {
            string safeStatus = string.IsNullOrWhiteSpace(status) ? "Draft" : status.Trim();

            string dotColor = "bg-orange-500";
            if (safeStatus.Equals("Verified", StringComparison.OrdinalIgnoreCase))
                dotColor = "bg-green-500";
            else if (safeStatus.Equals("Rejected", StringComparison.OrdinalIgnoreCase))
                dotColor = "bg-red-500";
            else if (safeStatus.Equals("Pending", StringComparison.OrdinalIgnoreCase))
                dotColor = "bg-amber-500";

            return "<span class='status-pill'><span class='h-2.5 w-2.5 rounded-full " + dotColor + "'></span>" + safeStatus + "</span>";
        }

        private string BuildPhotoPreview(string path)
        {
            if (string.IsNullOrWhiteSpace(path))
            {
                return "<div class='flex flex-col items-start gap-3'>" +
                       "<img src='" + ResolveUrl("~/img/default-user.png") + "' alt='Student Photo' class='profile-photo' />" +
                       "<span class='not-uploaded'>Photo not uploaded</span>" +
                       "</div>";
            }

            string url = ResolveUrl(path);

            return "<div class='flex flex-col items-start gap-3'>" +
                   "<a href='" + url + "' target='_blank'><img src='" + url + "' alt='Student Photo' class='profile-photo' /></a>" +
                   "<a class='doc-link' href='" + url + "' target='_blank'>Open Student Photo</a>" +
                   "</div>";
        }

        private string BuildPhotoCard(string path)
        {
            if (string.IsNullOrWhiteSpace(path))
            {
                return "<div class='flex flex-col items-start gap-3'>" +
                       "<img src='" + ResolveUrl("~/img/default-user.png") + "' alt='Student Photo' style='width:96px;height:96px;object-fit:cover;border-radius:16px;border:1px solid #fdba74;background:#fff;' />" +
                       "<span class='not-uploaded'>Photo not uploaded</span>" +
                       "</div>";
            }

            string url = ResolveUrl(path);

            return "<div class='flex flex-col items-start gap-3'>" +
                   "<a href='" + url + "' target='_blank'><img src='" + url + "' alt='Student Photo' style='width:96px;height:96px;object-fit:cover;border-radius:16px;border:1px solid #fdba74;background:#fff;' /></a>" +
                   "<a class='doc-link' href='" + url + "' target='_blank'>Open Photo</a>" +
                   "</div>";
        }

        private string BuildLink(string path)
        {
            if (string.IsNullOrWhiteSpace(path))
                return "<span class='not-uploaded'>Not uploaded</span>";

            return "<a class='doc-link' href='" + ResolveUrl(path) + "' target='_blank'>Open Document</a>";
        }

        protected void btnUploadPhoto_Click(object sender, EventArgs e)
        {
            try
            {
                if (fuAdminPhoto == null || !fuAdminPhoto.HasFile)
                {
                    ShowMessage("Please select a photo first.", false);
                    return;
                }

                string photoPath = SavePhotoFile(fuAdminPhoto, "AdminPhoto");

                using (SqlConnection con = new SqlConnection(conStr))
                {
                    string query = "UPDATE StudentRegistration SET PhotoPath=@PhotoPath, LastUpdatedOn=GETDATE() WHERE ID=@ID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@PhotoPath", photoPath);
                        cmd.Parameters.AddWithValue("@ID", StudentID);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                ShowMessage("Student photo updated successfully.", true);
                LoadStudent();
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message, false);
            }
        }

        protected void btnUploadAadharFront_Click(object sender, EventArgs e) { ReplaceDocument(fuAadharFrontAdmin, "aadharfront", "AadharFrontPath"); }
        protected void btnUploadAadharBack_Click(object sender, EventArgs e) { ReplaceDocument(fuAadharBackAdmin, "aadharback", "AadharBackPath"); }
        protected void btnUploadPANCard_Click(object sender, EventArgs e) { ReplaceDocument(fuPANCardAdmin, "pancard", "PANCardPath"); }
        protected void btnUploadMarksheet10_Click(object sender, EventArgs e) { ReplaceDocument(fuMarksheet10Admin, "tenthmarksheet", "Marksheet10Path"); }
        protected void btnUploadMarksheet12_Click(object sender, EventArgs e) { ReplaceDocument(fuMarksheet12Admin, "twelfthmarksheet", "Marksheet12Path"); }
        protected void btnUploadDegree_Click(object sender, EventArgs e) { ReplaceDocument(fuDegreeAdmin, "degree", "DegreeOrLastYearMarksheetPath"); }

        private void ReplaceDocument(FileUpload fu, string requiredName, string columnName)
        {
            try
            {
                string path = ValidateAndSaveDocument(fu, requiredName);

                using (SqlConnection con = new SqlConnection(conStr))
                {
                    string query = "UPDATE StudentRegistration SET " + columnName + "=@Path, LastUpdatedOn=GETDATE() WHERE ID=@ID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Path", path);
                        cmd.Parameters.AddWithValue("@ID", StudentID);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                ShowMessage("Document replaced successfully.", true);
                LoadStudent();
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message, false);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"
                    UPDATE StudentRegistration
                    SET FirstName=@FirstName,
                        LastName=@LastName,
                        FatherName=@FatherName,
                        BatchNo=@BatchNo,
                        Qualification=@Qualification,
                        PassoutYear=@PassoutYear,
                        DOB=@DOB,
                        Course=@Course,
                        PrimaryMobile=@PrimaryMobile,
                        SecondaryMobile=@SecondaryMobile,
                        Email1=@Email1,
                        Email2=@Email2,
                        WhatsappNo=@WhatsappNo,
                        ParentNo=@ParentNo,
                        AadharNo=@AadharNo,
                        PANNo=@PANNo,
                        PassportNo=@PassportNo,
                        ReferenceName=@ReferenceName,
                        CurrentAddress=@CurrentAddress,
                        PermanentAddress=@PermanentAddress,
                        VerificationStatus=@VerificationStatus,
                        VerificationRemarks=@VerificationRemarks,
                        RejectionReason=@RejectionReason,
                        CompletionPercent=@CompletionPercent,
                        LastUpdatedOn=GETDATE()
                    WHERE ID=@ID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    AddCommonParameters(cmd);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            ShowMessage("Student record updated successfully.", true);
            LoadStudent();
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"
                    UPDATE StudentRegistration
                    SET VerificationStatus='Verified',
                        VerificationRemarks=@VerificationRemarks,
                        RejectionReason=NULL,
                        VerifiedBy=@VerifiedBy,
                        VerifiedOn=GETDATE(),
                        Active=1,
                        LastUpdatedOn=GETDATE()
                    WHERE ID=@ID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@VerificationRemarks", txtRemarks.Text.Trim());
                    cmd.Parameters.AddWithValue("@VerifiedBy", Convert.ToString(Session["AdminName"]));
                    cmd.Parameters.AddWithValue("@ID", StudentID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            ShowMessage("Student verified successfully.", true);
            LoadStudent();
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"
                    UPDATE StudentRegistration
                    SET VerificationStatus='Rejected',
                        VerificationRemarks=@VerificationRemarks,
                        RejectionReason=@RejectionReason,
                        VerifiedBy=@VerifiedBy,
                        VerifiedOn=GETDATE(),
                        Active=0,
                        LastUpdatedOn=GETDATE()
                    WHERE ID=@ID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@VerificationRemarks", txtRemarks.Text.Trim());
                    cmd.Parameters.AddWithValue("@RejectionReason", txtRemarks.Text.Trim());
                    cmd.Parameters.AddWithValue("@VerifiedBy", Convert.ToString(Session["AdminName"]));
                    cmd.Parameters.AddWithValue("@ID", StudentID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            ShowMessage("Student rejected successfully.", true);
            LoadStudent();
        }

        private void AddCommonParameters(SqlCommand cmd)
        {
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
            cmd.Parameters.AddWithValue("@FatherName", txtFatherName.Text.Trim());
            cmd.Parameters.AddWithValue("@BatchNo", txtBatchNo.Text.Trim());
            cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim());
            cmd.Parameters.AddWithValue("@PassoutYear", txtPassoutYear.Text.Trim());
            cmd.Parameters.AddWithValue("@DOB", string.IsNullOrWhiteSpace(txtDOB.Text) ? (object)DBNull.Value : Convert.ToDateTime(txtDOB.Text));
            cmd.Parameters.AddWithValue("@Course", ddlCourse.SelectedValue);
            cmd.Parameters.AddWithValue("@PrimaryMobile", txtPrimaryMobile.Text.Trim());
            cmd.Parameters.AddWithValue("@SecondaryMobile", txtSecondaryMobile.Text.Trim());
            cmd.Parameters.AddWithValue("@Email1", txtEmail1.Text.Trim());
            cmd.Parameters.AddWithValue("@Email2", txtEmail2.Text.Trim());
            cmd.Parameters.AddWithValue("@WhatsappNo", txtWhatsappNo.Text.Trim());
            cmd.Parameters.AddWithValue("@ParentNo", txtParentNo.Text.Trim());
            cmd.Parameters.AddWithValue("@AadharNo", txtAadharNo.Text.Trim());
            cmd.Parameters.AddWithValue("@PANNo", txtPANNo.Text.Trim());
            cmd.Parameters.AddWithValue("@PassportNo", txtPassportNo.Text.Trim());
            cmd.Parameters.AddWithValue("@ReferenceName", txtReferenceName.Text.Trim());
            cmd.Parameters.AddWithValue("@CurrentAddress", txtCurrentAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@PermanentAddress", txtPermanentAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@VerificationStatus", ddlStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@VerificationRemarks", txtRemarks.Text.Trim());
            cmd.Parameters.AddWithValue("@RejectionReason", txtRemarks.Text.Trim());
            cmd.Parameters.AddWithValue("@CompletionPercent", txtCompletionPercent.Text.Trim());
            cmd.Parameters.AddWithValue("@ID", StudentID);
        }

        private string SavePhotoFile(FileUpload fu, string prefix)
        {
            if (fu == null || !fu.HasFile)
                throw new Exception("Please select a photo.");

            string ext = Path.GetExtension(fu.FileName).ToLower();
            string[] allowed = { ".jpg", ".jpeg", ".png", ".webp" };

            bool isAllowed = false;
            foreach (string item in allowed)
            {
                if (ext == item)
                {
                    isAllowed = true;
                    break;
                }
            }

            if (!isAllowed)
                throw new Exception("Only JPG, JPEG, PNG, or WEBP images are allowed.");

            if (fu.PostedFile.ContentLength > 2 * 1024 * 1024)
                throw new Exception("Photo size must be less than 2MB.");

            string folder = Server.MapPath("~/ FormPics /");
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            string fileName = prefix + "_" + StudentID + "_" + DateTime.Now.ToString("yyyyMMddHHmmssfff") + ext;
            string fullPath = Path.Combine(folder, fileName);

            fu.SaveAs(fullPath);
            return "~/ FormPics /" + fileName;
        }

        private string ValidateAndSaveDocument(FileUpload fu, string requiredName)
        {
            if (fu == null || !fu.HasFile)
                throw new Exception("Please select a file.");

            string originalFileName = Path.GetFileNameWithoutExtension(fu.FileName).Trim().ToLower();
            string ext = Path.GetExtension(fu.FileName).ToLower();
            string[] allowedExt = { ".jpg", ".jpeg", ".png", ".pdf" };

            if (originalFileName != requiredName.ToLower())
                throw new Exception("Invalid file name. Please upload file named exactly: " + requiredName);

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
                throw new Exception("Invalid file type. Only JPG, JPEG, PNG, PDF allowed.");

            if (fu.PostedFile.ContentLength > 2 * 1024 * 1024)
                throw new Exception("File size must be less than 2MB.");

            string folder = Server.MapPath("~/ FormPics /");
            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            string fileName = StudentID + "_" + requiredName + ext;
            string fullPath = Path.Combine(folder, fileName);
            fu.SaveAs(fullPath);

            return "~/ FormPics /" + fileName;
        }

        private void ShowMessage(string text, bool success)
        {
            lblMessage.Text = text;
            lblMessage.CssClass = success ? "msg msg-success" : "msg msg-error";
        }
    }
}