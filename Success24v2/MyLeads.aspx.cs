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
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Login user ka name show karo
                lblUserName.Text = Convert.ToString(Session["UserName"]);

                LoadMyLeads();
                LoadStatistics();
            }
        }
        // =====================================
        // Temporary User ID
        // =====================================

        private int GetCurrentUserID()
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
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
                string query = @"

                    SELECT

                        L.ID,
                        L.Name,
                        L.Email,
                        L.Phone,
                        L.Qualification,
                        L.Stream,
                        L.PassingYear,
                        L.Status,

                        LA.AssignedOn,

                        M.Name AS AssignedTo

                    FROM LeadAssignment LA

                    INNER JOIN Leads L
                        ON LA.LeadID = L.ID

                    INNER JOIN Members M
                        ON LA.AssignedTo = M.ID

                    WHERE
                        LA.AssignedTo = @UserID

                    AND
                        LA.IsActive = 1

                    ORDER BY
                        LA.AssignedOn DESC,
                        L.ID DESC";


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
                string query = @"

                    SELECT

                        COUNT(*) AS TotalLeads,

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
                        ) AS FollowUps

                    FROM LeadAssignment LA

                    INNER JOIN Leads L
                        ON LA.LeadID = L.ID

                    WHERE
                        LA.AssignedTo = @UserID

                    AND
                        LA.IsActive = 1";


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
            gvMyLeads.PageIndex =
               e.NewPageIndex;

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

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }
    }
}