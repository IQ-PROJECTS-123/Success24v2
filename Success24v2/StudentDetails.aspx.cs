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
    public partial class StudentDetails : System.Web.UI.Page
    {
        private readonly string connectionString =ConfigurationManager.ConnectionStrings["S24"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Login check
            if (Session["UserID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }


            // Admin check
            if (Session["Role"] == null ||
                !Session["Role"]
                    .ToString()
                    .Equals(
                        "Admin",
                        StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("MyLeads.aspx");
                return;
            }


            if (!IsPostBack)
            {
                LoadStudentDetails();
            }
        }


        private void LoadStudentDetails()
        {
            DataTable dt = new DataTable();

            using (SqlConnection con =
                new SqlConnection(connectionString))
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

                    ORDER BY ID DESC;
                ";


                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da =
                        new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }


            gvLeadDetails.DataSource = dt;

            gvLeadDetails.DataBind();
        }



        protected void gvLeadDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLeadDetails.PageIndex =
                e.NewPageIndex;

            LoadStudentDetails();
        }
    }
}