using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        private readonly string conStr = ConfigurationManager.ConnectionStrings["S24"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadCourseDropdown();
                LoadBatchDropdown();
                LoadStats();
                LoadGrid();
            }
        }

        private void LoadCourseDropdown()
        {
            ddlCourse.Items.Clear();
            ddlCourse.Items.Add(new ListItem("All Courses", ""));

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"
                    SELECT DISTINCT LTRIM(RTRIM(ISNULL(Course, ''))) AS Course
                    FROM StudentRegistration
                    WHERE ISNULL(LTRIM(RTRIM(Course)), '') <> ''
                    ORDER BY Course";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            string course = Convert.ToString(dr["Course"]);
                            ddlCourse.Items.Add(new ListItem(course, course));
                        }
                    }
                }
            }
        }

        private void LoadBatchDropdown()
        {
            ddlBatch.Items.Clear();
            ddlBatch.Items.Add(new ListItem("All Batches", ""));

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"
                    SELECT DISTINCT LTRIM(RTRIM(ISNULL(BatchNo, ''))) AS BatchNo
                    FROM StudentRegistration
                    WHERE ISNULL(LTRIM(RTRIM(BatchNo)), '') <> ''
                    ORDER BY BatchNo";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            string batch = Convert.ToString(dr["BatchNo"]);
                            ddlBatch.Items.Add(new ListItem(batch, batch));
                        }
                    }
                }
            }
        }

        private void LoadStats()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                litTotal.Text = ExecuteScalarCount(con, "SELECT COUNT(*) FROM StudentRegistration");
                litActive.Text = ExecuteScalarCount(con, "SELECT COUNT(*) FROM StudentRegistration WHERE ISNULL(Active,0)=1");
                litInactive.Text = ExecuteScalarCount(con, "SELECT COUNT(*) FROM StudentRegistration WHERE ISNULL(Active,0)=0");
                litJoinedThisMonth.Text = ExecuteScalarCount(con, @"
                    SELECT COUNT(*) FROM StudentRegistration
                    WHERE YEAR(ISNULL(CreatedOn,GETDATE())) = YEAR(GETDATE())
                      AND MONTH(ISNULL(CreatedOn,GETDATE())) = MONTH(GETDATE())");
                litCoursesRunning.Text = ExecuteScalarCount(con, @"
                    SELECT COUNT(DISTINCT Course) FROM StudentRegistration
                    WHERE ISNULL(LTRIM(RTRIM(Course)),'') <> ''");
            }
        }

        private string ExecuteScalarCount(SqlConnection con, string query)
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                object result = cmd.ExecuteScalar();
                return result == null || result == DBNull.Value ? "0" : Convert.ToString(result);
            }
        }

        private DataTable GetStudentsData()
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"
                    SELECT 
                        ID,
                        ISNULL(FirstName,'') AS FirstName,
                        ISNULL(LastName,'') AS LastName,
                        LTRIM(RTRIM(ISNULL(FirstName,'') + ' ' + ISNULL(LastName,''))) AS StudentName,
                        ISNULL(Email1,'') AS Email1,
                        ISNULL(Course,'') AS Course,
                        ISNULL(BatchNo,'') AS BatchNo,
                        ISNULL(PrimaryMobile,'') AS PrimaryMobile,
                        ISNULL(FatherName,'') AS FatherName,
                        ISNULL(AadharNo,'') AS AadharNo,
                        CONVERT(VARCHAR(11), ISNULL(CreatedOn, GETDATE()), 106) AS RegisteredOn,
                        ISNULL(VerificationStatus,'Draft') AS VerificationStatus,
                        ISNULL(PhotoPath,'') AS PhotoPath,
                        ISNULL(Active,0) AS Active
                    FROM StudentRegistration
                    WHERE 1=1";

                if (!string.IsNullOrWhiteSpace(txtSearch.Text))
                    query += " AND (ISNULL(FirstName,'') + ' ' + ISNULL(LastName,'')) LIKE @Search";

                if (!string.IsNullOrWhiteSpace(ddlCourse.SelectedValue))
                    query += " AND ISNULL(Course,'') = @Course";

                if (!string.IsNullOrWhiteSpace(ddlBatch.SelectedValue))
                    query += " AND ISNULL(BatchNo,'') = @BatchNo";

                if (!string.IsNullOrWhiteSpace(ddlStatus.SelectedValue))
                    query += " AND ISNULL(VerificationStatus,'Draft') = @Status";

                query += " ORDER BY ID DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrWhiteSpace(txtSearch.Text))
                        cmd.Parameters.AddWithValue("@Search", "%" + txtSearch.Text.Trim() + "%");
                    if (!string.IsNullOrWhiteSpace(ddlCourse.SelectedValue))
                        cmd.Parameters.AddWithValue("@Course", ddlCourse.SelectedValue.Trim());
                    if (!string.IsNullOrWhiteSpace(ddlBatch.SelectedValue))
                        cmd.Parameters.AddWithValue("@BatchNo", ddlBatch.SelectedValue.Trim());
                    if (!string.IsNullOrWhiteSpace(ddlStatus.SelectedValue))
                        cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue.Trim());

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            return dt;
        }

        private void LoadGrid()
        {
            DataTable dt = GetStudentsData();
            gvStudents.DataSource = dt;
            gvStudents.DataBind();
            litRecordCount.Text = dt.Rows.Count.ToString();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadGrid();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = string.Empty;
            ddlCourse.SelectedIndex = 0;
            ddlBatch.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;

            LoadStats();
            LoadGrid();
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            DataTable dt = GetStudentsData();

            if (dt.Rows.Count == 0)
            {
                LoadGrid();
                return;
            }

            if (dt.Columns.Contains("PhotoPath")) dt.Columns.Remove("PhotoPath");
            if (dt.Columns.Contains("FirstName")) dt.Columns.Remove("FirstName");
            if (dt.Columns.Contains("LastName")) dt.Columns.Remove("LastName");

            string fileName = "Student_Details_" + DateTime.Now.ToString("yyyyMMdd_HHmmss") + ".xls";

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    GridView exportGrid = new GridView();
                    exportGrid.DataSource = dt;
                    exportGrid.AutoGenerateColumns = true;
                    exportGrid.DataBind();
                    exportGrid.RenderControl(hw);

                    Response.Output.Write(sw.ToString());
                    Response.Flush();
                    Response.End();
                }
            }
        }

        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int studentId;
            if (!int.TryParse(Convert.ToString(e.CommandArgument), out studentId))
                return;

            if (e.CommandName == "EditStudent")
            {
                Response.Redirect("AdminEdit.aspx?ID=" + studentId);
                return;
            }

            if (e.CommandName == "QuickVerify")
            {
                UpdateStudentStatus(studentId, "Verified", 1, null);
                LoadStats();
                LoadGrid();
                return;
            }

            if (e.CommandName == "QuickReject")
            {
                UpdateStudentStatus(studentId, "Rejected", 0, "Rejected by admin from dashboard.");
                LoadStats();
                LoadGrid();
            }
        }

        private void UpdateStudentStatus(int studentId, string status, int active, string rejectionReason)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"
                    UPDATE StudentRegistration
                    SET VerificationStatus = @VerificationStatus,
                        Active = @Active,
                        RejectionReason = @RejectionReason,
                        VerifiedBy = @VerifiedBy,
                        VerifiedOn = GETDATE(),
                        LastUpdatedOn = GETDATE()
                    WHERE ID = @ID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@VerificationStatus", status);
                    cmd.Parameters.AddWithValue("@Active", active);
                    cmd.Parameters.AddWithValue("@RejectionReason", (object)rejectionReason ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@VerifiedBy", Convert.ToString(Session["AdminName"]));
                    cmd.Parameters.AddWithValue("@ID", studentId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public string GetStatusHtml(string status)
        {
            string safeStatus = Convert.ToString(status).Trim();

            if (safeStatus.Equals("Verified", StringComparison.OrdinalIgnoreCase))
                return "<span class='status-badge status-verified'>● Verified</span>";

            if (safeStatus.Equals("Rejected", StringComparison.OrdinalIgnoreCase))
                return "<span class='status-badge status-rejected'>● Rejected</span>";

            if (safeStatus.Equals("Pending", StringComparison.OrdinalIgnoreCase))
                return "<span class='status-badge status-pending'>● Pending</span>";

            return "<span class='status-badge status-draft'>● Draft</span>";
        }

        public string GetPhotoUrl(object photoPathObj)
        {
            string photoPath = Convert.ToString(photoPathObj);

            if (string.IsNullOrWhiteSpace(photoPath))
                return ResolveUrl("~/img/default-user.png");

            return ResolveUrl(photoPath);
        }

        public string GetInitials(object firstNameObj, object lastNameObj)
        {
            string firstName = Convert.ToString(firstNameObj).Trim();
            string lastName = Convert.ToString(lastNameObj).Trim();

            string first = string.IsNullOrWhiteSpace(firstName) ? "" : firstName.Substring(0, 1).ToUpper();
            string last = string.IsNullOrWhiteSpace(lastName) ? "" : lastName.Substring(0, 1).ToUpper();

            string initials = (first + last).Trim();
            return string.IsNullOrWhiteSpace(initials) ? "S" : initials;
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
        }
    }
}