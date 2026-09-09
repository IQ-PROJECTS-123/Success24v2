using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Script.Services;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class LeadCall : System.Web.UI.Page
    {
        private readonly string connectionString =ConfigurationManager.ConnectionStrings["S24"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // ADD THIS
            if (Session["UserID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }
            if (!IsPostBack)
            {
                int leadID;

                if (!int.TryParse(
                    Request.QueryString["id"],
                    out leadID))
                {
                    Response.Redirect("MyLeads.aspx");
                    return;
                }

                if (!IsLeadAssignedToCurrentUser(leadID))
                {
                    Response.Redirect("MyLeads.aspx");
                    return;
                }

                LoadLeadDetails(leadID);

                LoadFeedbackHistory(leadID);
            }
        }

        private static DateTime GetIndiaNow()
        {
            TimeZoneInfo indiaTimeZone =
                TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");

            return TimeZoneInfo.ConvertTimeFromUtc(
                DateTime.UtcNow,
                indiaTimeZone
            );
        }

        // ==========================================
        // TEMPORARY Current User
        // ==========================================

        private int GetCurrentUserID()
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return 0;
            }

            return Convert.ToInt32(Session["UserID"]);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object GetDueFollowUp()
        {
            try
            {
                HttpContext context =
                    HttpContext.Current;

                if (context.Session["UserID"] == null)
                {
                    return new
                    {
                        success = false,
                        message = "Session expired."
                    };
                }

                int userID =
                    Convert.ToInt32(
                        context.Session["UserID"]
                    );

                string connectionString =
                    ConfigurationManager
                        .ConnectionStrings["S24"]
                        .ConnectionString;

                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                SELECT TOP 1

                    LF.ID AS FeedbackID,
                    L.ID AS LeadID,
                    L.Name,
                    L.Phone,
                    L.Email,
                    LF.Feedback,
                    LF.FollowUpDate

                FROM LeadFeedback LF

                INNER JOIN Leads L
                    ON L.ID = LF.LeadID

                INNER JOIN LeadAssignment LA
                    ON LA.LeadID = L.ID

                WHERE
                    LF.AssignedTo = @UserID
                    AND LA.AssignedTo = @UserID
                    AND LA.IsActive = 1

                    AND LF.Status = 'Follow Up'

                    AND LF.FollowUpDate IS NOT NULL

                    AND LF.FollowUpDate <= @CurrentIndiaTime

                    AND LF.ReminderShown = 0

                ORDER BY
                    LF.FollowUpDate ASC,
                    LF.ID ASC
            ";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@UserID",
                            SqlDbType.Int
                        ).Value = userID;
                        cmd.Parameters.Add("@CurrentIndiaTime", SqlDbType.DateTime).Value = GetIndiaNow();

                        con.Open();

                        using (SqlDataReader reader =
                            cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                return new
                                {
                                    success = true,

                                    feedbackID =
                                        Convert.ToInt32(
                                            reader["FeedbackID"]
                                        ),

                                    leadID =
                                        Convert.ToInt32(
                                            reader["LeadID"]
                                        ),

                                    name =
                                        Convert.ToString(
                                            reader["Name"]
                                        ),

                                    phone =
                                        Convert.ToString(
                                            reader["Phone"]
                                        ),

                                    email =
                                        Convert.ToString(
                                            reader["Email"]
                                        ),

                                    feedback =
                                        Convert.ToString(
                                            reader["Feedback"]
                                        ),

                                    followUpDate =
                                        Convert.ToDateTime(
                                            reader["FollowUpDate"]
                                        ).ToString(
                                            "dd-MMM-yyyy hh:mm tt"
                                        )
                                };
                            }
                        }
                    }
                }

                return new
                {
                    success = true,
                    data = (object)null
                };
            }
            catch (Exception ex)
            {
                return new
                {
                    success = false,
                    message = ex.Message
                };
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object MarkReminderShown(int feedbackID)
        {
            try
            {
                HttpContext context =
                    HttpContext.Current;

                if (context.Session["UserID"] == null)
                {
                    return new
                    {
                        success = false
                    };
                }

                int userID =
                    Convert.ToInt32(
                        context.Session["UserID"]
                    );

                string connectionString =
                    ConfigurationManager
                        .ConnectionStrings["S24"]
                        .ConnectionString;

                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                UPDATE LeadFeedback

                SET ReminderShown = 1

                WHERE
                    ID = @FeedbackID
                    AND AssignedTo = @UserID
            ";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@FeedbackID",
                            SqlDbType.Int
                        ).Value = feedbackID;

                        cmd.Parameters.Add(
                            "@UserID",
                            SqlDbType.Int
                        ).Value = userID;

                        con.Open();

                        cmd.ExecuteNonQuery();
                    }
                }

                return new
                {
                    success = true
                };
            }
            catch
            {
                return new
                {
                    success = false
                };
            }
        }

        // ==========================================
        // Security Check
        // ==========================================

        private bool IsLeadAssignedToCurrentUser(int leadID)
        {
            int userID = GetCurrentUserID();
            using (SqlConnection con =new SqlConnection(connectionString))
            {
                string query = @"SELECT COUNT(*)FROM LeadAssignment WHERE LeadID = @LeadID AND AssignedTo = @UserID AND IsActive = 1";
                using (SqlCommand cmd =new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@LeadID",SqlDbType.Int).Value = leadID;
                    cmd.Parameters.Add("@UserID",SqlDbType.Int).Value = userID;
                    con.Open();
                    int count =Convert.ToInt32(cmd.ExecuteScalar());
                    return count > 0;
                }
            }
        }
        // ==========================================
        // Load Lead
        // ==========================================

        private void LoadLeadDetails(int leadID)
        {
            int userID = GetCurrentUserID();
            using (SqlConnection con =new SqlConnection(connectionString))
            {
                string query = @"SELECT L.ID,L.Name,L.Email,L.Phone,L.Qualification,L.Stream,L.PassingYear,L.Status,M.Name AS AssignedTo FROM Leads L INNER JOIN LeadAssignment LA ON L.ID = LA.LeadID INNER JOIN Members M ON LA.AssignedTo = M.ID WHERE L.ID = @LeadID AND LA.AssignedTo = @UserID AND LA.IsActive = 1";
                using (SqlCommand cmd =new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@LeadID",SqlDbType.Int).Value = leadID;
                    cmd.Parameters.Add("@UserID",SqlDbType.Int).Value = userID;
                    con.Open();
                    using (SqlDataReader reader =cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblLeadID.Text =reader["ID"].ToString();
                            lblName.Text =reader["Name"].ToString();
                            lblEmail.Text =reader["Email"].ToString();
                            lblPhone.Text =reader["Phone"].ToString();
                            lblQualification.Text =reader["Qualification"].ToString();
                            lblStream.Text =reader["Stream"].ToString();
                            lblPassingYear.Text =reader["PassingYear"].ToString();
                            lblCurrentStatus.Text =reader["Status"].ToString();
                            lblAssignedTo.Text =reader["AssignedTo"].ToString();
                        }
                        else
                        {
                            Response.Redirect("MyLeads.aspx");
                        }
                    }
                }
            }
        }

        protected void btnSaveFeedback_Click(object sender, EventArgs e)
        {
            int leadID;

            if (!int.TryParse(Request.QueryString["id"],out leadID))
            {
                lblMessage.Text ="Invalid Lead ID.";
                lblMessage.CssClass ="message-error";
                return;
            }

            // Security check again
            if (!IsLeadAssignedToCurrentUser(leadID))
            {
                lblMessage.Text ="You are not allowed to update this lead.";
                lblMessage.CssClass ="message-error";
                return;
            }
            
            string status =ddlStatus.SelectedValue.Trim();
            string feedback =txtFeedback.Text.Trim();

            // =====================================
            // Validation
            // =====================================

            if (string.IsNullOrEmpty(status))
            {
                lblMessage.Text ="Please select call status.";
                lblMessage.CssClass ="message-error";
                return;
            }

            if (string.IsNullOrWhiteSpace(feedback))
            {
                lblMessage.Text ="Please enter feedback.";
                lblMessage.CssClass ="message-error";
                return;
            }

            // =====================================
            // Follow Up Date
            // =====================================

            DateTime? followUpDate = null;
            if (status == "Follow Up" ||status == "Call Back" ||status == "No Answer")
            {
                DateTime parsedDate;
                if (!DateTime.TryParse(txtFollowUpDate.Text,out parsedDate))
                {
                    lblMessage.Text ="Please select follow up date.";
                    lblMessage.CssClass ="message-error";
                    return;
                }

                if (parsedDate < DateTime.Now)
                {
                    lblMessage.Text ="Follow up date cannot be in the past.";
                    lblMessage.CssClass ="message-error";
                    return;
                }
                followUpDate =parsedDate;
            }

            int userID = GetCurrentUserID();
            // =====================================
            // Database Transaction
            // =====================================

            using (SqlConnection con =new SqlConnection(connectionString))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction();
                try
                {
                    // ==============================
                    // Insert Feedback
                    // ==============================
                    string insertQuery = @"INSERT INTO LeadFeedback(LeadID,AssignedTo,FeedbackOn,Feedback,Status,FollowUpDate,ReminderShown) VALUES (@LeadID,@ID,@FeedbackOn,@Feedback,@Status,@FollowUpDate,0)";
                    DateTime indiaNow = GetIndiaNow(); 
                    using (SqlCommand cmd =new SqlCommand(insertQuery,con,transaction))
                    {
                        cmd.Parameters.Add("@LeadID",SqlDbType.Int).Value = leadID;
                        cmd.Parameters.Add("@ID",SqlDbType.Int).Value = userID;
                        cmd.Parameters.Add("@FeedbackOn", SqlDbType.DateTime).Value = indiaNow;
                        cmd.Parameters.Add("@Feedback",SqlDbType.NVarChar,-1).Value = feedback;
                        cmd.Parameters.Add("@Status",SqlDbType.NVarChar,50).Value = status;
                        cmd.Parameters.Add("@FollowUpDate",SqlDbType.DateTime).Value =followUpDate.HasValue? (object)followUpDate.Value: DBNull.Value;
                        cmd.ExecuteNonQuery();
                    }

                    // ==============================
                    // Update Current Lead Status
                    // ==============================

                    string updateQuery = @"UPDATE Leads SET Status = @Status WHERE ID = @LeadID";
                    using (SqlCommand cmd =new SqlCommand(updateQuery,con,transaction))
                    {
                        cmd.Parameters.Add("@Status",SqlDbType.NVarChar,50).Value = status;
                        cmd.Parameters.Add("@LeadID",SqlDbType.Int).Value = leadID;
                        cmd.ExecuteNonQuery();
                    }
                    transaction.Commit();

                    lblMessage.Text = "Feedback saved successfully.";
                    lblMessage.CssClass = "message-success";

                    // Clear form
                    ddlStatus.SelectedIndex = 0;
                    txtFeedback.Text = "";
                    txtFollowUpDate.Text = "";

                    // Refresh current LeadCall page data
                    LoadLeadDetails(leadID);
                    LoadFeedbackHistory(leadID);

                    // Refresh MyLeads parent tab and close this tab
                    ClientScript.RegisterStartupScript(this.GetType(),"FeedbackSaved",@"alert('Feedback saved successfully.');
                    if (window.opener && !window.opener.closed)
                    {
                      window.opener.location.reload();
                    }
                    window.close();",true);
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    lblMessage.Text ="Error: " + ex.Message;
                    lblMessage.CssClass ="message-error";
                }
            }
        }

      
        // ==========================================
        // Feedback History
        // ==========================================

        private void LoadFeedbackHistory(int leadID)
        {
            int userID = GetCurrentUserID();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT LF.ID,LF.FeedbackOn,LF.Feedback,LF.Status,LF.FollowUpDate,M.Name AS CallerName FROM LeadFeedback LF INNER JOIN Members M ON LF.AssignedTo = M.ID WHERE LF.LeadID = @LeadID AND LF.AssignedTo = @UserID ORDER BY LF.FeedbackOn DESC";
                using (SqlCommand cmd =new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@LeadID",SqlDbType.Int).Value = leadID;
                    cmd.Parameters.Add("@UserID",SqlDbType.Int).Value = userID;
                    using (SqlDataAdapter da =new SqlDataAdapter(cmd))
                    {
                        DataTable dt =new DataTable();
                        da.Fill(dt);
                        rptHistory.DataSource =dt;
                        rptHistory.DataBind();
                        lblNoHistory.Visible =dt.Rows.Count == 0;
                    }
                }
            }
        }       
    }
}