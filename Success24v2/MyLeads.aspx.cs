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
    public partial class MyLeads : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["S24"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // User login nahi hai to Login page par bhejo
            if (Session["UserID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {

                GetCurrentUserID();

                CurrentFilter = "All";

                SetActiveFilter(CurrentFilter);

                ShowMyLeads();

                LoadStatistics();

            }
        }

        private void ShowMyLeads()
        {
            pnlMyLeads.Visible = true;
            pnlFollowUps.Visible = false;
            pnlConverted.Visible = false;

            LoadMyLeads();
        } 
       
        // =====================================
        // Temporary User ID
        // =====================================

        private int GetCurrentUserID()
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return 0;
            }

            return Convert.ToInt32(Session["UserID"]);
        }


        // =====================================
        // Load only current user's leads
        // =====================================

        private void LoadMyLeads()
        {
            int userID = GetCurrentUserID();

            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query = @"SELECT L.ID, L.Name, L.Email, L.Phone, L.Qualification, L.Stream, L.PassingYear, L.Status, LA.AssignedOn, M.Name AS AssignedTo FROM LeadAssignment LA INNER JOIN Leads L ON LA.LeadID = L.ID INNER JOIN Members M ON LA.AssignedTo = M.ID WHERE LA.AssignedTo = @UserID AND LA.IsActive = 1 ";

                if (CurrentFilter != "All")
                {
                    query += @"
                        AND L.Status = @Status
                    ";
                                }

                    query += @"
                    ORDER BY
                        LA.AssignedOn DESC,
                        L.ID DESC
                ";
                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                        "@UserID",
                        SqlDbType.Int
                    ).Value = userID;

                    if (CurrentFilter != "All")
                    {
                        cmd.Parameters.Add(
                            "@Status",
                            SqlDbType.VarChar,
                            50
                        ).Value = CurrentFilter;
                    }


                    using (SqlDataAdapter da =
                        new SqlDataAdapter(cmd))
                    {
                        DataTable dt =
                            new DataTable();

                        da.Fill(dt);

                        gvMyLeads.DataSource = dt;

                        gvMyLeads.DataBind();


                        // Set caller name
                        if (dt.Rows.Count > 0)
                        {
                            lblUserName.Text =
                                dt.Rows[0]["AssignedTo"].ToString();
                        }
                    }
                }
            }
        }


        // =====================================
        // Statistics
        // =====================================

        private void LoadStatistics()
        {
            int userID = GetCurrentUserID();


            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query = @"SELECT COUNT(*) AS TotalLeads, SUM(CASE WHEN L.Status = 'Assigned' THEN 1 ELSE 0 END) AS Assigned,SUM(CASE WHEN L.Status = 'Follow Up' THEN 1 ELSE 0 END) AS FollowUps FROM LeadAssignment LA INNER JOIN Leads L ON LA.LeadID = L.ID WHERE LA.AssignedTo = @UserID AND LA.IsActive = 1";


                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                        "@UserID",
                        SqlDbType.Int
                    ).Value = userID;


                    con.Open();

                    using (SqlDataReader reader =
                        cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblTotal.Text =
                                reader["TotalLeads"].ToString();


                            lblAssigned.Text =
                                reader["Assigned"].ToString();


                            lblFollowUp.Text =
                                reader["FollowUps"].ToString();
                        }
                    }
                }
            }
        }



        protected void gvMyLeads_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMyLeads.PageIndex = e.NewPageIndex;

            Session["MyLeadsPageIndex"] = e.NewPageIndex;

            LoadMyLeads();
        }

        // =====================================
        // Status CSS
        // =====================================

        protected string GetStatusClass(
            object statusValue)
        {
            string status =
                Convert.ToString(statusValue);


            switch (status.Trim().ToLower())
            {
                case "assigned":

                    return "assigned";


                case "follow up":

                    return "followup";


                default:

                    return "assigned";
            }
        }

        protected void btnFollowUps_Click(object sender, EventArgs e)
        {
            pnlMyLeads.Visible = false;
            pnlFollowUps.Visible = true;
            pnlConverted.Visible = false;

            LoadFollowUps();
        }

        private void LoadFollowUps()
        {
            int userID = GetCurrentUserID();

            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query = @"

            SELECT

                L.ID,
                L.Name,
                L.Phone,
                L.Email,
                L.Status,

                LF.FollowUpDate,

                LF.Feedback AS LastFeedback

            FROM Leads L

            INNER JOIN LeadAssignment LA
                ON LA.LeadID = L.ID

            INNER JOIN LeadFeedback LF
                ON LF.LeadID = L.ID
                AND LF.AssignedTo = @UserID

            WHERE

                LA.AssignedTo = @UserID

                AND LA.IsActive = 1

                AND LF.Status = 'Follow Up'

                AND LF.FollowUpDate IS NOT NULL

            ORDER BY

                LF.FollowUpDate ASC,
                L.ID DESC
        ";


                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                        "@UserID",
                        SqlDbType.Int
                    ).Value = userID;


                    using (SqlDataAdapter da =
                        new SqlDataAdapter(cmd))
                    {
                        DataTable dt =
                            new DataTable();

                        da.Fill(dt);

                        gvFollowUps.DataSource = dt;

                        gvFollowUps.DataBind();
                    }
                }
            }
        }

        protected void gvFollowUps_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFollowUps.PageIndex =  e.NewPageIndex;

            pnlFollowUps.Visible = true;

            LoadFollowUps();
        }
        private void LoadConverted()
        {
            int userID = GetCurrentUserID();

            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query = @"

            SELECT

                L.ID,
                L.Name,
                L.Phone,
                L.Email,
                L.Status,

                LF.FollowUpDate,

                LF.Feedback AS LastFeedback

            FROM Leads L

            INNER JOIN LeadAssignment LA
                ON LA.LeadID = L.ID

            INNER JOIN LeadFeedback LF
                ON LF.LeadID = L.ID
                AND LF.AssignedTo = @UserID

            WHERE

                LA.AssignedTo = @UserID

                AND LA.IsActive = 1

                AND LF.Status = 'Converted'

                AND LF.FollowUpDate IS NOT NULL

            ORDER BY

                LF.FollowUpDate ASC,
                L.ID DESC
        ";


                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                        "@UserID",
                        SqlDbType.Int
                    ).Value = userID;


                    using (SqlDataAdapter da =
                        new SqlDataAdapter(cmd))
                    {
                        DataTable dt =
                            new DataTable();

                        da.Fill(dt);

                        gvConverted.DataSource = dt;

                        gvConverted.DataBind();
                    }
                }
            }
        }


        protected void btnconverted_Click(object sender, EventArgs e)
        {
            pnlMyLeads.Visible = false;
            pnlFollowUps.Visible = false;
            pnlConverted.Visible = true;

            LoadConverted();
        }

        protected void gvConverted_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvConverted.PageIndex = e.NewPageIndex;
            pnlMyLeads.Visible = false;
            pnlFollowUps.Visible = false;
            pnlConverted.Visible = true;

            LoadConverted();
        }

        private string CurrentFilter
        {
            get
            {
                return ViewState["LeadFilter"] == null
                    ? "All"
                    : ViewState["LeadFilter"].ToString();
            }
            set
            {
                ViewState["LeadFilter"] = value;
            }
        }

        private void SetActiveFilter(string filter)
        {
            btnAllLeads.CssClass = "lead-filter";
            btnFollowUp.CssClass = "lead-filter";
            btnConvertedFilter.CssClass = "lead-filter";
            btnInterested.CssClass = "lead-filter";
            btnWorking.CssClass = "lead-filter";
            btnNotInterested.CssClass = "lead-filter";

            switch (filter)
            {
                case "Follow Up":

                    btnFollowUp.CssClass =
                        "lead-filter active";

                    lblLeadGridTitle.Text =
                        "My Follow Up Leads";

                    break;


                case "Converted":

                    btnConvertedFilter.CssClass =
                        "lead-filter active";

                    lblLeadGridTitle.Text =
                        "My Converted Leads";

                    break;


                case "Interested":

                    btnInterested.CssClass =
                        "lead-filter active";

                    lblLeadGridTitle.Text =
                        "My Interested Leads";

                    break;


                case "Working":

                    btnWorking.CssClass =
                        "lead-filter active";

                    lblLeadGridTitle.Text =
                        "My Working Leads";

                    break;


                case "Not Interested":

                    btnNotInterested.CssClass =
                        "lead-filter active";

                    lblLeadGridTitle.Text =
                        "My Not Interested Leads";

                    break;


                default:

                    btnAllLeads.CssClass =
                        "lead-filter active";

                    lblLeadGridTitle.Text =
                        "My Assigned Leads";

                    break;
            }
        }

        protected void LeadFilter_Command(object sender, CommandEventArgs e)
        {
            CurrentFilter = e.CommandArgument.ToString();

            gvMyLeads.PageIndex = 0;

            SetActiveFilter(CurrentFilter);

            ShowMyLeads();

            LoadStatistics();
        }
    }
    
}