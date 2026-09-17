using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
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
            // Title validation
            if (string.IsNullOrWhiteSpace(txtTitle.Text))
            {
                ShowMessage("Please enter a title.", "text-red-600");
                return;
            }

            // File validation
            if (!fuImage.HasFiles)
            {
                ShowMessage("Please select at least one image.", "text-red-600");
                return;
            }

            try
            {
                string title = txtTitle.Text.Trim();
                string description = txtDescription.Text.Trim();

                string folderPath = Server.MapPath("~/Uploads/Gallery/");

                // Create folder if it does not exist
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string[] allowedExtensions =
                {
                    ".jpg",
                    ".jpeg",
                    ".png",
                    ".gif",
                    ".webp"
                };

                int uploadedCount = 0;

                foreach (HttpPostedFile file in fuImage.PostedFiles)
                {
                    if (file == null || file.ContentLength == 0)
                        continue;

                    string originalFileName = Path.GetFileName(file.FileName);

                    string extension = Path
                        .GetExtension(originalFileName)
                        .ToLowerInvariant();

                    // Extension validation
                    bool isAllowed = false;

                    foreach (string ext in allowedExtensions)
                    {
                        if (extension == ext)
                        {
                            isAllowed = true;
                            break;
                        }
                    }

                    if (!isAllowed)
                    {
                        continue;
                    }

                    // Unique filename
                    string uniqueFileName =
                        Guid.NewGuid().ToString("N") + extension;

                    string savePath =
                        Path.Combine(folderPath, uniqueFileName);

                    // Save physical file
                    file.SaveAs(savePath);

                    // IMPORTANT:
                    // Store path WITHOUT "~/" in database
                    string dbRelativePath =
                        "Uploads/Gallery/" + uniqueFileName;

                    // Insert database record
                    using (SqlConnection con = new SqlConnection(conStr))
                    {
                        string query = @"
                    INSERT INTO EventGallery
                    (
                        Title,
                        Description,
                        FilePath,
                        Status,
                        UploadedDate
                    )
                    VALUES
                    (
                        @Title,
                        @Description,
                        @FilePath,
                        @Status,
                        @UploadedDate
                    )";

                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Title", title);

                            cmd.Parameters.AddWithValue(
                                "@Description",
                                string.IsNullOrWhiteSpace(description)
                                    ? (object)DBNull.Value
                                    : description
                            );

                            cmd.Parameters.AddWithValue(
                                "@FilePath",
                                dbRelativePath
                            );

                            cmd.Parameters.AddWithValue(
                                "@Status",
                                "Pending"
                            );

                            cmd.Parameters.AddWithValue(
                                "@UploadedDate",
                                DateTime.Now
                            );

                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    uploadedCount++;
                }

                if (uploadedCount == 0)
                {
                    ShowMessage(
                        "No valid image was uploaded.",
                        "text-red-600"
                    );

                    return;
                }

                ShowMessage(
                    uploadedCount + " image(s) uploaded successfully! Pending moderation.",
                    "text-green-600"
                );

                txtTitle.Text = "";
                txtDescription.Text = "";
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "Error: " + ex.Message,
                    "text-red-600"
                );
            }

        }

        private void ShowMessage(string msg, string cssClass)
        {
            lblMsg.Text = msg;
            lblMsg.CssClass = "text-sm font-medium " + cssClass;
        }
    }
}