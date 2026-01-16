using System;
using System.Data;
using System.Data.SqlClient;

namespace Success24v2
{
    public partial class RegistartionFormaspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["id"] != null)
            {
                LoadStudentData(Request.QueryString["id"]);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string query = @"INSERT INTO StudentRegistration(FirstName, LastName, DOB, BatchNo, Qualification, PassoutYear, Course,PrimaryMobile, SecondaryMobile, WhatsappNo, ParentNo, Email1, Email2,JoinDate, AadharNo, PANNo, VoterID, PassportNo, ReferenceName,CurrentAddress, PermanentAddress)
            VALUES(@FirstName,@LastName,@DOB,@BatchNo,@Qualification,@PassoutYear,@Course,@PrimaryMobile,@SecondaryMobile,@WhatsappNo,@ParentNo,@Email1,@Email2,@JoinDate,@AadharNo,@PANNo,@VoterID,@PassportNo,@ReferenceName,@CurrentAddress,@PermanentAddress)";
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@BatchNo", txtBatch.Text);
                cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text);
                cmd.Parameters.AddWithValue("@PassoutYear", txtPassout.Text);
                cmd.Parameters.AddWithValue("@Course", ddlCourse.SelectedValue);
                cmd.Parameters.AddWithValue("@PrimaryMobile", txtPrimaryMobile.Text);
                cmd.Parameters.AddWithValue("@SecondaryMobile", txtSecondaryMobile.Text);
                cmd.Parameters.AddWithValue("@WhatsappNo", txtWhatsapp.Text);
                cmd.Parameters.AddWithValue("@ParentNo", txtParentMobile.Text);
                cmd.Parameters.AddWithValue("@Email1", txtEmail1.Text);
                cmd.Parameters.AddWithValue("@Email2", txtEmail2.Text);
                cmd.Parameters.AddWithValue("@JoinDate", txtJoinDate.Text);
                cmd.Parameters.AddWithValue("@AadharNo", txtAadhar.Text);
                cmd.Parameters.AddWithValue("@PANNo", txtPAN.Text);
                cmd.Parameters.AddWithValue("@VoterID", txtVoter.Text);
                cmd.Parameters.AddWithValue("@PassportNo", txtPassport.Text);
                cmd.Parameters.AddWithValue("@ReferenceName", ddlReference.SelectedValue);
                cmd.Parameters.AddWithValue("@CurrentAddress", txtCurrentAddress.Text);
                cmd.Parameters.AddWithValue("@PermanentAddress", txtPermanentAddress.Text);

                con.Open();
                cmd.ExecuteNonQuery();
            }
            // ===== Email Body =====
            string emailBody = $@"<h3>New Student Registration</h3>
                <table border='1' cellpadding='6' cellspacing='0' style='font-family:Arial;font-size:14px;'>
                    <tr><td><b>Name</b></td><td>{txtFirstName.Text} {txtLastName.Text}</td></tr>
                    <tr><td><b>Course</b></td><td>{ddlCourse.SelectedValue}</td></tr>
                    <tr><td><b>Batch No</b></td><td>{txtBatch.Text}</td></tr>
                    <tr><td><b>Qualification</b></td><td>{txtQualification.Text}</td></tr>
                    <tr><td><b>Mobile</b></td><td>{txtPrimaryMobile.Text}</td></tr>
                    <tr><td><b>Email</b></td><td>{txtEmail1.Text}</td></tr>
                    <tr><td><b>Join Date</b></td><td>{txtJoinDate.Text}</td></tr>
                </table>";

            Utility._SendEmail("rajnish5454kumar@gmail.com", "",
                "New Student Submitted", emailBody);

            Utility._SendEmail(txtEmail1.Text, "",
                "Registration Successful",
                $"Dear {txtFirstName.Text},<br>Your registration at <b>Success24</b> is successful.");

            ClientScript.RegisterStartupScript(this.GetType(),
                "alert", "alert('Registration Successfully Saved!');", true);
        }
        private void LoadStudentData(string id)
        {
            string query = @"SELECT *, FORMAT(DOB,'yyyy-MM-dd') AS DOBF,FORMAT(JoinDate,'yyyy-MM-dd') AS JDF FROM StudentRegistration WHERE ID=" + id;
            DataTable dt = Utility._GetDataTable24(query);
            if (dt.Rows.Count == 0) return;
            DataRow dr = dt.Rows[0];
            txtFirstName.Text = dr["FirstName"].ToString();
            txtLastName.Text = dr["LastName"].ToString();
            txtDOB.Text = dr["DOBF"].ToString();
            txtBatch.Text = dr["BatchNo"].ToString();
            txtQualification.Text = dr["Qualification"].ToString();
            txtPassout.Text = dr["PassoutYear"].ToString();
            ddlCourse.SelectedValue = dr["Course"].ToString();
            txtPrimaryMobile.Text = dr["PrimaryMobile"].ToString();
            txtSecondaryMobile.Text = dr["SecondaryMobile"].ToString();
            txtWhatsapp.Text = dr["WhatsappNo"].ToString();
            txtParentMobile.Text = dr["ParentNo"].ToString();
            txtEmail1.Text = dr["Email1"].ToString();
            txtEmail2.Text = dr["Email2"].ToString();
            txtJoinDate.Text = dr["JDF"].ToString();
            txtAadhar.Text = dr["AadharNo"].ToString();
            txtPAN.Text = dr["PANNo"].ToString();
            txtVoter.Text = dr["VoterID"].ToString();
            txtPassport.Text = dr["PassportNo"].ToString();
            ddlReference.SelectedValue = dr["ReferenceName"].ToString();
            txtCurrentAddress.Text = dr["CurrentAddress"].ToString();
            txtPermanentAddress.Text = dr["PermanentAddress"].ToString();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null) return;
            string query = @"UPDATE StudentRegistration SETFirstName=@FirstName, LastName=@LastName, DOB=@DOB, BatchNo=@BatchNo,Qualification=@Qualification, PassoutYear=@PassoutYear, Course=@Course,PrimaryMobile=@PrimaryMobile, SecondaryMobile=@SecondaryMobile,WhatsappNo=@WhatsappNo, ParentNo=@ParentNo,Email1=@Email1, Email2=@Email2, JoinDate=@JoinDate,AadharNo=@AadharNo, PANNo=@PANNo, VoterID=@VoterID,PassportNo=@PassportNo, ReferenceName=@ReferenceName,CurrentAddress=@CurrentAddress, PermanentAddress=@PermanentAddress WHERE ID=" + Request.QueryString["id"];
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@BatchNo", txtBatch.Text);
                cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text);
                cmd.Parameters.AddWithValue("@PassoutYear", txtPassout.Text);
                cmd.Parameters.AddWithValue("@Course", ddlCourse.SelectedValue);
                cmd.Parameters.AddWithValue("@PrimaryMobile", txtPrimaryMobile.Text);
                cmd.Parameters.AddWithValue("@SecondaryMobile", txtSecondaryMobile.Text);
                cmd.Parameters.AddWithValue("@WhatsappNo", txtWhatsapp.Text);
                cmd.Parameters.AddWithValue("@ParentNo", txtParentMobile.Text);
                cmd.Parameters.AddWithValue("@Email1", txtEmail1.Text);
                cmd.Parameters.AddWithValue("@Email2", txtEmail2.Text);
                cmd.Parameters.AddWithValue("@JoinDate", txtJoinDate.Text);
                cmd.Parameters.AddWithValue("@AadharNo", txtAadhar.Text);
                cmd.Parameters.AddWithValue("@PANNo", txtPAN.Text);
                cmd.Parameters.AddWithValue("@VoterID", txtVoter.Text);
                cmd.Parameters.AddWithValue("@PassportNo", txtPassport.Text);
                cmd.Parameters.AddWithValue("@ReferenceName", ddlReference.SelectedValue);
                cmd.Parameters.AddWithValue("@CurrentAddress", txtCurrentAddress.Text);
                cmd.Parameters.AddWithValue("@PermanentAddress", txtPermanentAddress.Text);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            ClientScript.RegisterStartupScript(this.GetType(),
                "alert", "alert('Record Updated Successfully!');", true);
        }
    }
}