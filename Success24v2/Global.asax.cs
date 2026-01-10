using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Success24v2
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            ServicePointManager.SecurityProtocol |= SecurityProtocolType.Tls;
            RegisterRoutes(RouteTable.Routes);
        }
        void RegisterRoutes(RouteCollection routes)
        {

            DataTable _DataTable = Utility._GetLocation(); //new Web.DBHelper._DatabaseUtility()._GetDataSet("SELECT * FROM city").Tables[0];
            foreach (DataRow _Row in _DataTable.Rows)
                if (!string.IsNullOrEmpty(Convert.ToString(_Row["displayname"])) && !Convert.ToString(_Row["displayname"]).Contains('(') && !Convert.ToString(_Row["displayname"]).Contains('/') && !Convert.ToString(_Row["displayname"]).Contains('\\') && !Convert.ToString(_Row["displayname"]).Contains('-'))
                {
                    try
                    {
                        routes.MapPageRoute(Utility._GetFormatedURL(Convert.ToString(_Row["displayname"])), Utility._GetFormatedURL(Convert.ToString(_Row["displayname"])) + "/{WidgetType}", "~/default.aspx");
                    }
                    catch (Exception ex)
                    {
                    }
                }
            routes.MapPageRoute("Distance-Learning", "Distance-Learning/{WidgetType}", "~/DistanceLearning.aspx");
            routes.MapPageRoute("registration", "registration/{WidgetType}", "~/registration.aspx");
            routes.MapPageRoute("sponsorship", "sponsorship/{Page}", "~/sponsorship.aspx");
            routes.MapPageRoute("placements", "placements/{Page}", "~/placements.aspx");
            routes.MapPageRoute("StudentCorner", "StudentCorner/{Page}", "~/StudentCorner.aspx");
            routes.MapPageRoute("certification", "certification/{WidgetType}", "~/certification.aspx");
            //routes.MapPageRoute("training", "training/{City}/{Tech}/{Page}", "~/training.aspx");
            //routes.MapPageRoute("tags", "tags/{ket}", "~/tags.aspx");
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}