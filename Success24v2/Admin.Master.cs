using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    lblNavUserName.Text =
                        Convert.ToString(
                            Session["UserName"]
                        );

                    lblDropdownName.Text =
                        Convert.ToString(
                            Session["UserName"]
                        );

                    lblDropdownRole.Text =
                        Convert.ToString(
                            Session["Role"]
                        );
                }
                else
                {
                    lblNavUserName.Text =
                        "Account";

                    lblDropdownName.Text =
                        "Not Logged In";

                    lblDropdownRole.Text = "";
                }


                ManageNavigation();
            }

        }
        //private void ManageNavigation()
        //{
        //    string role =
        //        Convert.ToString(
        //            Session["Role"]
        //        );


        //    // Admin
        //    if (role.Equals(
        //        "Admin",
        //        StringComparison.OrdinalIgnoreCase))
        //    {
        //        lnkLeadManagement.Visible = true;

        //        // Admin doesn't need caller page
        //        lnkMyLeads.Visible = false;
        //        lnkStudentDetails.Visible = true;
        //    }

        //    // Caller
        //    else if (role.Equals(
        //        "Caller",
        //        StringComparison.OrdinalIgnoreCase))
        //    {
        //        lnkLeadManagement.Visible = false;

        //        lnkMyLeads.Visible = true;
        //        lnkStudentDetails.Visible = true;
        //    }

        //    else
        //    {
        //        lnkLeadManagement.Visible = false;

        //        lnkMyLeads.Visible = false;
        //        lnkStudentDetails.Visible = false;
        //    }
        //}


        private void ManageNavigation()
        {
            string role = Convert.ToString(Session["Role"]);

            bool isAdmin = string.Equals(
                role, "Admin", StringComparison.OrdinalIgnoreCase);

            bool isCaller = string.Equals(
                role, "Caller", StringComparison.OrdinalIgnoreCase);

            lnkLeadManagement.Visible = isAdmin;
            lnkMyLeads.Visible = isCaller;

            // Admin and Caller both can open Student Details
            lnkStudentDetails.Visible = isAdmin || isCaller;

            // Keep these links restricted to Admin if required
            lnkAD.Visible = isAdmin;
            lnkAG.Visible = isAdmin;
            lnkGU.Visible = isAdmin;
        }



        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();

            Session.Abandon();

            Response.Redirect(
                "~/AdminLogin.aspx"
            );
        }
    }
}