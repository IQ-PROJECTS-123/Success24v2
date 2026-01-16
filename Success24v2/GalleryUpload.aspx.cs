using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace Success24v2
{
    public partial class GalleryUpload : Page
    {
        // Connection string from Web.config
        private readonly string conStr = ConfigurationManager.ConnectionStrings["S24"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            // 1. Validation
            if (string.IsNullOrEmpty(txtTitle.Text.Trim()))
            {
                ShowMessage("Please enter a title.", "text-red-600");
                return;
            }

            if (!fuImage.HasFile)
            {
                ShowMessage("Please select an image to upload.", "text-red-600");
                return;
            }

            try
            {
                // 2. Define File Path
                string fileName = Path.GetFileName(fuImage.FileName);
                string extension = Path.GetExtension(fileName).ToLower();

                // Optional: Validate extensions
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                bool isAllowed = false;
                foreach (string ext in allowedExtensions) { if (extension == ext) isAllowed = true; }

                if (!isAllowed)
                {
                    ShowMessage("Only JPG, JPEG, PNG, or GIF files are allowed.", "text-red-600");
                    return;
                }

                // Create a unique filename to prevent overwriting
                string uniqueFileName = Guid.NewGuid().ToString() + extension;
                string folderPath = Server.MapPath("~/Uploads/Gallery/");

                // Create directory if it doesn't exist
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string savePath = Path.Combine(folderPath, uniqueFileName);
                string dbRelativePath = "Uploads/Gallery/" + uniqueFileName;

                // 3. Save to Disk
                fuImage.SaveAs(savePath);

                // 4. Save to Database
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    string query = "INSERT INTO EventGallery (Title, FilePath, Status, UploadedDate) VALUES (@Title, @Path, @Status, @Date)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                        cmd.Parameters.AddWithValue("@Path", dbRelativePath);
                        cmd.Parameters.AddWithValue("@Status", "Pending"); 
                        cmd.Parameters.AddWithValue("@Date", DateTime.Now);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // 5. Success UI
                ShowMessage("Upload successful! Pending moderation.", "text-green-600");
                txtTitle.Text = ""; // Clear form
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "text-red-600");
            }
        }

        private void ShowMessage(string msg, string cssClass)
        {
            lblMsg.Text = msg;
            lblMsg.CssClass = "text-sm font-medium " + cssClass;
        }
    }
}