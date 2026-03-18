using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Success24v2
{
    public partial class AdminEditStudent : System.Web.UI.Page
    {
        private string StudentID => Request.QueryString["id"];

        protected void Page_Load(object sender, EventArgs e)
        {
            // ── Guard: must be admin ──────────────────────────────
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
                Response.Redirect("AdminLogin.aspx");

            // ── Guard: must have an id ────────────────────────────
            if (string.IsNullOrEmpty(StudentID))
                Response.Redirect("AdminDashboard.aspx");

            if (!IsPostBack)
                LoadStudent();
        }

        // ── Load student data into all fields ─────────────────────
        private void LoadStudent()
        {
            string query = @"SELECT *,
                             FORMAT(DOB,'yyyy-MM-dd') AS DOBF
                             FROM StudentRegistration
                             WHERE ID = @ID";

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", StudentID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count == 0)
                {
                    Response.Redirect("AdminDashboard.aspx");
                    return;
                }

                DataRow dr = dt.Rows[0];

                // ── Top bar & left panel ──────────────────────────
                string firstName = dr["FirstName"].ToString();
                string lastName = dr["LastName"].ToString();
                string course = dr["Course"].ToString();
                string batch = dr["BatchNo"].ToString();
                bool isActive = dr["Active"] != DBNull.Value && Convert.ToBoolean(dr["Active"]);

                lblStudentID.Text = "ID #" + StudentID;
                lblFullName.Text = firstName + " " + lastName;
                lblCourseLabel.Text = course + (string.IsNullOrEmpty(batch) ? "" : " · Batch " + batch);
                lblInitials.Text = firstName.Length > 0 ? firstName.Substring(0, 1).ToUpper() : "?";
                lblIDValue.Text = "#" + StudentID;
                lblCreatedOn.Text = dr["CreatedOn"] != DBNull.Value
                    ? Convert.ToDateTime(dr["CreatedOn"]).ToString("dd MMM yyyy")
                    : "—";
                lblBatchInfo.Text = string.IsNullOrEmpty(batch) ? "—" : batch;
                lblCourseInfo.Text = string.IsNullOrEmpty(course) ? "—" : course;

                // ── Status toggle pill ────────────────────────────
                SetStatusUI(isActive);

                // ── Photo ─────────────────────────────────────────
                string photo = dr["PhotoPath"].ToString();
                if (!string.IsNullOrEmpty(photo))
                {
                    imgPhoto.ImageUrl = "~/FormPics/" + photo;
                    imgPhoto.Visible = true;
                    // Hide initials div via JS trick — just make label empty
                    lblInitials.Text = "";
                    pnlDeletePhoto.Visible = true;
                }

                // ── Form fields ───────────────────────────────────
                txtFirstName.Text = firstName;
                txtLastName.Text = lastName;
                txtDOB.Text = dr["DOBF"].ToString();
                txtFatherName.Text = dr["FatherName"].ToString();
                ddlCourse.SelectedValue = course;
                txtBatch.Text = batch;
                txtQualification.Text = dr["Qualification"].ToString();
                txtPassout.Text = dr["PassoutYear"].ToString();
                txtPrimaryMobile.Text = dr["PrimaryMobile"].ToString();
                txtSecondaryMobile.Text = dr["SecondaryMobile"].ToString();
                txtWhatsapp.Text = dr["WhatsappNo"].ToString();
                txtParentMobile.Text = dr["ParentNo"].ToString();
                txtEmail1.Text = dr["Email1"].ToString();
                txtEmail2.Text = dr["Email2"].ToString();
                txtAadhar.Text = dr["AadharNo"].ToString();
                txtPAN.Text = dr["PANNo"].ToString();
                txtVoter.Text = dr["VoterID"].ToString();
                txtPassport.Text = dr["PassportNo"].ToString();
                txtReference.Text = dr["ReferenceName"].ToString();
                txtCurrentAddress.Text = dr["CurrentAddress"].ToString();
                txtPermanentAddress.Text = dr["PermanentAddress"].ToString();
            }
        }

        // ── Save Changes ──────────────────────────────────────────
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            // Handle photo upload if a new file was chosen
            string newPhotoFileName = null;
            if (fuPhoto.HasFile)
            {
                // Validate type
                string ext = Path.GetExtension(fuPhoto.FileName).ToLower();
                if (ext != ".jpg" && ext != ".jpeg" && ext != ".png" && ext != ".gif")
                {
                    hfShowToast.Value = "1";
                    hfToastMsg.Value = "❌ Invalid file type. Use JPG or PNG.";
                    return;
                }

                // Validate size (2MB)
                if (fuPhoto.PostedFile.ContentLength > 2 * 1024 * 1024)
                {
                    hfShowToast.Value = "1";
                    hfToastMsg.Value = "❌ File too large. Maximum size is 2MB.";
                    return;
                }

                // Delete old photo first
                DeleteOldPhoto();

                string folder = Server.MapPath("~/FormPics/");
                if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

                newPhotoFileName = DateTime.Now.ToString("yyyyMMddHHmmss") + "_" +
                                   Path.GetFileName(fuPhoto.FileName);
                fuPhoto.SaveAs(folder + newPhotoFileName);
            }

            string photoClause = newPhotoFileName != null ? ", PhotoPath=@PhotoPath" : "";

            string query = $@"UPDATE StudentRegistration SET
                FirstName        = @FirstName,
                LastName         = @LastName,
                DOB              = @DOB,
                FatherName       = @FatherName,
                Course           = @Course,
                BatchNo          = @BatchNo,
                Qualification    = @Qualification,
                PassoutYear      = @PassoutYear,
                PrimaryMobile    = @PrimaryMobile,
                SecondaryMobile  = @SecondaryMobile,
                WhatsappNo       = @WhatsappNo,
                ParentNo         = @ParentNo,
                Email1           = @Email1,
                Email2           = @Email2,
                AadharNo         = @AadharNo,
                PANNo            = @PANNo,
                VoterID          = @VoterID,
                PassportNo       = @PassportNo,
                ReferenceName    = @ReferenceName,
                CurrentAddress   = @CurrentAddress,
                PermanentAddress = @PermanentAddress
                {photoClause}
                WHERE ID = @ID";

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@FatherName", txtFatherName.Text.Trim());
                cmd.Parameters.AddWithValue("@Course", ddlCourse.SelectedValue);
                cmd.Parameters.AddWithValue("@BatchNo", txtBatch.Text.Trim());
                cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim());
                cmd.Parameters.AddWithValue("@PassoutYear", txtPassout.Text.Trim());
                cmd.Parameters.AddWithValue("@PrimaryMobile", txtPrimaryMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@SecondaryMobile", txtSecondaryMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@WhatsappNo", txtWhatsapp.Text.Trim());
                cmd.Parameters.AddWithValue("@ParentNo", txtParentMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Email1", txtEmail1.Text.Trim());
                cmd.Parameters.AddWithValue("@Email2", txtEmail2.Text.Trim());
                cmd.Parameters.AddWithValue("@AadharNo", txtAadhar.Text.Trim());
                cmd.Parameters.AddWithValue("@PANNo", txtPAN.Text.Trim());
                cmd.Parameters.AddWithValue("@VoterID", txtVoter.Text.Trim());
                cmd.Parameters.AddWithValue("@PassportNo", txtPassport.Text.Trim());
                cmd.Parameters.AddWithValue("@ReferenceName", txtReference.Text.Trim());
                cmd.Parameters.AddWithValue("@CurrentAddress", txtCurrentAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@PermanentAddress", txtPermanentAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@ID", StudentID);

                if (newPhotoFileName != null)
                    cmd.Parameters.AddWithValue("@PhotoPath", newPhotoFileName);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Reload data to reflect saved values
            LoadStudent();

            // Show toast notification
            hfShowToast.Value = "1";
            hfToastMsg.Value = "✅ Changes saved successfully!";
        }

        // ── Toggle Active / Inactive ──────────────────────────────
        protected void lbStatusToggle_Click(object sender, EventArgs e)
        {
            // Get current status from DB
            bool currentStatus = false;
            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT Active FROM StudentRegistration WHERE ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", StudentID);
                con.Open();
                var result = cmd.ExecuteScalar();
                if (result != DBNull.Value && result != null)
                    currentStatus = Convert.ToBoolean(result);
            }

            bool newStatus = !currentStatus;

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE StudentRegistration SET Active=@Active WHERE ID=@ID", con);
                cmd.Parameters.AddWithValue("@Active", newStatus);
                cmd.Parameters.AddWithValue("@ID", StudentID);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            SetStatusUI(newStatus);

            hfShowToast.Value = "1";
            hfToastMsg.Value = newStatus ? "✅ Student activated." : "⛔ Student deactivated.";
        }

        // ── Delete Photo ──────────────────────────────────────────
        protected void btnDeletePhoto_Click(object sender, EventArgs e)
        {
            DeleteOldPhoto();

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE StudentRegistration SET PhotoPath='' WHERE ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", StudentID);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            imgPhoto.Visible = false;
            pnlDeletePhoto.Visible = false;

            // Restore initials
            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT FirstName FROM StudentRegistration WHERE ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", StudentID);
                con.Open();
                string fn = cmd.ExecuteScalar()?.ToString() ?? "?";
                lblInitials.Text = fn.Length > 0 ? fn.Substring(0, 1).ToUpper() : "?";
            }

            hfShowToast.Value = "1";
            hfToastMsg.Value = "🗑️ Photo removed.";
        }

        // ── Helpers ───────────────────────────────────────────────
        private void SetStatusUI(bool isActive)
        {
            if (isActive)
            {
                togglePill.Attributes["class"] = "toggle-pill on";
                lblStatusText.Text = "✅ Active — Student can access the system";
                lblStatusText.Style["color"] = "#15803d";
            }
            else
            {
                togglePill.Attributes["class"] = "toggle-pill";
                lblStatusText.Text = "⛔ Inactive — Student is deactivated";
                lblStatusText.Style["color"] = "#b91c1c";
            }
        }

        private void DeleteOldPhoto()
        {
            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT PhotoPath FROM StudentRegistration WHERE ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", StudentID);
                con.Open();
                string oldPhoto = cmd.ExecuteScalar()?.ToString();
                if (!string.IsNullOrEmpty(oldPhoto))
                {
                    string path = Server.MapPath("~/FormPics/" + oldPhoto);
                    if (File.Exists(path)) File.Delete(path);
                }
            }
        }
    }
}
