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
    public partial class LeadManagement : System.Web.UI.Page
    {
        private readonly string connectionString =
           ConfigurationManager.ConnectionStrings["S24"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (Session["Role"] == null ||
                !Session["Role"].ToString().Equals(
                    "Admin",
                    StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUsers();
                BindLeads();
                LoadStatistics();
            }
        }

        private void LoadUsers()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT ID, Name FROM Members WHERE IsActive = 1 AND Role = 'Caller' ORDER BY Name";


                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    ddlUsers.DataSource = reader;

                    ddlUsers.DataTextField = "Name";

                    ddlUsers.DataValueField = "ID";

                    ddlUsers.DataBind();

                    reader.Close();
                }
            }

            ddlUsers.Items.Insert(
                0,
                new ListItem("-- Select Person --", "0")
            );
        }
        // ==========================================
        // Load Leads
        // ==========================================

        private void BindLeads()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT L.ID, L.Name, L.Email,L.Phone, L.Qualification, L.Stream, L.PassingYear, L.Status, ISNULL(M.Name, 'Not Assigned') AS AssignTo FROM Leads L LEFT JOIN LeadAssignment LA ON L.ID = LA.LeadID AND LA.IsActive = 1 LEFT JOIN Members M ON LA.AssignedTo = M.ID  ORDER BY L.ID DESC";


                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        gvLeads.DataSource = dt;
                        gvLeads.DataBind();
                    }
                }
            }
        }


        // ==========================================
        // Statistics
        // ==========================================

        private void LoadStatistics()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT COUNT(*) AS TotalLeads, SUM(CASE WHEN Status = 'New' THEN 1 ELSE 0 END) AS NewLeads, SUM(CASE WHEN Status = 'Assigned' THEN 1 ELSE 0 END) AS AssignedLeads,SUM(CASE WHEN Status = 'Follow Up' THEN 1 ELSE 0 END) AS FollowUps FROM Leads";


                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblTotalLeads.Text =
                        reader["TotalLeads"].ToString();


                    lblNewLeads.Text =
                        reader["NewLeads"].ToString();


                    lblAssigned.Text =
                        reader["AssignedLeads"].ToString();


                    lblFollowUps.Text =
                        reader["FollowUps"].ToString();
                }
            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SearchLeads();
        }

        protected void gvLeads_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvLeads.PageIndex = e.NewPageIndex;

            BindLeads();
        }
        private void SearchLeads()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT L.ID, L.Name, L.Email, L.Phone, L.Qualification, L.Stream, L.PassingYear, L.Status, ISNULL(U.Name, 'Not Assigned') AS AssignTo FROM Leads L LEFT JOIN LeadAssignment LA ON L.ID = LA.LeadID AND LA.IsActive = 1 LEFT JOIN Members U ON LA.AssignedTo = U.ID WHERE L.Name LIKE @Search OR L.Email LIKE @Search OR L.Phone LIKE @Search ORDER BY L.ID DESC";
                SqlCommand cmd =
                    new SqlCommand(query, con);


                cmd.Parameters.Add(
                    "@Search",
                    SqlDbType.NVarChar,
                    200
                ).Value =
                    "%" + txtSearch.Text.Trim() + "%";


                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);


                DataTable dt =
                    new DataTable();


                da.Fill(dt);


                gvLeads.DataSource = dt;

                gvLeads.DataBind();
            }
        }


        // ==========================================
        // Status CSS
        // ==========================================

        protected string GetStatusClass(object statusValue)
        {
            string status = Convert.ToString(statusValue);

            switch (status.Trim().ToLower())
            {
                case "new":
                    return "status-new";

                case "assigned":
                    return "status-assigned";

                case "follow up":
                case "followup":
                    return "status-followup";

                case "converted":
                    return "status-converted";

                default:
                    return "status-new";
            }
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            // Person validation
            if (ddlUsers.SelectedValue == "0")
            {
                lblMessage.Text = "Please select a person.";
                lblMessage.CssClass = "error-message";
                return;
            }


            // Lead count validation
            int leadCount;

            if (!int.TryParse(txtLeadCount.Text.Trim(), out leadCount)
                || leadCount <= 0)
            {
                lblMessage.Text = "Please enter a valid lead count.";
                lblMessage.CssClass = "error-message";
                return;
            }


            int userID = Convert.ToInt32(ddlUsers.SelectedValue);


            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                SqlTransaction transaction = con.BeginTransaction();

                try
                {
                    // ==========================================
                    // Find available leads
                    // ==========================================

                    string selectQuery = @"SELECT TOP (@LeadCount) L.ID FROM Leads L WHERE L.Status = 'New' AND NOT EXISTS (SELECT 1 FROM LeadAssignment LA WHERE LA.LeadID = L.ID AND LA.IsActive = 1) ORDER BY L.ID";


                    List<int> leadIDs = new List<int>();


                    using (SqlCommand cmd = new SqlCommand(
                        selectQuery,
                        con,
                        transaction))
                    {
                        cmd.Parameters.Add(
                            "@LeadCount",
                            SqlDbType.Int
                        ).Value = leadCount;


                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                leadIDs.Add(
                                    Convert.ToInt32(reader["ID"])
                                );
                            }
                        }
                    }


                    // No new leads
                    if (leadIDs.Count == 0)
                    {
                        transaction.Rollback();

                        lblMessage.Text =
                            "No new leads are available for assignment.";

                        lblMessage.CssClass =
                            "error-message";

                        return;
                    }


                    // ==========================================
                    // Assign each lead
                    // ==========================================

                    foreach (int leadID in leadIDs)
                    {
                        string insertQuery = @"INSERT INTO LeadAssignment(LeadID,AssignedTo,AssignedOn,IsActive) VALUES (@LeadID,@UserID,GETDATE(),1)";


                        using (SqlCommand cmdInsert =
                            new SqlCommand(
                                insertQuery,
                                con,
                                transaction))
                        {
                            cmdInsert.Parameters.Add(
                                "@LeadID",
                                SqlDbType.Int
                            ).Value = leadID;


                            cmdInsert.Parameters.Add(
                                "@UserID",
                                SqlDbType.Int
                            ).Value = userID;


                            cmdInsert.ExecuteNonQuery();
                        }


                        // ======================================
                        // Update Lead Status
                        // ======================================

                        string updateQuery = @"UPDATE Leads SET Status = 'Assigned' WHERE ID = @LeadID";

                        using (SqlCommand cmdUpdate =
                            new SqlCommand(
                                updateQuery,
                                con,
                                transaction))
                        {
                            cmdUpdate.Parameters.Add(
                                "@LeadID",
                                SqlDbType.Int
                            ).Value = leadID;


                            cmdUpdate.ExecuteNonQuery();
                        }
                    }


                    transaction.Commit();


                    lblMessage.Text =
                        leadIDs.Count +
                        " leads successfully assigned to " +
                        ddlUsers.SelectedItem.Text +
                        ".";

                    lblMessage.CssClass =
                        "success-message";
                }
                catch (Exception ex)
                {
                    transaction.Rollback();

                    lblMessage.Text =
                        "Error: " + ex.Message;

                    lblMessage.CssClass =
                        "error-message";
                }
            }


            // ==========================================
            // Refresh Grid
            // ==========================================

            BindLeads();

            LoadStatistics();
        }


    }
    
}