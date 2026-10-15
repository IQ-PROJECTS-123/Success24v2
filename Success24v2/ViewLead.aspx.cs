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
    public partial class ViewLead : System.Web.UI.Page
    {
        private readonly string connectionString =
            ConfigurationManager.ConnectionStrings["S24"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null ||
                Session["Role"] == null ||
                !Session["Role"].ToString().Equals(
                    "Admin", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("~/AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
                LoadLead();
        }

        private void LoadLead()
        {
            int leadID;

            if (!int.TryParse(Request.QueryString["id"], out leadID) || leadID <= 0)
            {
                Response.Redirect("~/LeadManagement.aspx");
                return;
            }

            string query = @"
                SELECT TOP 1
                    L.ID,
                    L.Name,
                    L.Email,
                    L.Phone,
                    L.Qualification,
                    L.Stream,
                    L.PassingYear,
                    L.Status,
                    ISNULL(M.Name, 'Not Assigned') AS AssignTo
                FROM dbo.Leads L
                LEFT JOIN dbo.LeadAssignment LA
                    ON LA.LeadID = L.ID AND LA.IsActive = 1
                LEFT JOIN dbo.Members M
                    ON M.ID = LA.AssignedTo
                WHERE L.ID = @ID
                ORDER BY LA.AssignedOn DESC";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = leadID;
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (!reader.Read())
                    {
                        Response.Redirect("~/LeadManagement.aspx");
                        return;
                    }

                    lblID.Text = Convert.ToString(reader["ID"]);
                    lblName.Text = Convert.ToString(reader["Name"]);
                    lblEmail.Text = Convert.ToString(reader["Email"]);
                    lblPhone.Text = Convert.ToString(reader["Phone"]);

                    lblQualification.Text = reader["Qualification"] == DBNull.Value
                        ? "—" : Convert.ToString(reader["Qualification"]);

                    lblStream.Text = reader["Stream"] == DBNull.Value
                        ? "—" : Convert.ToString(reader["Stream"]);

                    lblPassingYear.Text = reader["PassingYear"] == DBNull.Value
                        ? "—" : Convert.ToString(reader["PassingYear"]);

                    lblStatus.Text = reader["Status"] == DBNull.Value
                        ? "—" : Convert.ToString(reader["Status"]);

                    lblAssignTo.Text = Convert.ToString(reader["AssignTo"]);
                }
            }

            lnkEdit.NavigateUrl = "~/Edit.aspx?id=" + leadID;
        }

    }
}
