using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Success24v2
{
    public partial class EventPage : System.Web.UI.Page
    {
        
        private string connString = ConfigurationManager.ConnectionStrings["S24"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadApprovedGallery();
            }
        }

        private void LoadApprovedGallery()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                
                string query = "SELECT Title, FilePath FROM EventGallery WHERE Status = 'Approved' ORDER BY UploadedDate DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    try
                    {
                        conn.Open();
                        da.Fill(dt);

                        rptGallery.DataSource = dt;
                        rptGallery.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("");
                    }
                }
            }
        }
    }
}