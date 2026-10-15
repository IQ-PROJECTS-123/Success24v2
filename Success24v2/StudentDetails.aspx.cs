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
    public partial class StudentDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string role = Convert.ToString(Session["Role"]);

            if (Session["UserID"] == null)
            {
                Response.Redirect("~/AdminLogin.aspx");
                return;
            }

            bool isAdmin = string.Equals(
                role, "Admin", StringComparison.OrdinalIgnoreCase);

            bool isCaller = string.Equals(
                role, "Caller", StringComparison.OrdinalIgnoreCase);

            if (!isAdmin && !isCaller)
            {
                Response.Redirect("~/MyLeads.aspx");
                return;
            }


            if (!IsPostBack)
            {
                // Show update-success popup after returning from EditStudent.aspx
                if (Session["StudentEditSuccess"] != null)
                {
                    string message =
                        Convert.ToString(Session["StudentEditSuccess"]);

                    Session.Remove("StudentEditSuccess");

                    RegisterSweetAlert(
                        "StudentUpdateSuccess",
                        "Updated Successfully!",
                        message,
                        "success");
                }

                LoadStudentDetails();
            }
        }


        // ==========================================
        // LOAD STUDENT DETAILS
        // ==========================================
        private void LoadStudentDetails(string searchText = "")
        {
            string query = @"
                SELECT
                    ID,
                    FirstName,
                    LastName,
                    DOB,
                    Course,
                    Email1,
                    PrimaryMobile,
                    Qualification,
                    PassoutYear,
                    MastersQualification,
                    MastersPassoutYear,
                    FatherName,
                    GuardianName,
                    GuardianRelationship,
                    ParentNo,
                    CurrentAddress,
                    PermanentAddress,
                    ReferenceName
                FROM StudentRegistration
                WHERE
                    @Search = ''
                    OR ISNULL(FirstName, '') LIKE @Pattern
                    OR ISNULL(LastName, '') LIKE @Pattern
                    OR ISNULL(FirstName, '') + ' ' +
                       ISNULL(LastName, '') LIKE @Pattern
                    OR ISNULL(PrimaryMobile, '') LIKE @Pattern
                    OR ISNULL(Email1, '') LIKE @Pattern
                ORDER BY ID DESC;";

            string search = (searchText ?? string.Empty).Trim();
            string pattern = "%" + search + "%";

            DataTable dt = Utility._GetDataTable24(
                query,
                new SqlParameter("@Search", SqlDbType.NVarChar, 4000)
                {
                    Value = search
                },
                new SqlParameter("@Pattern", SqlDbType.NVarChar, 4000)
                {
                    Value = pattern
                });

            gvLeadDetails.DataSource = dt;
            gvLeadDetails.DataBind();
        }



        protected void gvLeadDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLeadDetails.PageIndex =
                e.NewPageIndex;

            LoadStudentDetails(txtSearch.Text.Trim());
        }

        protected void gvLeadDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "DeleteStudent")
                return;

            int studentId;

            if (!int.TryParse(
                Convert.ToString(e.CommandArgument),
                out studentId) || studentId <= 0)
            {
                RegisterSweetAlert(
                    "InvalidStudent",
                    "Invalid Student",
                    "The selected student ID is invalid.",
                    "error");

                return;
            }

            try
            {
                string query = @"
                    DELETE FROM StudentRegistration
                    WHERE ID = @ID;";

                int rowsAffected = Utility.ExecuteQuery24(
                    query,
                    new SqlParameter("@ID", SqlDbType.Int)
                    {
                        Value = studentId
                    });

                if (rowsAffected > 0)
                {
                    // Reload the same search results after deletion
                    LoadStudentDetails(txtSearch.Text.Trim());

                    RegisterSweetAlert(
                        "StudentDeleteSuccess",
                        "Deleted Successfully!",
                        "Student record has been deleted successfully.",
                        "success");
                }
                else
                {
                    LoadStudentDetails(txtSearch.Text.Trim());

                    RegisterSweetAlert(
                        "StudentNotFound",
                        "Record Not Found",
                        "The student record was not found or was already deleted.",
                        "warning");
                }
            }
            catch (SqlException)
            {
                RegisterSweetAlert(
                    "StudentDeleteError",
                    "Delete Failed",
                    "The student could not be deleted. The record may be linked to other data.",
                    "error");
            }
            catch (Exception)
            {
                RegisterSweetAlert(
                    "StudentUnexpectedError",
                    "Something Went Wrong",
                    "An unexpected error occurred while processing the request.",
                    "error");
            }

        }



        private void RegisterSweetAlert(string key,string title,string message,string icon)
        {
            string safeTitle =
                            HttpUtility.JavaScriptStringEncode(title);

            string safeMessage =
                HttpUtility.JavaScriptStringEncode(message);

            string safeIcon =
                HttpUtility.JavaScriptStringEncode(icon);

            string script = @"
                Swal.fire({
                    title: '" + safeTitle + @"',
                    text: '" + safeMessage + @"',
                    icon: '" + safeIcon + @"',
                    confirmButtonText: 'OK',
                    confirmButtonColor: '#ea580c'
                });
            ";

            ClientScript.RegisterStartupScript(
                GetType(),
                key,
                script,
                true);

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvLeadDetails.PageIndex = 0;

            LoadStudentDetails(txtSearch.Text.Trim());
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearch.Text = string.Empty;
            gvLeadDetails.PageIndex = 0;

            LoadStudentDetails();
        }
    }
            
        
    
}