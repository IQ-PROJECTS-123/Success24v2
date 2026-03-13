using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //DataTable dt = Utility._GetDataTable("Select count(Title) as Total, count( distinct(Batch)) as Batch from [orbexcoi_rpa].Placement");
                //_LiteralSuccess.Text = Convert.ToString(dt.Rows[0][0]);
                // _LiteralBatch.Text = Convert.ToString(dt.Rows[0][1]);
                // _LiteralPrac.Text = Convert.ToString(Utility._GetDataTable("select count(ID) as Active from [orbexcoi_rpa].student where Active=1").Rows[0][0]);
                if (!IsPostBack)
                {
                    if (!String.IsNullOrEmpty(Convert.ToString(this.Page.RouteData.Values["WidgetType"])) && !this.Request.Url.ToString().ToLower().Contains("/registration/"))
                    {
                        try
                        {
                            string _Val = this.Request.Url.ToString().Split('/')[3];
                            Session["City"] = Utility._GetCityNameCamlecase(_Val);
                        }
                        catch (Exception)
                        {
                        }
                    }
                    if (Session["City"] == null)
                        Session["City"] = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DefaultCity"]);
                    if (String.IsNullOrEmpty(Convert.ToString(this.Page.RouteData.Values["WidgetType"])) || Convert.ToString(this.Page.RouteData.Values["WidgetType"]).ToLower().Equals("asp-dot-net-mvc-training-institue-in-" + Convert.ToString(Session["City"]).ToLower()))
                    {

                        Utility._GetMainContentText("1", _LiteralContent, null, null);
                        // if (Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SityOnly"]).Equals("0"))
                        //     Utility._SetLocationsHome(_LiteralLocation, _LiteralLocation2, "ASP DOT NET MVC Training Institute", "ASP.NET MVC Training Institute");
                    }
                    else
                    {

                        String _Val = Utility._SetPageContents(_LiteralContent, null, null);
                        // if (Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SityOnly"]).Equals("0"))
                        //     DbUtility._SetLocationsHome(_LiteralLocation, _LiteralLocation2, _Val, _Val);
                    }
                    // _LiteralSiteLinks.Text = System.IO.File.ReadAllText(Server.MapPath(@"~/NavigationExternalSites.html"));

                }




            }
        }
    }
}