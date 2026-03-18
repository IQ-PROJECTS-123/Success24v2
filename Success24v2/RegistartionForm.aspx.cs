using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Success24v2
{
    public partial class RegistartionFormaspx : System.Web.UI.Page
    {
        // ── Page Load ─────────────────────────────────────────────
        protected void Page_Load(object sender, EventArgs e)
        {
            // Show Batch No field only to admins
            pnlBatchNo.Visible = (Session["IsAdmin"] != null && (bool)Session["IsAdmin"]);

            if (!IsPostBack && Request.QueryString["id"] != null)
                LoadStudentData(Request.QueryString["id"]);
        }

        // ── Submit (New Registration) ─────────────────────────────
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            if (!fuPhoto.HasFile) return;

            string photoFileName = SavePhoto();

            bool isAdmin = Session["IsAdmin"] != null && (bool)Session["IsAdmin"];
            string batchValue = isAdmin ? txtBatch.Text.Trim() : null;

            // ── Build query dynamically based on whether batch is provided ──
            string batchCol = isAdmin ? ", BatchNo" : "";
            string batchParam = isAdmin ? ", @BatchNo" : "";

            string query = $@"INSERT INTO StudentRegistration
        (FirstName, LastName, DOB, Qualification, PassoutYear{batchCol}, Course,
         PrimaryMobile, SecondaryMobile, WhatsappNo, ParentNo,
         FatherName, Email1, Email2,
         AadharNo, PANNo, VoterID, PassportNo, ReferenceName,
         CurrentAddress, PermanentAddress, PhotoPath,
         CreatedOn, Active)
        VALUES
        (@FirstName,@LastName,@DOB,@Qualification,@PassoutYear{batchParam},@Course,
         @PrimaryMobile,@SecondaryMobile,@WhatsappNo,@ParentNo,
         @FatherName,@Email1,@Email2,
         @AadharNo,@PANNo,@VoterID,@PassportNo,@ReferenceName,
         @CurrentAddress,@PermanentAddress,@PhotoPath,
         @CreatedOn, 1)";

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                BindParams(cmd, batchValue);  // passes null if student
                cmd.Parameters.AddWithValue("@PhotoPath", photoFileName);
                cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            string emailBody = $@"<h3>New Student Registration</h3>
                <table border='1' cellpadding='6' cellspacing='0' style='font-family:Arial;font-size:14px;'>
                    <tr><td><b>Name</b></td><td>{txtFirstName.Text} {txtLastName.Text}</td></tr>
                    <tr><td><b>Course</b></td><td>{ddlCourse.SelectedValue}</td></tr>
                    <tr><td><b>Mobile</b></td><td>{txtPrimaryMobile.Text}</td></tr>
                    <tr><td><b>Email</b></td><td>{txtEmail1.Text}</td></tr>
                    <tr><td><b>Registered On</b></td><td>{DateTime.Now:dd-MM-yyyy hh:mm tt}</td></tr>
                </table>";

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            Utility._SendEmail("rajnish5454kumar@gmail.com", "", "New Student Submitted", emailBody);

            if (!string.IsNullOrEmpty(txtEmail1.Text))
                Utility._SendEmail(txtEmail1.Text, "", "Registration Successful",
                    $"Dear {txtFirstName.Text},<br>Your registration at <b>Success24</b> is successful.<br>Registered On: {DateTime.Now:dd-MM-yyyy hh:mm tt}");

            ClearForm();
            ClientScript.RegisterStartupScript(this.GetType(), "alert",
                "alert('Registration Successfully Saved!');", true);
        }

        // ── Edit / Update (only used if admin opens via old URL) ──
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null) return;
            if (!Page.IsValid) return;

            bool isAdmin = Session["IsAdmin"] != null && (bool)Session["IsAdmin"];
            string batchValue = isAdmin ? txtBatch.Text.Trim() : null;

            string photoFileName = null;
            if (fuPhoto.HasFile)
            {
                DeletePhotoFile(Request.QueryString["id"]);
                photoFileName = SavePhoto();
            }

            // Only add BatchNo to SET clause if admin
            string batchClause = batchValue != null ? ", BatchNo=@BatchNo" : "";
            string photoClause = photoFileName != null ? ", PhotoPath=@PhotoPath" : "";

            string query = $@"UPDATE StudentRegistration SET
        FirstName=@FirstName, LastName=@LastName, DOB=@DOB,
        Qualification=@Qualification, PassoutYear=@PassoutYear,
        Course=@Course,
        PrimaryMobile=@PrimaryMobile, SecondaryMobile=@SecondaryMobile,
        WhatsappNo=@WhatsappNo, ParentNo=@ParentNo,
        FatherName=@FatherName,
        Email1=@Email1, Email2=@Email2,
        AadharNo=@AadharNo, PANNo=@PANNo, VoterID=@VoterID,
        PassportNo=@PassportNo, ReferenceName=@ReferenceName,
        CurrentAddress=@CurrentAddress, PermanentAddress=@PermanentAddress
        {batchClause}
        {photoClause}
        WHERE ID=@ID";

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                BindParams(cmd, batchValue);
                cmd.Parameters.AddWithValue("@ID", Request.QueryString["id"]);
                if (photoFileName != null)
                    cmd.Parameters.AddWithValue("@PhotoPath", photoFileName);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            ClientScript.RegisterStartupScript(this.GetType(), "alert",
                "alert('Record Updated Successfully!');", true);
            Response.Redirect("RegistartionForm.aspx?id=" + Request.QueryString["id"]);
        }

        // ── Delete Photo ──────────────────────────────────────────
        protected void btnDeletePhoto_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null) return;

            DeletePhotoFile(Request.QueryString["id"]);

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE StudentRegistration SET PhotoPath='' WHERE ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", Request.QueryString["id"]);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            pnlExistingPhoto.Visible = false;
            pnlUploadNew.Visible = true;
            rfvPhoto.Enabled = true;

            ClientScript.RegisterStartupScript(this.GetType(), "photoDeleted",
                "alert('Photo deleted. Please upload a new one.');", true);
        }

        // ── Load Student Data ─────────────────────────────────────
        private void LoadStudentData(string id)
        {
            string query = @"SELECT *, FORMAT(DOB,'yyyy-MM-dd') AS DOBF
                             FROM StudentRegistration WHERE ID=@ID";

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", id);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count == 0) return;

                DataRow dr = dt.Rows[0];

                txtFirstName.Text = dr["FirstName"].ToString();
                txtLastName.Text = dr["LastName"].ToString();
                txtDOB.Text = dr["DOBF"].ToString();
                txtQualification.Text = dr["Qualification"].ToString();
                txtPassout.Text = dr["PassoutYear"].ToString();
                ddlCourse.SelectedValue = dr["Course"].ToString();
                txtPrimaryMobile.Text = dr["PrimaryMobile"].ToString();
                txtSecondaryMobile.Text = dr["SecondaryMobile"].ToString();
                txtWhatsapp.Text = dr["WhatsappNo"].ToString();
                txtParentMobile.Text = dr["ParentNo"].ToString();
                txtFatherName.Text = dr["FatherName"].ToString();
                txtEmail1.Text = dr["Email1"].ToString();
                txtEmail2.Text = dr["Email2"].ToString();
                txtAadhar.Text = dr["AadharNo"].ToString();
                txtPAN.Text = dr["PANNo"].ToString();
                txtVoter.Text = dr["VoterID"].ToString();
                txtPassport.Text = dr["PassportNo"].ToString();
                txtReference.Text = dr["ReferenceName"].ToString();
                txtCurrentAddress.Text = dr["CurrentAddress"].ToString();
                txtPermanentAddress.Text = dr["PermanentAddress"].ToString();

                // Batch — only load if admin can see it
                if (Session["IsAdmin"] != null && (bool)Session["IsAdmin"])
                    txtBatch.Text = dr["BatchNo"].ToString();

                // CreatedOn badge
                if (dr["CreatedOn"] != DBNull.Value)
                {
                    lblCreatedOn.Text = Convert.ToDateTime(dr["CreatedOn"]).ToString("dd-MM-yyyy hh:mm tt");
                    pnlCreatedOn.Visible = true;
                }

                // Photo
                string photo = dr["PhotoPath"].ToString();
                if (!string.IsNullOrEmpty(photo))
                {
                    imgPreview.ImageUrl = "~/FormPics/" + photo;
                    pnlExistingPhoto.Visible = true;
                    pnlUploadNew.Visible = false;
                    rfvPhoto.Enabled = false;
                }
                else
                {
                    pnlExistingPhoto.Visible = false;
                    pnlUploadNew.Visible = true;
                    rfvPhoto.Enabled = true;
                }
            }
        }

        // ── Helpers ───────────────────────────────────────────────

        // batchValue = null means student submitted — don't touch BatchNo
        private void BindParams(SqlCommand cmd, string batchValue)
        {
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
            cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text);
            cmd.Parameters.AddWithValue("@PassoutYear", txtPassout.Text);
            cmd.Parameters.AddWithValue("@Course", ddlCourse.SelectedValue);
            cmd.Parameters.AddWithValue("@PrimaryMobile", txtPrimaryMobile.Text);
            cmd.Parameters.AddWithValue("@SecondaryMobile", txtSecondaryMobile.Text);
            cmd.Parameters.AddWithValue("@WhatsappNo", txtWhatsapp.Text);
            cmd.Parameters.AddWithValue("@ParentNo", txtParentMobile.Text);
            cmd.Parameters.AddWithValue("@FatherName", txtFatherName.Text);
            cmd.Parameters.AddWithValue("@Email1", txtEmail1.Text);
            cmd.Parameters.AddWithValue("@Email2", txtEmail2.Text);
            cmd.Parameters.AddWithValue("@AadharNo", txtAadhar.Text);
            cmd.Parameters.AddWithValue("@PANNo", txtPAN.Text);
            cmd.Parameters.AddWithValue("@VoterID", txtVoter.Text);
            cmd.Parameters.AddWithValue("@PassportNo", txtPassport.Text);
            cmd.Parameters.AddWithValue("@ReferenceName", txtReference.Text);
            cmd.Parameters.AddWithValue("@CurrentAddress", txtCurrentAddress.Text);
            cmd.Parameters.AddWithValue("@PermanentAddress", txtPermanentAddress.Text);

            // Only add BatchNo parameter if it's being used in the query
            if (batchValue != null)
                cmd.Parameters.AddWithValue("@BatchNo", batchValue);
        }

        private string SavePhoto()
        {
            string folderPath = Server.MapPath("~/FormPics/");
            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);
            string fileName = DateTime.Now.ToString("yyyyMMddHHmmss") + "_" +
                              Path.GetFileName(fuPhoto.FileName);
            fuPhoto.SaveAs(folderPath + fileName);
            return fileName;
        }

        private void DeletePhotoFile(string id)
        {
            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT PhotoPath FROM StudentRegistration WHERE ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", id);
                con.Open();
                string oldPhoto = cmd.ExecuteScalar()?.ToString();
                if (!string.IsNullOrEmpty(oldPhoto))
                {
                    string filePath = Server.MapPath("~/FormPics/" + oldPhoto);
                    if (File.Exists(filePath)) File.Delete(filePath);
                }
            }
        }

        private void ClearForm()
        {
            txtFirstName.Text = txtLastName.Text = txtDOB.Text = "";
            txtQualification.Text = txtPassout.Text = txtBatch.Text = "";
            ddlCourse.SelectedIndex = 0;
            txtPrimaryMobile.Text = txtSecondaryMobile.Text = "";
            txtWhatsapp.Text = txtParentMobile.Text = "";
            txtFatherName.Text = "";
            txtEmail1.Text = txtEmail2.Text = "";
            txtAadhar.Text = txtPAN.Text = "";
            txtVoter.Text = txtPassport.Text = txtReference.Text = "";
            txtCurrentAddress.Text = txtPermanentAddress.Text = "";
        }
    }
}