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
            if (Session["UserID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                GetCurrentUserID();
                // Default filter = Today's Leads
                CurrentFilter = "Today";
                // Start from page 1
                gvMyLeads.PageIndex = 0;
                // Highlight Today's Leads button
                SetActiveFilter("Today");
                // Show My Leads panel
                pnlMyLeads.Visible = true;
                pnlFollowUps.Visible = false;
                pnlConverted.Visible = false;
                // Load today's assigned leads
                LoadMyLeads();
            }

            // Always refresh statistics
            LoadStatistics();

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
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT L.ID,L.Name,L.Email,L.Phone,L.Qualification,L.Stream,L.PassingYear,L.Status,LA.AssignedOn,M.Name AS AssignedTo FROM LeadAssignment LA INNER JOIN Leads L ON LA.LeadID = L.ID INNER JOIN Members M ON LA.AssignedTo = M.ID WHERE LA.AssignedTo = @UserID AND LA.IsActive = 1";

                // =====================================
                // TODAY'S ASSIGNED LEADS
                // =====================================

                if (CurrentFilter == "Today")
                {
                    query += @"
                    AND LA.AssignedOn >= CAST(GETDATE() AS DATE)
                    AND LA.AssignedOn < DATEADD(DAY, 1, CAST(GETDATE() AS DATE))";
                }

                // =====================================
                // TODAY'S FOLLOW UPS
                // =====================================

                else if (CurrentFilter == "TodayFollowup")
                {
                    query += @"AND L.Status = 'Follow Up' AND EXISTS(SELECT 1 FROM (SELECT LF.LeadID,LF.AssignedTo,LF.Status,LF.FollowUpDate,ROW_NUMBER() OVER(PARTITION BY LF.LeadID, LF.AssignedTo ORDER BY LF.FeedbackOn DESC, LF.ID DESC) AS RN FROM LeadFeedback LF WHERE LF.AssignedTo = @UserID) LatestFeedback WHERE LatestFeedback.LeadID = L.ID AND LatestFeedback.RN = 1 AND LatestFeedback.Status = 'Follow Up' AND LatestFeedback.FollowUpDate IS NOT NULL AND CAST(LatestFeedback.FollowUpDate AS DATE)= CAST(GETDATE() AS DATE))";
                }
                // =====================================
                // STATUS FILTER
                // =====================================

                else if (CurrentFilter != "All")
                {
                    query += @" 
                            AND L.Status = @Status
                            ";
                }

                // =====================================
                // ORDER
                // =====================================

                query += @"
                        ORDER BY LA.AssignedOn DESC,L.ID DESC
                        ";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // =====================================
                    // USER ID
                    // =====================================

                    cmd.Parameters.Add("@UserID",SqlDbType.Int).Value = userID;

                    // =====================================
                    // STATUS PARAMETER
                    // =====================================

                    if (CurrentFilter != "All" && CurrentFilter != "Today" && CurrentFilter != "TodayFollowup")
                    {
                        cmd.Parameters.Add("@Status", SqlDbType.VarChar,50).Value = CurrentFilter;
                    }

                    // =====================================
                    // LOAD DATA
                    // =====================================

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gvMyLeads.DataSource = dt;
                        gvMyLeads.DataBind();

                        // =====================================
                        // USER NAME
                        // =====================================

                        if (dt.Rows.Count > 0)
                        {
                            lblUserName.Text = dt.Rows[0]["AssignedTo"].ToString();
                        }
                        else
                        {
                            lblUserName.Text = "";
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
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT COUNT(*) AS TotalLeads, SUM(CASE WHEN L.Status = 'Assigned' THEN 1 ELSE 0 END) AS Assigned,SUM(CASE WHEN L.Status = 'Follow Up' THEN 1 ELSE 0 END) AS FollowUps,SUM(CASE WHEN L.Status = 'Converted' THEN 1 ELSE 0 END) AS Converted FROM LeadAssignment LA INNER JOIN Leads L ON LA.LeadID = L.ID WHERE LA.AssignedTo = @UserID AND LA.IsActive = 1";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = userID;
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblTotal.Text = reader["TotalLeads"].ToString();
                            lblAssigned.Text =reader["Assigned"].ToString();
                            lblFollowUp.Text = reader["FollowUps"].ToString();
                            lblconverted.Text = reader["Converted"].ToString();
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

        protected string GetStatusClass(object statusValue)
        {
            string status = Convert.ToString(statusValue);
            switch (status.Trim().ToLower())
            {
                case "assigned":
                    return "assigned";

                case "follow up":
                    return "followup";
                
                case "converted":
                    return "converted";

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
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT L.ID,L.Name,L.Phone,L.Email,L.Status,LF.FollowUpDate,LF.Feedback AS LastFeedback FROM Leads L INNER JOIN LeadAssignment LA ON LA.LeadID = L.ID INNER JOIN LeadFeedback LF ON LF.LeadID = L.ID AND LF.AssignedTo = @UserID WHERE LA.AssignedTo = @UserID AND LA.IsActive = 1 AND LF.Status = 'Follow Up' AND LF.FollowUpDate IS NOT NULL ORDER BY LF.FollowUpDate ASC,L.ID DESC";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@UserID",SqlDbType.Int).Value = userID;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
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
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT L.ID,L.Name,L.Phone,L.Email,L.Status,LF.FeedbackOn,LF.FollowUpDate,LF.Feedback AS LastFeedback FROM Leads L INNER JOIN LeadAssignment LA ON LA.LeadID = L.ID OUTER APPLY (SELECT TOP 1 F.FeedbackOn,LF.FollowUpDate,LF.Feedback FROM LeadFeedback LF WHERE LF.LeadID = L.ID AND LF.AssignedTo = @UserID ORDER BY LF.FeedbackOn DESC,LF.ID DESC) LF WHERE LA.AssignedTo = @UserID AND LA.IsActive = 1 AND L.Status = 'Converted' ORDER BY LF.FeedbackOn DESC,L.ID DESC";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@UserID",SqlDbType.Int).Value = userID;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
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
                    ? "Today"
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
            btnTodayFollowup.CssClass= "lead-filter";
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

                case "TodayFollowup":

                    btnTodayFollowup.CssClass =
                        "lead-filter active";

                    lblLeadGridTitle.Text =
                        "Today's Follow Ups";

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

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT COUNT(*) AS Total,SUM(CASE WHEN L.Status IN('Interested','Not Interested','Working','Follow Up','Converted')THEN 1 ELSE 0 END) AS Completed, SUM(CASE WHEN L.Status = 'Assigned' THEN 1 ELSE 0 END) AS Pending, SUM(CASE WHEN L.Status = 'Interested' THEN 1 ELSE 0 END) AS Interested, SUM(CASE WHEN L.Status = 'Not Interested' THEN 1 ELSE 0 END) AS NotInterested, SUM(CASE WHEN L.Status = 'Working' THEN 1 ELSE 0 END) AS Working, SUM(CASE WHEN L.Status = 'Follow Up' THEN 1 ELSE 0 END) AS FollowUp,SUM(CASE WHEN L.Status = 'Converted' THEN 1 ELSE 0 END) AS Converted FROM LeadAssignment LA INNER JOIN Leads L ON LA.LeadID = L.ID WHERE LA.AssignedTo = @UserID AND LA.IsActive = 1 AND CAST(LA.AssignedOn AS DATE)= CAST(GETDATE() AS DATE)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@UserID",SqlDbType.Int).Value = userID;
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            report.Total = reader["Total"] == DBNull.Value ? 0 : Convert.ToInt32(reader["Total"]);
                            report.Completed =reader["Completed"] == DBNull.Value ? 0 : Convert.ToInt32(reader["Completed"]);
                            report.Pending =reader["Pending"] == DBNull.Value ? 0 : Convert.ToInt32(reader["Pending"]);
                            report.Interested =reader["Interested"] == DBNull.Value ? 0: Convert.ToInt32(reader["Interested"]);
                            report.NotInterested =reader["NotInterested"] == DBNull.Value ? 0: Convert.ToInt32(reader["NotInterested"]);
                            report.Working =reader["Working"] == DBNull.Value ? 0 : Convert.ToInt32(reader["Working"]);
                            report.FollowUp =reader["FollowUp"] == DBNull.Value ? 0 : Convert.ToInt32(reader["FollowUp"]);
                            report.Converted =reader["Converted"] == DBNull.Value ? 0 : Convert.ToInt32(reader["Converted"]);
                        }
                    }
                }
            }

            return report;
        }

        private DataTable GetTodayAllUsersReport()
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT M.Name AS CallerName,COUNT(*) AS Total,SUM(CASE WHEN L.Status = 'Interested' THEN 1 ELSE 0 END) AS Interested,SUM(CASE WHEN L.Status = 'Not Interested' THEN 1 ELSE 0 END) AS NotInterested,SUM(CASE WHEN L.Status = 'Working' THEN 1 ELSE 0 END) AS Working,SUM(CASE WHEN L.Status = 'Follow Up' THEN 1 ELSE 0 END) AS FollowUp,SUM(CASE WHEN L.Status = 'Converted' THEN 1 ELSE 0 END) AS Converted,SUM(CASE WHEN L.Status = 'Assigned' THEN 1 ELSE 0 END) AS Pending FROM LeadAssignment LA INNER JOIN Leads L ON LA.LeadID = L.ID INNER JOIN Members M ON LA.AssignedTo = M.ID WHERE LA.IsActive = 1 AND CAST(LA.AssignedOn AS DATE)= CAST(GETDATE() AS DATE) GROUP BY M.ID,M.Name ORDER BY M.Name;";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            return dt;
        }

        //private string GetCurrentUserEmail(int userID)
        //{
        //    using (SqlConnection con =
        //        new SqlConnection(connectionString))
        //    {
        //        string query = @"
        //    SELECT Email
        //    FROM Members
        //    WHERE ID = @UserID
        //      AND IsActive = 1
        //";

        //        using (SqlCommand cmd =
        //            new SqlCommand(query, con))
        //        {
        //            cmd.Parameters.Add(
        //                "@UserID",
        //                SqlDbType.Int
        //            ).Value = userID;

        //            con.Open();

        //            object result =
        //                cmd.ExecuteScalar();

        //            if (result == null ||
        //                result == DBNull.Value)
        //            {
        //                return "";
        //            }

        //            return result.ToString();
        //        }
        //    }
        //}

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
                DataTable reportTable = GetTodayAllUsersReport();

                StringBuilder emailBody = new StringBuilder();

                emailBody.Append(@"<html> <body style='font-family:Arial;font-size:14px;'> <h2>Today's Lead Management Report</h2> <p> <b>Date:</b> " + DateTime.Today.ToString("dd-MMM-yyyy") + @"</p> <table border='1' cellpadding='8' cellspacing='0' style='width:90%; border-collapse:collapse; font-family:Arial; font-size:14px;'> <tr> <th>Caller</th> <th>Total</th> <th>Interested</th> <th>Not Interested</th> <th>Working</th> <th>Follow Up</th> <th>Converted</th> <th>Pending</th> </tr>");
                foreach (DataRow row in reportTable.Rows)
                {
                    emailBody.Append("<tr>");
                    emailBody.Append("<td>");
                    emailBody.Append(HttpUtility.HtmlEncode(Convert.ToString(row["CallerName"])));
                    emailBody.Append("</td>");
                    emailBody.Append("<td>");
                    emailBody.Append(row["Total"]);
                    emailBody.Append("</td>");
                    emailBody.Append("<td>");
                    emailBody.Append(row["Interested"]);
                    emailBody.Append("</td>");
                    emailBody.Append("<td>");
                    emailBody.Append(row["NotInterested"]);
                    emailBody.Append("</td>");
                    emailBody.Append("<td>");
                    emailBody.Append(row["Working"]);
                    emailBody.Append("</td>");
                    emailBody.Append("<td>");
                    emailBody.Append(row["FollowUp"]);
                    emailBody.Append("</td>");
                    emailBody.Append("<td>");
                    emailBody.Append(row["Converted"]);
                    emailBody.Append("</td>");
                    emailBody.Append("<td>");
                    emailBody.Append(row["Pending"]);
                    emailBody.Append("</td>");
                    emailBody.Append("</tr>");
                }
                emailBody.Append(@"</table> <br /> <p> Regards,<br /> Success24 Lead Management </p> </body> </html> ");
                bool emailSent = Utility._SendEmail("Shrikantkumar.info@gmail.com","","Today's Complete Lead Report",emailBody.ToString());

                if (emailSent)
                {
                    ScriptManager.RegisterStartupScript(this,this.GetType(),"EmailSuccess","alert('Today\\'s lead report has been sent successfully.');",true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this,this.GetType(),"EmailError","alert('Unable to send email.');",true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this,this.GetType(),"EmailError","alert('Unable to send email: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');",true);
            }
        }
    }
}