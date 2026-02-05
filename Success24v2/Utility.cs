using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Success24v2
{
    public class Utility
    {
        static public void _BindDropdown(System.Web.UI.WebControls.DropDownList ddl, String Query, String ValueField, String TestField)
        {
            DataTable _dt = Utility._GetDataTable(Query);
            ddl.DataSource = _dt;
            ddl.DataTextField = TestField;
            ddl.DataValueField = ValueField;
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("None", "0"));

        }
        static public void _BindDropdown(System.Web.UI.WebControls.DropDownList ddl, String Query, String ValueField, String TestField, String selectedValue)
        {
            DataTable _dt = Utility._GetDataTable(Query);
            ddl.DataSource = _dt;
            ddl.DataTextField = TestField;
            ddl.DataValueField = ValueField;
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("None", "0"));
            if (!String.IsNullOrEmpty(selectedValue))
                ddl.SelectedValue = selectedValue;

        }
        static public void _BindChechboxList(System.Web.UI.WebControls.CheckBoxList chklist, String Query, String ValueField, String TestField)
        {
            DataTable _dt = Utility._GetDataTable(Query);
            chklist.DataSource = _dt;
            chklist.DataTextField = TestField;
            chklist.DataValueField = ValueField;
            chklist.DataBind();


        }
        static public void _BindGridView(System.Web.UI.WebControls.GridView gv, String Query)
        {
            DataTable _dt = Utility._GetDataTable(Query);
            gv.DataSource = _dt;
            gv.DataBind();
        }
        static public void _SendEmail(string _To, string _Ccs, string _Subject, string _MSG)
        {
            try
            {
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();

                message.From = new MailAddress("info@iq-india.com", "Success24");
                message.To.Add(_To);
                message.Subject = _Subject;
                message.Body = _MSG;
                message.IsBodyHtml = true;

                smtp.Host = "email-smtp.ap-south-1.amazonaws.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Credentials = new NetworkCredential(
                    "AKIAVY75UURZKY6JOY5L",
                    "BCgGVIOe8wFp+mlL7bknwTcFkX0BnsQe+tsKoRZ+hZ9R"
                );

                smtp.Send(message);
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write("Email Error: " + ex.Message);
            }
        }
        static public System.Data.DataTable _GetDataTable(String _Query)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(_Query, System.Configuration.ConfigurationManager.ConnectionStrings["Capis"].ConnectionString);
            System.Data.DataTable dt = new System.Data.DataTable();
            adapter.Fill(dt);
            return dt;
        }
        static public System.Data.DataTable _GetDataTable24(String _Query)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(_Query, System.Configuration.ConfigurationManager.ConnectionStrings["S24"].ConnectionString);
            System.Data.DataTable dt = new System.Data.DataTable();
            adapter.Fill(dt);
            return dt;
        }
        static public void ExecuteQuery(String _Query)
        {
            SqlConnection Con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Capis"].ConnectionString);
            try
            {
                SqlCommand cmd = Con.CreateCommand();
                cmd.CommandText = _Query;
                Con.Open();
                cmd.ExecuteNonQuery();
            }
            catch { }
            finally { Con.Close(); }
        }
        static public void ExecuteQuery(String _Query, Boolean _Procedure, params SqlParameter[] _Parameters)
        {
            SqlConnection Con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Capis"].ConnectionString);

            try
            {
                SqlCommand cmd = Con.CreateCommand();
                cmd.CommandText = _Query;
                cmd.CommandType = _Procedure ? CommandType.StoredProcedure : CommandType.Text;
                foreach (SqlParameter _Parameter in _Parameters)
                    cmd.Parameters.Add(_Parameter);
                Con.Open();
                cmd.ExecuteNonQuery();

            }
            catch { }
            finally { Con.Close(); }
        }

        public static DataTable _GetLocation()
        {
            Page page = HttpContext.Current.Handler as Page;
            DataTable _DataTable = new DataTable();//IsActive=1 AND
            SqlDataAdapter _DataAdapter;
            // if (String.IsNullOrEmpty(Convert.ToString(page.RouteData.Values["State"])))
            _DataAdapter = new SqlDataAdapter("Select   ID, Title, displayname, isactive from City where isactive=1 AND CountryCode IN (" + System.Configuration.ConfigurationManager.AppSettings["Country"] + ")", System.Configuration.ConfigurationManager.ConnectionStrings["Locationlive"].ConnectionString);
            // _DataAdapter = new SqlDataAdapter("Select   ID, Title, displayname, isactive from City where CountryCode IN (" + System.Configuration.ConfigurationManager.AppSettings["Country"] + ")", System.Configuration.ConfigurationManager.ConnectionStrings["Locationlive"].ConnectionString);
            // else
            //    _DataAdapter = new SqlDataAdapter("Select   ID, Title, displayname, isactive from City where isactive=1 AND State='" + Convert.ToString(page.RouteData.Values["State"]) + "' AND CountryCode='" + System.Configuration.ConfigurationManager.AppSettings["Country"] + "'", System.Configuration.ConfigurationManager.ConnectionStrings["Locationlive"].ConnectionString);
            _DataAdapter.Fill(_DataTable);
            return _DataTable;
        }
        public static string _GetFormatedURL(String _Val)
        {
            return _Val.Replace(" ", "-");
        }
        public static String _GetMainContentText(String _PageId, System.Web.UI.WebControls.Literal _Literal, System.Web.UI.WebControls.Literal _LiteralHeader, System.Web.UI.WebControls.DataList _DataList)
        {
            Int16 _Counter = 0;
            System.Text.StringBuilder _ContentText = new System.Text.StringBuilder();

            //DataTable _DataTable = _GetO365Data(System.Configuration.ConfigurationManager.AppSettings["ListName"], "<Where><Eq><FieldRef Name='ID' /><Value Type='Text'>" + _PageId + "</Value></Eq></Where>", "ID", "Title", "PageTitle", "Description", "MetaKey", "PageHeader", "PageImage", "PageContent");//_GetData("SELECT ID, TITLE, PAGETITLE, DESCRIPTION, METAKEY, TAGS, PAGEHEADER, ISMORE, URL, ISSIDEBAR, SIDEBARTYPE, PAGEIMAGE, TEXT FROM Page WHERE (TITLE = '" + Val.Replace("-", " ") + "')");
            DataTable _DataTable = _GetDataTable24("select * from SiteContent where ID=" + _PageId);
            if (_DataTable != null && _DataTable.Rows.Count > 0)
            {
                Page page = HttpContext.Current.Handler as Page;
                page.Title = Convert.ToString(_DataTable.Rows[0]["PAGETITLE"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"]));
                if (Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SityOnly"]).Equals("0") && System.Configuration.ConfigurationManager.AppSettings["Cities"].Contains(Convert.ToString(HttpContext.Current.Session["City"]).ToLower()))
                    page.Title = Convert.ToString(HttpContext.Current.Session["City"]) + " | " + Convert.ToString(_DataTable.Rows[0]["PAGETITLE"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"]));
                //Add Keywords Meta Tag
                HtmlMeta keywords = new HtmlMeta();
                keywords.HttpEquiv = "keywords";
                keywords.Name = "keywords";
                keywords.Content = Convert.ToString(_DataTable.Rows[0]["metakey"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"]));
                page.Header.Controls.Add(keywords);

                //Add Description Meta Tag
                HtmlMeta description = new HtmlMeta();
                description.HttpEquiv = "description";
                description.Name = "description";
                description.Content = Convert.ToString(_DataTable.Rows[0]["Description"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"]));
                if (Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SityOnly"]).Equals("0") && System.Configuration.ConfigurationManager.AppSettings["Cities"].Contains(Convert.ToString(HttpContext.Current.Session["City"]).ToLower()))
                    description.Content = Convert.ToString(HttpContext.Current.Session["City"]) + " | " + Convert.ToString(_DataTable.Rows[0]["Description"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"]));
                page.Header.Controls.Add(description);
                if (_LiteralHeader != null)
                    _LiteralHeader.Text = Convert.ToString(_DataTable.Rows[0]["PageHeader"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"]));
                _Literal.Text = HttpUtility.HtmlDecode(Convert.ToString(_DataTable.Rows[0]["PageContent"]).Replace("%23", "#").Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"])).Replace("_#SiteURL#_", Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["HostURL"])));
            }

            // _DataTable = _GetO365Data("SharepointTrainingContents", "<Where><Eq><FieldRef Name='ParentPage' LookupId='TRUE' /><Value Type='Text'>" + _PageId + "</Value> </Eq> </Where> <OrderBy>  <FieldRef Name='OrderBy'/></OrderBy>", "ID", "Title", "PageTitle", "Description", "MetaKey", "PageHeader", "PageImage", "summery");//_GetData("select  PAGEID,ID,TITLE,TitleType,LINK,POSITION,ISACTIVE ,Imagepath,DESCRIPTION from pagecontent where ISACTIVE=1 and PAGEID=" + _PageId + "  Order By Position");

            // _DataList.DataSource = _DataTable;
            //  _DataList.DataBind();

            //foreach (DataRow _Row in _DataTable.Rows)
            //{
            //    if (_Counter % 3 == 0 || _Counter == 0)
            //        _ContentText.Append("<div class='row'>");
            //    _Counter++;
            //    _ContentText.Append("<div class='col-md-4 content-sec '><h3>");
            //    _ContentText.Append(Convert.ToString(_Row["TITLE"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"])));
            //    if (!String.IsNullOrEmpty(Convert.ToString(_Row["Imagepath"])))
            //    {
            //        _ContentText.Append("</h3> <img src='");
            //        _ContentText.Append(Convert.ToString(_Row["Imagepath"]));
            //        _ContentText.Append("' alt='' />");
            //    }
            //    //_ContentText.Append(HttpContext.Current.Server.HtmlDecode(Convert.ToString(_Row["Description"])).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"])));
            //    _ContentText.Append("<p class='hightcon'>");
            //    _ContentText.Append(Convert.ToString(_Row["Description"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"])));
            //    _ContentText.Append("</p>");
            //    if (!String.IsNullOrEmpty(Convert.ToString(_Row["PageLink"])))
            //    {
            //        _ContentText.Append("<div class='tool-tip'><a class='tooltips-more' href='");
            //        _ContentText.Append(System.Configuration.ConfigurationManager.AppSettings["HostURL"] + "/Service/" + Convert.ToString(_Row["PageLink"]).Replace(" ", "-").Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"])));
            //        _ContentText.Append("'><span>MORE</span></a></div></div> ");
            //    }
            //    if (_Counter % 3 == 0)
            //        _ContentText.Append("</div><div class='clearfix'></div>");
            //}
            return _ContentText.ToString();
        }


        public static string _SetPageContents(System.Web.UI.WebControls.Literal _PageContent, System.Web.UI.WebControls.Literal _PageHeader, System.Web.UI.WebControls.DataList _DataList)
        {
            String _LinkTitle = "SharePoint Training Institute";
            try
            {
                Page page = HttpContext.Current.Handler as Page;
                if (!String.IsNullOrEmpty(Convert.ToString(page.RouteData.Values["WidgetType"])))
                {
                    String[] _Spliter = { "-in-" };
                    String Val = Convert.ToString(page.RouteData.Values["WidgetType"]).ToLower().Replace(Convert.ToString(HttpContext.Current.Session["City"]).ToLower(), "_#City#_");//.Split(_Spliter, StringSplitOptions.None)[0] + "-In-_#City#_";
                    _LinkTitle = Convert.ToString(page.RouteData.Values["WidgetType"]).ToLower().Split(_Spliter, StringSplitOptions.None)[0];
                    //DataTable _DataTable = _GetO365Data(System.Configuration.ConfigurationManager.AppSettings["ListName"], "<Where><Eq><FieldRef Name='Title' /><Value Type='Text'>" + Val.Replace("-", " ") + "</Value></Eq></Where>", "ID", "Title", "PageTitle", "Description", "MetaKey", "PageHeader", "PageImage", "PageContent", "LinkTitle0");//_GetData("SELECT ID, TITLE, PAGETITLE, DESCRIPTION, METAKEY, TAGS, PAGEHEADER, ISMORE, URL, ISSIDEBAR, SIDEBARTYPE, PAGEIMAGE, TEXT FROM Page WHERE (TITLE = '" + Val.Replace("-", " ") + "')");
                    DataTable _DataTable = _GetDataTable24(String.Format("Select * from SiteContent where Title='{0}'", Val.Replace("-", " "))); //_GetO365Data(System.Configuration.ConfigurationManager.AppSettings["ListName"], "<Where><Eq><FieldRef Name='Title' /><Value Type='Text'>" + Val.Replace("-", " ") + "</Value></Eq></Where>", "ID", "Title", "PageTitle", "Description", "MetaKey", "PageHeader", "PageImage", "PageContent", "LinkTitle0");//_GetData("SELECT ID, TITLE, PAGETITLE, DESCRIPTION, METAKEY, TAGS, PAGEHEADER, ISMORE, URL, ISSIDEBAR, SIDEBARTYPE, PAGEIMAGE, TEXT FROM Page WHERE (TITLE = '" + Val.Replace("-", " ") + "')");

                    if (_DataTable != null && _DataTable.Rows.Count > 0)
                    {
                        string _PageId = Convert.ToString(_DataTable.Rows[0]["ID"]);
                        //Add Page Title
                        page.Title = Convert.ToString(_DataTable.Rows[0]["PageTitle"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"]));
                        //Add Keywords Meta Tag
                        HtmlMeta keywords = new HtmlMeta();
                        keywords.HttpEquiv = "keywords";
                        keywords.Name = "keywords";
                        keywords.Content = Convert.ToString(_DataTable.Rows[0]["MetaKey"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"]));
                        page.Header.Controls.Add(keywords);

                        //Add Description Meta Tag
                        HtmlMeta description = new HtmlMeta();
                        description.HttpEquiv = "description";
                        description.Name = "description";
                        description.Content = Convert.ToString(_DataTable.Rows[0]["Description"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"]));
                        page.Header.Controls.Add(description);
                        if (_PageHeader != null)
                            _PageHeader.Text = Convert.ToString(_DataTable.Rows[0]["PageHeader"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"]));
                        _PageContent.Text = HttpUtility.HtmlDecode(Convert.ToString(_DataTable.Rows[0]["PageContent"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"])));
                        if (!String.IsNullOrEmpty(Convert.ToString(_DataTable.Rows[0]["LinkTitle"])))
                            _LinkTitle = Convert.ToString(_DataTable.Rows[0]["LinkTitle"]);
                        Int16 _Counter = 0;
                        //System.Text.StringBuilder _ContentText = new System.Text.StringBuilder();
                        //if (!Convert.ToString(_DataTable.Rows[0]["SIDEBARType"]).Equals("None"))
                        //{
                        //    _DataTable = _GetO365Data("PageLink", "<Where><Eq><FieldRef Name='ParentPage' LookupId='TRUE' /><Value Type='LookupMulti'>" + _PageId + "</Value> </Eq> </Where> <OrderBy><FieldRef Name='DisplayOrder' Ascending='TRUE'/></OrderBy>", "Title", "PageUrl", "IsGroup", "Group", "ParentPage");// _GetData("SELECT id, pageid, title, url, isgroup, Grouping FROM pagelink WHERE (pageid = '" + _PageId + "')");
                        //    for (Int32 _Count = 0; _Count < _DataTable.Rows.Count; _Count++)
                        //    {
                        //        if (_Count == 0)
                        //        {
                        //            _ContentText.Append("<div class='col-md-4 solution-list'><h3>");
                        //            _ContentText.Append(Convert.ToString(_DataTable.Rows[0]["Group"]));
                        //            _ContentText.Append("</h3><ul>");
                        //        }
                        //        _ContentText.Append("<li><a href='");
                        //        _ContentText.Append(System.Configuration.ConfigurationManager.AppSettings["HostURL"] + "/" + _Basepage + "/" + Convert.ToString(_DataTable.Rows[_Count]["PageUrl"]).Replace("_#City#_", Convert.ToString(HttpContext.Current.Session["City"])).Replace(" ", "-"));
                        //        _ContentText.Append("'><span></span>");
                        //        _ContentText.Append(Convert.ToString(_DataTable.Rows[_Count]["title"]));
                        //        _ContentText.Append("</a></li>");
                        //        if (_Count == _DataTable.Rows.Count - 1)
                        //            _ContentText.Append("</ul><iframe width='210' height='160' src='https://www.youtube.com/embed/gFqduiHrBaE' frameborder='0' allowfullscreen></iframe></div>");
                        //    }
                        //}
                        //_SideBarLinks.Text = _ContentText.ToString();


                        //_ContentText = new System.Text.StringBuilder();
                        //_ContentText.Append("<div class='clearfix'></div>");
                        //_ContentText.Append("<div class='service-grids'>");

                        //_DataTable = _GetO365Data("PageContent", "<Where><Eq><FieldRef Name='ParentPage' LookupId='TRUE' /><Value Type='LookupMulti'>" + _PageId + "</Value> </Eq> </Where> ", "ParentPage", "ID", "Title", "TitleType", "PageLink", "Position", "Imagepath", "Active", "Description"); //_GetData("select PAGEID,ID,TITLE,TitleType,LINK,POSITION,ISACTIVE ,Imagepath,DESCRIPTION from pagecontent where ISACTIVE=1 and PAGEID=" + _PageId + "  Order By Position");
                        //foreach (DataRow _Row in _DataTable.Rows)
                        //{
                        //    _Counter++;
                        //    _ContentText.Append("<div class='col-md-4 content-sec '><h3>");
                        //    _ContentText.Append(Convert.ToString(_Row["Title"]));
                        //    if (!String.IsNullOrEmpty(Convert.ToString(_Row["Imagepath"])))
                        //    {
                        //        _ContentText.Append("</h3> <img src='");
                        //        _ContentText.Append(Convert.ToString(_Row["Imagepath"]));
                        //        _ContentText.Append("' alt='");
                        //        // _ContentText.Append(Convert.ToString(_Row["Imagepath"]));
                        //        _ContentText.Append("' />");
                        //    }
                        //    //_GetO365Data._ContentText.Append(HttpContext.Current.Server.HtmlDecode(Convert.ToString(_Row["Description"])));
                        //    _ContentText.Append(Convert.ToString(_Row["Description"]));
                        //    if (!String.IsNullOrEmpty(Convert.ToString(_Row["PageLink"])))
                        //    {
                        //        _ContentText.Append("<div class='tool-tip'><a class='tooltips-more' href='");
                        //        _ContentText.Append(System.Configuration.ConfigurationManager.AppSettings["HostURL"] + "/Service/" + Convert.ToString(_Row["PageLink"]).Replace(" ", "-"));
                        //        _ContentText.Append("'><span>MORE</span></a></div> ");
                        //    }
                        //    if (_Counter % 3 == 0)
                        //        _ContentText.Append("<div class='clearfix'></div>");
                        //    _ContentText.Append(" </div>");
                        //}
                        //_Services.Text = _ContentText.ToString();
                    }

                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            return _LinkTitle.ToUpper();
        }

        public static void _SetLocations(System.Web.UI.WebControls.Literal _LiteralColl1, System.Web.UI.WebControls.Literal _LiteralColl2, String _Page, String _PageName)
        {
            Page page = HttpContext.Current.Handler as Page;
            if (!String.IsNullOrEmpty(Convert.ToString(page.RouteData.Values["Key"])))
            {
                String[] _Spliter = { "-In-" };
                _PageName = Convert.ToString(page.RouteData.Values["Key"]).Split(_Spliter, StringSplitOptions.None)[0]; //+ "-In-_#City#_";
                DataTable _DataTable = _GetLocation();// DbUtility._GetData("Select ID, Title from Cities where IsActive=1 AND Country=" + System.Configuration.ConfigurationManager.AppSettings["Country"]);
                for (int _Counter = 0; _Counter < _DataTable.Rows.Count; _Counter++)
                {

                    _LiteralColl1.Text += "<li><a href='" + System.Configuration.ConfigurationManager.AppSettings["HostURL"] + "/" + _Page + "/" + _PageName.Replace(" ", "-") + "-In-" + _GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["displayname"])) + "' title='" + _PageName.Replace("-", " ") + " in " + Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"]) + "'>" + _PageName.Replace("-", " ") + " in " + Convert.ToString(_DataTable.Rows[_Counter]["displayname"]) + "</a></li>";
                    _Counter = _Counter + 1;
                    if (_Counter < _DataTable.Rows.Count)
                    {
                        _LiteralColl2.Text += "<li><a href='" + System.Configuration.ConfigurationManager.AppSettings["HostURL"] + "/" + _Page + "/" + _PageName.Replace(" ", "-") + "-In-" + _GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["displayname"])) + "' title='" + _PageName.Replace("-", " ") + " in " + Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"]) + "'>" + _PageName.Replace("-", " ") + " in " + Convert.ToString(_DataTable.Rows[_Counter]["displayname"]) + "</a></li>";
                        // _Counter = _Counter + 1;
                        //}
                        //if (_Counter < _DataTable.Rows.Count)
                        //    _LiteralColl3.Text += "<li><a href='" + System.Configuration.ConfigurationManager.AppSettings["HostURL"] + "/" + _Page + "/" + _PageName.Replace(" ", "-") + "-In-" + DbUtility._GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["displayname"])) + "'>" + _PageName.Replace("-", " ") + " in " + Convert.ToString(_DataTable.Rows[_Counter]["displayname"]) + "</a></li>";
                    }
                }
            }
        }
        public static void _SetLocationsHome(System.Web.UI.WebControls.Literal _LiteralColl1, System.Web.UI.WebControls.Literal _LiteralColl2, String _Page, String _PageName)
        {
            Page page = HttpContext.Current.Handler as Page;
            //if (!String.IsNullOrEmpty(Convert.ToString(page.RouteData.Values["Key"])))
            {
                // String[] _Spliter = { "-In-" };
                // _PageName = "SharePoint";
                Boolean _IsState = false;
                DataTable _DataTable;
                if (Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["State"]).Equals("1"))
                    if (String.IsNullOrEmpty(Convert.ToString(page.RouteData.Values["State"])))
                    {
                        _DataTable = new DataTable();// DbUtility._GetState();
                        _IsState = true;
                    }
                    else
                    {
                        _DataTable = _GetLocation();
                    }
                else
                    _DataTable = _GetLocation();
                for (int _Counter = 0; _Counter < _DataTable.Rows.Count; _Counter++)
                {

                    _LiteralColl1.Text += "<p><a href='" + System.Configuration.ConfigurationManager.AppSettings["HostURL"] + _GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"])) + "/" + _Page.Replace(" ", "-") + "-In-" + _GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"])) + "' title='" + _PageName.Replace("-", " ") + " in " + Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"]) + "'>" + _PageName.Replace("-", " ") + " in " + Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"]) + "</a></p>";
                    // _Counter = _Counter + 1;
                    //if (_Counter < _DataTable.Rows.Count)
                    // {
                    //    _LiteralColl2.Text += "<li><a href='" + System.Configuration.ConfigurationManager.AppSettings["HostURL"] + "/" + DbUtility._GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"])) + "/" + _PageName.Replace(" ", "-") + "-In-" + DbUtility._GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"])) + "' title='" + _PageName.Replace("-", " ") + " in " + Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"]) + "'>" + _PageName.Replace("-", " ") + " in " + Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"]) + "</a></li>";
                    // _Counter = _Counter + 1;
                    //}
                    // if (_Counter < _DataTable.Rows.Count)
                    //     _LiteralColl3.Text += "<li><a href='" + System.Configuration.ConfigurationManager.AppSettings["HostURL"] + "/" + _Page + (String.IsNullOrEmpty(Convert.ToString(page.RouteData.Values["State"])) ? "" : "/" + Convert.ToString(page.RouteData.Values["State"])) + (_IsState ? "/" + DbUtility._GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"])) : "") + "/" + _PageName.Replace(" ", "-") + "-In-" + DbUtility._GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"])) + "'>" + _PageName.Replace("-", " ") + " in " + Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"]) + "</a></li>";
                }
                //Convert.ToString(page.RouteData.Values["Key"]).Split(_Spliter, StringSplitOptions.None)[0]; //+ "-In-_#City#_";
                // DbUtility._GetData("Select ID, Title from Cities where IsActive=1 AND Country=" + System.Configuration.ConfigurationManager.AppSettings["Country"]);
                //for (int _Counter = 0; _Counter < _DataTable.Rows.Count; _Counter++)
                //{

                //    _LiteralColl1.Text += "<li><a href='" + System.Configuration.ConfigurationManager.AppSettings["HostURL"] + "/" + _Page + (String.IsNullOrEmpty(Convert.ToString(page.RouteData.Values["State"])) ? "" : "/" + Convert.ToString(page.RouteData.Values["State"])) + (_IsState ? "/" + DbUtility._GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"])) : "") + "/" + _PageName.Replace(" ", "-") + "-In-" + DbUtility._GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"])) + "'>" + _PageName.Replace("-", " ") + " in " + Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"]) + "</a></li>";
                //    _Counter = _Counter + 1;
                //    if (_Counter < _DataTable.Rows.Count)
                //    {
                //        _LiteralColl2.Text += "<li><a href='" + System.Configuration.ConfigurationManager.AppSettings["HostURL"] + "/" + _Page + (String.IsNullOrEmpty(Convert.ToString(page.RouteData.Values["State"])) ? "" : "/" + Convert.ToString(page.RouteData.Values["State"])) + (_IsState ? "/" + DbUtility._GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"])) : "") + "/" + _PageName.Replace(" ", "-") + "-In-" + DbUtility._GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"])) + "'>" + _PageName.Replace("-", " ") + " in " + Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"]) + "</a></li>";
                //       // _Counter = _Counter + 1;
                //    }
                //   // if (_Counter < _DataTable.Rows.Count)
                //   //     _LiteralColl3.Text += "<li><a href='" + System.Configuration.ConfigurationManager.AppSettings["HostURL"] + "/" + _Page + (String.IsNullOrEmpty(Convert.ToString(page.RouteData.Values["State"])) ? "" : "/" + Convert.ToString(page.RouteData.Values["State"])) + (_IsState ? "/" + DbUtility._GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"])) : "") + "/" + _PageName.Replace(" ", "-") + "-In-" + DbUtility._GetFormatedURL(Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"])) + "'>" + _PageName.Replace("-", " ") + " in " + Convert.ToString(_DataTable.Rows[_Counter]["DisplayName"]) + "</a></li>";
                //}

            }
        }

        public static String _GetCityNameCamlecase(String _Val)
        {
            return _Val.Substring(0, 1).ToUpper() + _Val.Substring(1, _Val.Length - 1);
        }
        public static string GenerateSlug(string phrase)
        {
            if (string.IsNullOrEmpty(phrase)) return "";
            string str = phrase.ToLower();
            str = Regex.Replace(str, @"[^a-z0-9\s-]", "");
            str = Regex.Replace(str, @"\s+", " ").Trim();
            str = str.Replace(" ", "-");
            str = Regex.Replace(str, @"-+", "-");
            return str;
        }

        public static bool _SeoPageExists(string pageKey)
        {
            // Example DB check
            DataTable dt = _GetDataTable24(
                "SELECT 1 FROM SeoPages WHERE PageKey = '" + pageKey.Replace("'", "''") + "'"
            );

            return dt != null && dt.Rows.Count > 0;
        }

    }
}