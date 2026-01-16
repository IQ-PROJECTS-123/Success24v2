using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class AdminGallery : Page
    {
        // Connection string from Web.config
        private readonly string conStr = ConfigurationManager.ConnectionStrings["S24"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFullGallery();
            }
        }

        private void LoadFullGallery()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    // Selecting all images for management
                    string query = "SELECT Id, Title, FilePath, Status, UploadedDate FROM EventGallery ORDER BY UploadedDate DESC";

                    using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        rptGallery.DataSource = dt;
                        rptGallery.DataBind();

                        // Update statistics
                        if (litTotal != null) litTotal.Text = dt.Rows.Count.ToString();
                        if (pnlEmpty != null) pnlEmpty.Visible = (dt.Rows.Count == 0);
                    }
                }
            }
            catch (Exception ex)
            {
                // Basic error display for debugging database issues
                Response.Write("<script>alert('DB Error: " + ex.Message.Replace("'", "") + "');</script>");
            }
        }

        protected void rptGallery_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "DeleteImage")
            {
                DeletePhotoCompletely(id);
                LoadFullGallery();
            }
            else if (e.CommandName == "ApproveImage")
            {
                ApprovePhoto(id);
                LoadFullGallery();
            }
        }

        private void ApprovePhoto(int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    string query = "UPDATE EventGallery SET Status = 'Approved' WHERE Id = @Id";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Id", id);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error approving: " + ex.Message.Replace("'", "") + "');</script>");
            }
        }

        private void DeletePhotoCompletely(int id)
        {
            string relativePath = string.Empty;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                // 1. Get the path to delete the physical file
                using (SqlCommand cmdGet = new SqlCommand("SELECT FilePath FROM EventGallery WHERE Id = @Id", con))
                {
                    cmdGet.Parameters.AddWithValue("@Id", id);
                    object result = cmdGet.ExecuteScalar();
                    if (result != null) relativePath = result.ToString();
                }

                using (SqlCommand cmdDel = new SqlCommand("DELETE FROM EventGallery WHERE Id = @Id", con))
                {
                    cmdDel.Parameters.AddWithValue("@Id", id);
                    cmdDel.ExecuteNonQuery();
                }
            }

            // 3. Delete file from the server disk
            if (!string.IsNullOrEmpty(relativePath))
            {
                try
                {
                    string physicalPath = Server.MapPath("~/" + relativePath);
                    if (File.Exists(physicalPath))
                    {
                        File.Delete(physicalPath);
                    }
                }
                catch (IOException)
                {
                    // File might be in use, skip for now
                }
            }
        }

        // IMPORTANT: This must be 'protected' or 'public', NOT 'private'
        protected string GetStatusClass(string status)
        {
            if (string.IsNullOrEmpty(status)) return "bg-gray-500 text-white px-2 py-1 rounded";

            switch (status.Trim())
            {
                case "Approved":
                    return "px-2 py-1 text-[10px] font-black uppercase rounded bg-green-500 text-white shadow-sm";
                case "Pending":
                    return "px-2 py-1 text-[10px] font-black uppercase rounded bg-yellow-400 text-black shadow-sm";
                case "Rejected":
                    return "px-2 py-1 text-[10px] font-black uppercase rounded bg-red-500 text-white shadow-sm";
                default:
                    return "px-2 py-1 text-[10px] font-black uppercase rounded bg-gray-500 text-white";
            }
        }
    }
}