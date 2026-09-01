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
    public partial class AdminPanel1 : System.Web.UI.Page
    {
        private readonly string connectionString =ConfigurationManager.ConnectionStrings["S24"].ConnectionString;
        // =========================================
        // REPORT TYPE
        // =========================================

        private string ReportType
        {
            get
            {
                return ViewState["ReportType"] == null
                    ? "All"
                    : ViewState["ReportType"].ToString();
            }

            set
            {
                ViewState["ReportType"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            // ============================
            // LOGIN CHECK
            // ============================

            if (Session["UserID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }


            if (!IsPostBack)
            {
                // Load caller dropdown
                LoadCallers();


                // All callers
                if (ddlCaller.Items.Count > 0)
                {
                    ddlCaller.SelectedValue = "0";
                }


                // Default = ALL DATA
                ReportType = "All";


                ddlReportType.SelectedValue = "All";


                // Load dashboard
                LoadDashboardStatistics();


                // Load caller table
                LoadCallerSummary();

            }
        }

        // =========================================
        // LOAD CALLERS
        // =========================================

        private void LoadCallers()
        {
            ddlCaller.Items.Clear();


            ddlCaller.Items.Add(
                new ListItem(
                    "All Callers",
                    "0"
                )
            );


            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT
                        ID,
                        Name
                    FROM Members
                    WHERE Role = 'Caller'
                    ORDER BY Name;
                ";


                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    con.Open();


                    using (SqlDataReader reader =
                        cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ddlCaller.Items.Add(
                                new ListItem(
                                    Convert.ToString(
                                        reader["Name"]
                                    ),
                                    Convert.ToString(
                                        reader["ID"]
                                    )
                                )
                            );
                        }
                    }
                }
            }
        }
        // =========================================
        // LOAD DASHBOARD STATISTICS
        // =========================================

        private void LoadDashboardStatistics()
        {
            int callerID = 0;


            int.TryParse(
                ddlCaller.SelectedValue,
                out callerID
            );


            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT

                        COUNT(*) AS Total,

                        SUM(
                            CASE
                                WHEN L.Status = 'Assigned'
                                THEN 1
                                ELSE 0
                            END
                        ) AS Assigned,

                        SUM(
                            CASE
                                WHEN L.Status = 'Follow Up'
                                THEN 1
                                ELSE 0
                            END
                        ) AS FollowUp,

                        SUM(
                            CASE
                                WHEN L.Status = 'Working'
                                THEN 1
                                ELSE 0
                            END
                        ) AS Working,

                        SUM(
                            CASE
                                WHEN L.Status = 'Interested'
                                THEN 1
                                ELSE 0
                            END
                        ) AS Interested,

                        SUM(
                            CASE
                                WHEN L.Status = 'Not Interested'
                                THEN 1
                                ELSE 0
                            END
                        ) AS NotInterested,

                        SUM(
                            CASE
                                WHEN L.Status = 'Converted'
                                THEN 1
                                ELSE 0
                            END
                        ) AS Converted

                    FROM LeadAssignment LA

                    INNER JOIN Leads L
                        ON L.ID = LA.LeadID

                    WHERE

                        LA.IsActive = 1

                        AND
                        (
                            @CallerID = 0
                            OR LA.AssignedTo = @CallerID
                        )
                ";


                // =====================================
                // PARTICULAR DATE FILTER
                // =====================================

                if (ReportType == "Date" &&
                    !string.IsNullOrEmpty(txtReportDate.Text))
                {
                    query += @"

                        AND LA.AssignedOn >= @ReportDate
                        AND LA.AssignedOn < DATEADD(DAY, 1, @ReportDate)

                    ";
                    }


                query += ";";


                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                  "@CallerID",
                  SqlDbType.Int
              ).Value = callerID;


                    if (ReportType == "Date" &&
                        !string.IsNullOrEmpty(txtReportDate.Text))
                    {
                        DateTime reportDate;

                        if (DateTime.TryParse(
                            txtReportDate.Text,
                            out reportDate))
                        {
                            cmd.Parameters.Add(
                                "@ReportDate",
                                SqlDbType.Date
                            ).Value = reportDate.Date;
                        }
                    }


                    con.Open();


                    using (SqlDataReader reader =
                        cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblTotal.Text =
                                GetInt(
                                    reader,
                                    "Total"
                                ).ToString();


                            lblAssigned.Text =
                                GetInt(
                                    reader,
                                    "Assigned"
                                ).ToString();


                            lblFollowUp.Text =
                                GetInt(
                                    reader,
                                    "FollowUp"
                                ).ToString();


                            lblWorking.Text =
                                GetInt(
                                    reader,
                                    "Working"
                                ).ToString();


                            lblInterested.Text =
                                GetInt(
                                    reader,
                                    "Interested"
                                ).ToString();


                            lblNotInterested.Text =
                                GetInt(
                                    reader,
                                    "NotInterested"
                                ).ToString();


                            lblConverted.Text =
                                GetInt(
                                    reader,
                                    "Converted"
                                ).ToString();
                        }
                        else
                        {
                            ClearStatistics();
                        }
                    }
                }
            }


            // Student count
            LoadStudentCount();
        }

        // =========================================
        // CLEAR STATISTICS
        // =========================================

        private void ClearStatistics()
        {
            lblTotal.Text = "0";
            lblAssigned.Text = "0";
            lblFollowUp.Text = "0";
            lblWorking.Text = "0";
            lblInterested.Text = "0";
            lblNotInterested.Text = "0";
            lblConverted.Text = "0";
        }

        // =========================================
        // STUDENT COUNT
        // =========================================

        private void LoadStudentCount()
        {
            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT COUNT(*)
                    FROM StudentRegistration;
                ";


                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    con.Open();


                    object result =
                        cmd.ExecuteScalar();


                    lblStudents.Text =
                        result == null ||
                        result == DBNull.Value
                            ? "0"
                            : Convert.ToInt32(
                                result
                              ).ToString();
                }
            }
        }




        // =========================================
        // CALLER SUMMARY
        // =========================================

        private void LoadCallerSummary()
        {
            DataTable dt =
                new DataTable();


            int callerID = 0;


            int.TryParse(
                ddlCaller.SelectedValue,
                out callerID
            );


            using (SqlConnection con =
                new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT

                        M.Name AS CallerName,

                        COUNT(*) AS Total,

                        SUM(
                            CASE
                                WHEN L.Status = 'Assigned'
                                THEN 1
                                ELSE 0
                            END
                        ) AS Assigned,

                        SUM(
                            CASE
                                WHEN L.Status = 'Follow Up'
                                THEN 1
                                ELSE 0
                            END
                        ) AS FollowUp,

                        SUM(
                            CASE
                                WHEN L.Status = 'Working'
                                THEN 1
                                ELSE 0
                            END
                        ) AS Working,

                        SUM(
                            CASE
                                WHEN L.Status = 'Interested'
                                THEN 1
                                ELSE 0
                            END
                        ) AS Interested,

                        SUM(
                            CASE
                                WHEN L.Status = 'Not Interested'
                                THEN 1
                                ELSE 0
                            END
                        ) AS NotInterested,

                        SUM(
                            CASE
                                WHEN L.Status = 'Converted'
                                THEN 1
                                ELSE 0
                            END
                        ) AS Converted

                    FROM LeadAssignment LA

                    INNER JOIN Leads L
                        ON L.ID = LA.LeadID

                    INNER JOIN Members M
                        ON M.ID = LA.AssignedTo

                    WHERE

                        LA.IsActive = 1

                        AND
                        (
                            @CallerID = 0
                            OR LA.AssignedTo = @CallerID
                        )
                ";


                // =====================================
                // PARTICULAR DATE FILTER
                // =====================================

                if (ReportType == "Date" &&
                    !string.IsNullOrEmpty(txtReportDate.Text))
                {
                    query += @"

                    AND LA.AssignedOn >= @ReportDate
                    AND LA.AssignedOn < DATEADD(DAY, 1, @ReportDate)

                ";
                }


                query += @"

                    GROUP BY
                        M.ID,
                        M.Name

                    ORDER BY
                        M.Name;
                ";


                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                      "@CallerID",
                      SqlDbType.Int
                  ).Value = callerID;


                    if (ReportType == "Date" &&
                        !string.IsNullOrEmpty(txtReportDate.Text))
                    {
                        DateTime reportDate;

                        if (DateTime.TryParse(
                            txtReportDate.Text,
                            out reportDate))
                        {
                            cmd.Parameters.Add(
                                "@ReportDate",
                                SqlDbType.Date
                            ).Value = reportDate.Date;
                        }
                    }


                    using (SqlDataAdapter da =
                        new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }


            gvCallerSummary.DataSource = dt;

            gvCallerSummary.DataBind();
        }


        // =========================================
        // SAFE INT CONVERSION
        // =========================================

        private int GetInt(
            SqlDataReader reader,
            string columnName)
        {
            if (reader[columnName] == DBNull.Value)
                return 0;


            return Convert.ToInt32(
                reader[columnName]
            );
        }

        protected void ddlCaller_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Keep currently selected report
            ReportType =
                ddlReportType.SelectedValue;


            LoadDashboardStatistics();

            LoadCallerSummary();
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            // Get selected report type
            ReportType =
                ddlReportType.SelectedValue;


            LoadDashboardStatistics();

            LoadCallerSummary();
        }

       
    }
}