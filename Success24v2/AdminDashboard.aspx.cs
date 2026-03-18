using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        private string AdminUser => Session["AdminUser"]?.ToString() ?? "Admin";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
                Response.Redirect("AdminLogin.aspx");

            if (!IsPostBack)
            {
                LoadBatchFilter();
                LoadStats();
                LoadGrid();
            }
        }

        // ── Batch Dropdown ────────────────────────────────────────
        private void LoadBatchFilter()
        {
            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    @"SELECT DISTINCT BatchNo FROM StudentRegistration
                      WHERE BatchNo IS NOT NULL AND BatchNo <> ''
                      ORDER BY BatchNo", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                    ddlBatchFilter.Items.Add(new ListItem(
                        "Batch " + dr["BatchNo"].ToString(),
                        dr["BatchNo"].ToString()));
            }
        }

        // ── Stats ─────────────────────────────────────────────────
        private void LoadStats()
        {
            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                con.Open();

                lblTotal.Text = new SqlCommand(
                    "SELECT COUNT(*) FROM StudentRegistration", con)
                    .ExecuteScalar().ToString();

                lblActive.Text = new SqlCommand(
                    "SELECT COUNT(*) FROM StudentRegistration WHERE Active=1", con)
                    .ExecuteScalar().ToString();

                lblInactive.Text = new SqlCommand(
                    "SELECT COUNT(*) FROM StudentRegistration WHERE Active=0", con)
                    .ExecuteScalar().ToString();

                lblThisMonth.Text = new SqlCommand(
                    @"SELECT COUNT(*) FROM StudentRegistration
                      WHERE MONTH(CreatedOn)=MONTH(GETDATE())
                      AND YEAR(CreatedOn)=YEAR(GETDATE())", con)
                    .ExecuteScalar().ToString();

                lblCourses.Text = new SqlCommand( "SELECT COUNT(DISTINCT Course) FROM StudentRegistration WHERE Active = 1", con).ExecuteScalar().ToString();
            }
        }

        // ── Grid ──────────────────────────────────────────────────
        private void LoadGrid()
        {
            string search = txtSearch.Text.Trim();
            string statusVal = ddlStatusFilter.SelectedValue;
            string batchVal = ddlBatchFilter.SelectedValue;

            string query = @"SELECT ID, FirstName, LastName, FatherName, Course,
                             BatchNo, PrimaryMobile, Email1, AadharNo,
                             PhotoPath, CreatedOn, Active
                             FROM StudentRegistration
                             WHERE
                             (@Search = '' OR
                              FirstName     LIKE '%'+@Search+'%' OR
                              LastName      LIKE '%'+@Search+'%' OR
                              Email1        LIKE '%'+@Search+'%' OR
                              PrimaryMobile LIKE '%'+@Search+'%' OR
                              Course        LIKE '%'+@Search+'%')
                             AND (@Status = 'All' OR CAST(Active AS VARCHAR) = @Status)
                             AND (@Batch  = '0'   OR CAST(BatchNo AS VARCHAR) = @Batch)
                             ORDER BY ID DESC";

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Search", search);
                cmd.Parameters.AddWithValue("@Status", statusVal);
                cmd.Parameters.AddWithValue("@Batch", batchVal);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvStudents.DataSource = dt;
                gvStudents.DataBind();

                // Update record count badge
                lblRecordCount.Text = dt.Rows.Count + " record" + (dt.Rows.Count == 1 ? "" : "s");
            }
        }

        // ── Search ────────────────────────────────────────────────
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvStudents.PageIndex = 0;
            LoadGrid();
        }

        // ── Clear ─────────────────────────────────────────────────
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlStatusFilter.SelectedIndex = 0;
            ddlBatchFilter.SelectedIndex = 0;
            gvStudents.PageIndex = 0;
            LoadGrid();
        }

        // ── Paging ────────────────────────────────────────────────
        protected void gvStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudents.PageIndex = e.NewPageIndex;
            LoadGrid();
        }

        // ── Toggle Active / Inactive ──────────────────────────────
        protected void lbToggle_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            string[] parts = lb.CommandArgument.Split(',');
            string id = parts[0];
            bool current = parts[1] == "True" || parts[1] == "1";
            bool newStatus = !current;

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE StudentRegistration SET Active=@Active WHERE ID=@ID", con);
                cmd.Parameters.AddWithValue("@Active", newStatus);
                cmd.Parameters.AddWithValue("@ID", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadStats();
            LoadGrid();
        }

        // ── Soft Delete (reason via modal) ────────────────────────
        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            string id = hfDeleteID.Value.Trim();
            string reason = hfDeleteReason.Value.Trim();

            // ✅ Guard against empty values
            if (string.IsNullOrEmpty(id) || string.IsNullOrEmpty(reason))
            {
                LoadStats();
                LoadGrid();
                return;
            }

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE StudentRegistration SET Active=0 WHERE ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // ✅ Clear after use
            hfDeleteID.Value = "";
            hfDeleteReason.Value = "";

            LoadStats();
            LoadGrid();
        }

        // ── Row Deleting (physical delete disabled) ───────────────
        protected void gvStudents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Physical delete intentionally disabled — soft delete used instead
        }

        // ── Export Excel ──────────────────────────────────────────
        protected void btnExcel_Click(object sender, EventArgs e)
        {
            string query = @"SELECT ID, FirstName, LastName, FatherName,
                             Course, BatchNo, PrimaryMobile, Email1,
                             Qualification, PassoutYear, AadharNo, PANNo,
                             WhatsappNo, ParentNo, Email2,
                             VoterID, PassportNo, ReferenceName,
                             CurrentAddress, PermanentAddress, CreatedOn,
                             CASE WHEN Active=1 THEN 'Active' ELSE 'Inactive' END AS Status
                             FROM StudentRegistration ORDER BY ID DESC";

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["S24"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition",
                    "attachment;filename=Students_" +
                    DateTime.Now.ToString("yyyyMMdd_HHmm") + ".xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";

                using (System.IO.StringWriter sw = new System.IO.StringWriter())
                {
                    sw.WriteLine("<table border='1'>");
                    sw.WriteLine("<tr style='background:#f97316;color:white;font-weight:bold;'>");
                    foreach (DataColumn col in dt.Columns)
                        sw.WriteLine($"<th>{col.ColumnName}</th>");
                    sw.WriteLine("</tr>");

                    foreach (DataRow row in dt.Rows)
                    {
                        sw.WriteLine("<tr>");
                        foreach (var item in row.ItemArray)
                            sw.WriteLine($"<td>{item}</td>");
                        sw.WriteLine("</tr>");
                    }
                    sw.WriteLine("</table>");

                    Response.Output.Write(sw.ToString());
                    Response.Flush();
                    Response.End();
                }
            }
        }

        // ── Logout ────────────────────────────────────────────────
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("AdminLogin.aspx");
        }
    }
}
