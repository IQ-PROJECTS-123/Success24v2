using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
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

                CurrentFilter = "Today";

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

                if (CurrentFilter == "Today")
                {
                 query += @"
                    AND CAST(LA.AssignedOn AS DATE) = CAST(GETDATE() AS DATE)
                ";
                }
                else if (CurrentFilter != "All")
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

                    if (CurrentFilter != "All" &&
                         CurrentFilter != "Today")
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
            btnTodayLeads.CssClass = "lead-filter";
            btnAllLeads.CssClass = "lead-filter";
            btnFollowUp.CssClass = "lead-filter";
            btnConvertedFilter.CssClass = "lead-filter";
            btnInterested.CssClass = "lead-filter";
            btnWorking.CssClass = "lead-filter";
            btnNotInterested.CssClass = "lead-filter";

            switch (filter)
            {
                case "Today":

                    btnTodayLeads.CssClass =
                        "lead-filter active";

                    lblLeadGridTitle.Text =
                        "Today's Assigned Leads";

                    break;

                case "All":

                    btnAllLeads.CssClass =
                        "lead-filter active";

                    lblLeadGridTitle.Text =
                        "All My Leads";

                    break;

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
            }
        }
        private class LeadReport
        {
            public int Total { get; set; }
            public int Completed { get; set; }
            public int Pending { get; set; }

            public int Interested { get; set; }

            public int NotInterested { get; set; }

            public int Working { get; set; }

            public int FollowUp { get; set; }

            public int Converted { get; set; }
        }

        private LeadReport GetTodayLeadReport(int userID)
        {
            LeadReport report = new LeadReport();

            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query = @"
           SELECT
                    COUNT(*) AS Total,

                    SUM(
                        CASE
                            WHEN L.Status IN
                            (
                                'Interested',
                                'Not Interested',
                                'Working',
                                'Follow Up',
                                'Converted'
                            )
                            THEN 1
                            ELSE 0
                        END
                    ) AS Completed,

                    SUM(
                        CASE
                            WHEN L.Status = 'Assigned'
                            THEN 1
                            ELSE 0
                        END
                    ) AS Pending,

                    SUM(CASE
                        WHEN L.Status = 'Interested'
                        THEN 1 ELSE 0
                    END) AS Interested,

                SUM(CASE
                    WHEN L.Status = 'Not Interested'
                    THEN 1 ELSE 0
                END) AS NotInterested,

                SUM(CASE
                    WHEN L.Status = 'Working'
                    THEN 1 ELSE 0
                END) AS Working,

                SUM(CASE
                    WHEN L.Status = 'Follow Up'
                    THEN 1 ELSE 0
                END) AS FollowUp,

                SUM(CASE
                    WHEN L.Status = 'Converted'
                    THEN 1 ELSE 0
                END) AS Converted

            FROM LeadAssignment LA

            INNER JOIN Leads L
                ON LA.LeadID = L.ID

            WHERE
                LA.AssignedTo = @UserID
                AND LA.IsActive = 1
                AND CAST(LA.AssignedOn AS DATE)
                    = CAST(GETDATE() AS DATE)
        ";

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
                            report.Total =
                                reader["Total"] == DBNull.Value
                                    ? 0
                                    : Convert.ToInt32(reader["Total"]);
                            report.Completed =
                                reader["Completed"] == DBNull.Value
                                    ? 0
                                    : Convert.ToInt32(reader["Completed"]);

                            report.Pending =
                                reader["Pending"] == DBNull.Value
                                    ? 0
                                    : Convert.ToInt32(reader["Pending"]);

                            report.Interested =
                                reader["Interested"] == DBNull.Value
                                    ? 0
                                    : Convert.ToInt32(reader["Interested"]);

                            report.NotInterested =
                                reader["NotInterested"] == DBNull.Value
                                    ? 0
                                    : Convert.ToInt32(reader["NotInterested"]);

                            report.Working =
                                reader["Working"] == DBNull.Value
                                    ? 0
                                    : Convert.ToInt32(reader["Working"]);

                            report.FollowUp =
                                reader["FollowUp"] == DBNull.Value
                                    ? 0
                                    : Convert.ToInt32(reader["FollowUp"]);

                            report.Converted =
                                reader["Converted"] == DBNull.Value
                                    ? 0
                                    : Convert.ToInt32(reader["Converted"]);
                        }
                    }
                }
            }

            return report;
        }



        private string GetCurrentUserEmail(int userID)
        {
            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query = @"
            SELECT Email
            FROM Members
            WHERE ID = @UserID
              AND IsActive = 1
        ";

                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                        "@UserID",
                        SqlDbType.Int
                    ).Value = userID;

                    con.Open();

                    object result =
                        cmd.ExecuteScalar();

                    if (result == null ||
                        result == DBNull.Value)
                    {
                        return "";
                    }

                    return result.ToString();
                }
            }
        }

        protected void LeadFilter_Command(object sender, CommandEventArgs e)
        {
            CurrentFilter = e.CommandArgument.ToString();

            gvMyLeads.PageIndex = 0;

            SetActiveFilter(CurrentFilter);

            pnlMyLeads.Visible = true;
            pnlFollowUps.Visible = false;
            pnlConverted.Visible = false;

            LoadMyLeads();
        }

        protected void btnSendReport_Click(object sender, EventArgs e)
        {

            try
            {
                int userID = GetCurrentUserID();

                string userName =
                    Convert.ToString(Session["UserName"]);

                LeadReport report =
                    GetTodayLeadReport(userID);


                string emailBody = $@"
        <html>
        <body style='font-family:Arial;font-size:14px;'>

            <h3>Today's Assigned Leads Report</h3>

            <table border='1'
                   cellpadding='8'
                   cellspacing='0'
                   style='width:70%;
                          border-collapse:collapse;
                          font-family:Arial;
                          font-size:14px;'>

                <tr>
                    <td><b>Caller Name</b></td>
                    <td>{userName}</td>
                </tr>

                <tr>
                    <td><b>Date</b></td>
                    <td>{DateTime.Today:dd-MMM-yyyy}</td>
                </tr>

                <tr>
                    <td><b>Total Today's Assigned Leads</b></td>
                    <td><b>{report.Total}</b></td>
                </tr>

                <tr>
                    <td><b>Completed</b></td>
                    <td>{report.Completed}</td>
                </tr>

                <tr>
                    <td><b>Pending</b></td>
                    <td><b>{report.Pending}</b></td>
                </tr>

                <tr>
                    <td><b>Interested</b></td>
                    <td>{report.Interested}</td>
                </tr>

                <tr>
                    <td><b>Not Interested</b></td>
                    <td>{report.NotInterested}</td>
                </tr>

                <tr>
                    <td><b>Working</b></td>
                    <td>{report.Working}</td>
                </tr>

                <tr>
                    <td><b>Follow Up</b></td>
                    <td>{report.FollowUp}</td>
                </tr>

                <tr>
                    <td><b>Converted</b></td>
                    <td>{report.Converted}</td>
                </tr>

            </table>

            <br />

            <p>
                Regards,<br />
                Success24 Lead Management
            </p>

        </body>
        </html>";


                bool emailSent = Utility._SendEmail(
                    "Shrikantkumar.info@gmail.com",
                    "",
                    "Today's Lead Report - " + userName,
                    emailBody
                );


                if (emailSent)
                {
                    ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "EmailSuccess",
                        "alert('Today\\'s lead report has been sent successfully.');",
                        true
                    );
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                        this,
                        this.GetType(),
                        "EmailError",
                        "alert('Unable to send email.');",
                        true
                    );
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(
                    this,
                    this.GetType(),
                    "EmailError",
                    "alert('Unable to send email: " +
                    HttpUtility.JavaScriptStringEncode(ex.Message) +
                    "');",
                    true
                );
            }
        }
    }
}