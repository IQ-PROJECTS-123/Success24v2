using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class EditStudent : System.Web.UI.Page
    {
        private int StudentId
        {
            get
            {
                int id;
                return int.TryParse(Request.QueryString["ID"], out id)
                    ? id : 0;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {            
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/AdminLogin.aspx");
                return;
            }

            if (Session["Role"] == null ||
                !string.Equals(Session["Role"].ToString(), "Admin",
                    StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("~/MyLeads.aspx");
                return;
            }
            if (Session["Role"] == null ||
               !string.Equals(Session["Role"].ToString(), "Caller",
                   StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("~/MyLeads.aspx");
                return;
            }

            if (StudentId <= 0)
            {
                ShowMessage("Invalid student ID.", false);
                pnlEditForm.Visible = false;
                return;
            }

            if (!IsPostBack)
            {
                LoadStudent();
            }
        }

        private void LoadStudent()
        {
            string query = @"
                SELECT ID, FirstName, LastName, DOB, Course,BatchNo, Email1,
                       PrimaryMobile, Qualification, PassoutYear,
                       MastersQualification, MastersPassoutYear,
                       FatherName, GuardianName, GuardianRelationship,
                       ParentNo, CurrentAddress, PermanentAddress,
                       ReferenceName
                FROM StudentRegistration
                WHERE ID = @ID;";

            DataTable dt = Utility._GetDataTable24(
                query,
                new SqlParameter("@ID", SqlDbType.Int)
                {
                    Value = StudentId
                });

            if (dt == null || dt.Rows.Count == 0)
            {
                ShowMessage("Student record not found.", false);
                pnlEditForm.Visible = false;
                return;
            }

            DataRow row = dt.Rows[0];

            lblStudentId.Text = "Student ID: " + StudentId;

            txtFirstName.Text = GetText(row, "FirstName");
            txtLastName.Text = GetText(row, "LastName");
            txtDOB.Text = GetDateForInput(row, "DOB");
            txtCourse.Text = GetText(row, "Course");
            txtbatch.Text = GetText(row, "BatchNo");
            txtEmail.Text = GetText(row, "Email1");
            txtMobile.Text = GetText(row, "PrimaryMobile");

            txtQualification.Text = GetText(row, "Qualification");
            txtPassoutYear.Text = GetText(row, "PassoutYear");
            txtMastersQualification.Text = GetText(row, "MastersQualification");
            txtMastersPassoutYear.Text = GetText(row, "MastersPassoutYear");

            txtFatherName.Text = GetText(row, "FatherName");
            txtGuardianName.Text = GetText(row, "GuardianName");
            txtGuardianRelationship.Text = GetText(row, "GuardianRelationship");
            txtParentNo.Text = GetText(row, "ParentNo");

            txtCurrentAddress.Text = GetText(row, "CurrentAddress");
            txtPermanentAddress.Text = GetText(row, "PermanentAddress");
            txtReferenceName.Text = GetText(row, "ReferenceName");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            if (StudentId <= 0)
            {
                ShowMessage("Invalid student ID.", false);
                return;
            }

            DateTime dob;
            object dobValue = DBNull.Value;

            if (!string.IsNullOrWhiteSpace(txtDOB.Text))
            {
                if (!DateTime.TryParse(txtDOB.Text, out dob))
                {
                    ShowMessage("Please enter a valid date of birth.", false);
                    return;
                }

                dobValue = dob.Date;
            }

            string query = @"
                UPDATE StudentRegistration
                SET FirstName = @FirstName,
                    LastName = @LastName,
                    DOB = @DOB,
                    Course = @Course,
                    BatchNo=@BatchNo,
                    Email1 = @Email1,
                    PrimaryMobile = @PrimaryMobile,
                    Qualification = @Qualification,
                    PassoutYear = @PassoutYear,
                    MastersQualification = @MastersQualification,
                    MastersPassoutYear = @MastersPassoutYear,
                    FatherName = @FatherName,
                    GuardianName = @GuardianName,
                    GuardianRelationship = @GuardianRelationship,
                    ParentNo = @ParentNo,
                    CurrentAddress = @CurrentAddress,
                    PermanentAddress = @PermanentAddress,
                    ReferenceName = @ReferenceName
                WHERE ID = @ID;";

            SqlParameter[] parameters =
            {
                new SqlParameter("@FirstName", SqlDbType.NVarChar, 100)
                    { Value = txtFirstName.Text.Trim() },

                new SqlParameter("@LastName", SqlDbType.NVarChar, 100)
                    { Value = DbValue(txtLastName.Text) },

                new SqlParameter("@DOB", SqlDbType.Date)
                    { Value = dobValue },

                new SqlParameter("@Course", SqlDbType.NVarChar, 150)
                    { Value = DbValue(txtCourse.Text) },
                new SqlParameter("BatchNo",SqlDbType.NVarChar,10)
                {Value=DbValue(txtbatch.Text) },

                new SqlParameter("@Email1", SqlDbType.NVarChar, 200)
                    { Value = DbValue(txtEmail.Text) },

                new SqlParameter("@PrimaryMobile", SqlDbType.NVarChar, 20)
                    { Value = DbValue(txtMobile.Text) },

                new SqlParameter("@Qualification", SqlDbType.NVarChar, 150)
                    { Value = DbValue(txtQualification.Text) },

                new SqlParameter("@PassoutYear", SqlDbType.NVarChar, 10)
                    { Value = DbValue(txtPassoutYear.Text) },

                new SqlParameter("@MastersQualification", SqlDbType.NVarChar, 150)
                    { Value = DbValue(txtMastersQualification.Text) },

                new SqlParameter("@MastersPassoutYear", SqlDbType.NVarChar, 10)
                    { Value = DbValue(txtMastersPassoutYear.Text) },

                new SqlParameter("@FatherName", SqlDbType.NVarChar, 150)
                    { Value = DbValue(txtFatherName.Text) },

                new SqlParameter("@GuardianName", SqlDbType.NVarChar, 150)
                    { Value = DbValue(txtGuardianName.Text) },

                new SqlParameter("@GuardianRelationship", SqlDbType.NVarChar, 100)
                    { Value = DbValue(txtGuardianRelationship.Text) },

                new SqlParameter("@ParentNo", SqlDbType.NVarChar, 20)
                    { Value = DbValue(txtParentNo.Text) },

                new SqlParameter("@CurrentAddress", SqlDbType.NVarChar, 1000)
                    { Value = DbValue(txtCurrentAddress.Text) },

                new SqlParameter("@PermanentAddress", SqlDbType.NVarChar, 1000)
                    { Value = DbValue(txtPermanentAddress.Text) },

                new SqlParameter("@ReferenceName", SqlDbType.NVarChar, 150)
                    { Value = DbValue(txtReferenceName.Text) },

                new SqlParameter("@ID", SqlDbType.Int)
                    { Value = StudentId }
            };


            try
            {
                int rows = Utility.ExecuteQuery24(query, parameters);

                if (rows > 0)
                {
                    Session["StudentEditSuccess"] =
                        "Student details updated successfully.";

                    Response.Redirect("~/StudentDetails.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }
                else
                {
                    ShowMessage(
                        "No record was updated. Please reload and try again.",
                        false);
                }
            }
            catch (SqlException)
            {
                ShowMessage(
                    "Database could not update the student. Check the field types and required columns.",
                    false);
            }
        }

        private static string GetText(DataRow row, string column)
        {
            if (row[column] == DBNull.Value)
                return string.Empty;

            return Convert.ToString(row[column]);
        }

        private static string GetDateForInput(DataRow row, string column)
        {
            if (row[column] == DBNull.Value)
                return string.Empty;

            DateTime date;
            if (DateTime.TryParse(Convert.ToString(row[column]), out date))
                return date.ToString("yyyy-MM-dd");

            return string.Empty;
        }

        private static object DbValue(string value)
        {
            return string.IsNullOrWhiteSpace(value)
                ? (object)DBNull.Value
                : value.Trim();
        }

        private void ShowMessage(string message, bool success)
        {
            lblMessage.Text = Server.HtmlEncode(message);
            lblMessage.CssClass = success
                ? "message message-success"
                : "message message-error";
        }
    }
}