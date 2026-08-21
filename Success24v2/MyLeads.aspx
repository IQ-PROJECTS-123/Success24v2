<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MyLeads.aspx.cs" Inherits="Success24v2.MyLeads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>

       /* =========================================================
   MY LEADS - SUCCESS24 CRM DESIGN
========================================================= */

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    background: #f7f8fc;
    font-family: Arial, Helvetica, sans-serif;
    color: #1f2937;
}


/* =========================================================
   MAIN CONTAINER
========================================================= */

.container {
    width: 92%;
    max-width: 1500px;
    margin: 35px auto 50px;
}


/* =========================================================
   PAGE HEADER
========================================================= */

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 28px;
}

.header h1 {
    margin: 0 0 10px 0;

    color: #172033;

    font-size: 30px;
    font-weight: 700;

    position: relative;
}

.header h1::after {
    content: "";

    display: block;

    width: 48px;
    height: 4px;

    margin-top: 8px;

    border-radius: 10px;

    background: linear-gradient(
        90deg,
        #ff6411,
        #ef2d32
    );
}


/* =========================================================
   WELCOME TEXT
========================================================= */

.welcome {
    color: #6b7280;

    font-size: 15px;
}

.welcome strong {
    color: #ef4b25;

    font-weight: 700;
}


/* =========================================================
   OLD LOGOUT BUTTON
========================================================= */

.btn-logout {
    background: linear-gradient(
        90deg,
        #ff6411,
        #ef2d32
    );

    color: #ffffff;

    border: none;

    padding: 10px 20px;

    border-radius: 7px;

    cursor: pointer;

    font-size: 13px;
    font-weight: 600;

    box-shadow:
        0 4px 12px rgba(239, 45, 50, 0.20);

    transition:
        transform .2s ease,
        box-shadow .2s ease;
}

.btn-logout:hover {
    transform: translateY(-2px);

    box-shadow:
        0 7px 16px rgba(239, 45, 50, 0.28);
}


/* =========================================================
   STATISTICS
========================================================= */

.stats {
    display: grid;

    grid-template-columns: repeat(4, 1fr);

    gap: 22px;

    margin-bottom: 28px;
}


/* =========================================================
   STAT CARD
========================================================= */

.stat-card {
    position: relative;

    background: #ffffff;

    padding: 22px 24px;

    min-height: 115px;

    border: 1px solid #eeeeee;

    border-radius: 12px;

    box-shadow:
        0 4px 18px rgba(31, 41, 55, 0.06);

    overflow: hidden;

    transition:
        transform .25s ease,
        box-shadow .25s ease;
}


/* Success24 top accent */

.stat-card::before {
    content: "";

    position: absolute;

    top: 0;
    left: 0;

    width: 100%;
    height: 4px;

    background: linear-gradient(
        90deg,
        #ff6411,
        #ef2d32
    );
}


.stat-card:hover {
    transform: translateY(-4px);

    box-shadow:
        0 10px 28px rgba(31, 41, 55, 0.11);
}


/* small decorative circle */

.stat-card::after {
    content: "";

    position: absolute;

    width: 70px;
    height: 70px;

    right: -25px;
    bottom: -30px;

    border-radius: 50%;

    background: linear-gradient(
        135deg,
        rgba(255, 100, 17, .08),
        rgba(239, 45, 50, .08)
    );
}


.stat-title {
    position: relative;
    z-index: 1;

    margin-bottom: 10px;

    color: #6b7280;

    font-size: 13px;

    font-weight: 500;
}


.stat-number {
    position: relative;
    z-index: 1;

    color: #172033;

    font-size: 29px;

    line-height: 1;

    font-weight: 700;
}

/* =========================================================
   FOLLOW UP CARD
========================================================= */

.followup-card {
    display: block;

    width: 100%;

    text-align: left;

    text-decoration: none;

    color: inherit;

    cursor: pointer;

    font-family: Arial, Helvetica, sans-serif;

    border: 1px solid #eeeeee;

    transition:
        transform .25s ease,
        box-shadow .25s ease;
}


.followup-card:hover {
    transform: translateY(-4px);

    box-shadow:
        0 10px 28px rgba(109, 40, 217, .14);

    text-decoration: none;
}


.followup-card .stat-number {
    color: #6d28d9;
}


.view-followups {
    float: right;

    color: #6d28d9;

    font-size: 11px;

    font-weight: 600;

    margin-top: 2px;
}

/* =========================================================
   MAIN LEADS CARD
========================================================= */

.card {
    width: 100%;

    background: #ffffff;

    border: 1px solid #eceef2;

    border-radius: 12px;

    box-shadow:
        0 5px 22px rgba(31, 41, 55, 0.07);

    overflow: hidden;
}


/* =========================================================
   CARD HEADER
========================================================= */

.card-header {
    padding: 20px 22px;

    border-bottom: 1px solid #f0e5df;

    display: flex;

    align-items: center;

    justify-content: space-between;

    background: linear-gradient(
        90deg,
        #fff6f0 0%,
        #ffffff 65%
    );
}


.card-header h2 {
    margin: 0;

    color: #172033;

    font-size: 20px;

    font-weight: 700;
}


/* Small accent before heading */

.card-header h2::before {
    content: "";

    display: inline-block;

    width: 4px;
    height: 20px;

    margin-right: 10px;

    vertical-align: -4px;

    border-radius: 10px;

    background: linear-gradient(
        #ff6411,
        #ef2d32
    );
}


/* =========================================================
   GRID WRAPPER
========================================================= */

.grid-wrapper {
    width: 100%;

    overflow-x: auto;

    -webkit-overflow-scrolling: touch;
}


/* Scrollbar */

.grid-wrapper::-webkit-scrollbar {
    height: 7px;
}

.grid-wrapper::-webkit-scrollbar-track {
    background: #f3f4f6;
}

.grid-wrapper::-webkit-scrollbar-thumb {
    background: #c5c8ce;

    border-radius: 10px;
}

.grid-wrapper::-webkit-scrollbar-thumb:hover {
    background: #9ca3af;
}


/* =========================================================
   LEAD GRID
========================================================= */

.lead-grid {
    width: 100%;

    min-width: 1100px;

    border-collapse: collapse;

    background: #ffffff;
}


/* =========================================================
   TABLE HEADER
========================================================= */

.lead-grid th {
    padding: 14px 13px;

    background: #fff8f4;

    color: #4b3028;

    text-align: left;

    border-bottom: 1px solid #f4d9cd;

    font-size: 12px;

    font-weight: 700;

    text-transform: uppercase;

    letter-spacing: .25px;

    white-space: nowrap;
}


/* =========================================================
   TABLE ROWS
========================================================= */

.lead-grid td {
    padding: 15px 13px;

    color: #273142;

    border-bottom: 1px solid #eef0f3;

    font-size: 13px;

    vertical-align: middle;

    white-space: nowrap;

    transition: background .2s ease;
}


.lead-grid tr:last-child td {
    border-bottom: none;
}


.lead-grid tr:hover td {
    background: #fffaf7;
}


/* =========================================================
   STATUS
========================================================= */

.status {
    display: inline-block;

    padding: 6px 11px;

    border-radius: 20px;

    font-size: 11px;

    font-weight: 700;

    white-space: nowrap;
}


/* Assigned */

.assigned {
    background: #fff3df;

    color: #b45309;

    border: 1px solid #ffdda8;
}


/* Follow Up */

.followup {
    background: #f1eaff;

    color: #6d28d9;

    border: 1px solid #e2d5ff;
}


/* =========================================================
   CALL / FEEDBACK BUTTON
========================================================= */

.btn-call {
    display: inline-block;

    padding: 8px 15px;

    background: linear-gradient(
        90deg,
        #ff6411,
        #ef2d32
    );

    color: #ffffff !important;

    border-radius: 6px;

    text-decoration: none;

    font-size: 12px;

    font-weight: 600;

    white-space: nowrap;

    box-shadow:
        0 3px 9px rgba(239, 45, 50, .18);

    transition:
        transform .2s ease,
        box-shadow .2s ease;
}


.btn-call:hover {
    color: #ffffff !important;

    transform: translateY(-2px);

    box-shadow:
        0 6px 14px rgba(239, 45, 50, .28);
}

/* =========================================================
   FOLLOW UP SECTION
========================================================= */

.followup-section {
    margin-top: 25px;

    animation: followupOpen .25s ease;
}


.followup-subtitle {
    margin: 6px 0 0;

    color: #7b8190;

    font-size: 13px;
}


@keyframes followupOpen {

    from {
        opacity: 0;
        transform: translateY(8px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }

}

/* =========================================================
   GRIDVIEW PAGINATION
========================================================= */

.lead-grid > tbody > tr:last-child table {
    margin: 10px auto;
}


.lead-grid > tbody > tr:last-child table td {
    padding: 3px;

    border: none;
}


.lead-grid > tbody > tr:last-child table a,
.lead-grid > tbody > tr:last-child table span {
    min-width: 32px;
    height: 32px;

    display: inline-flex;

    align-items: center;

    justify-content: center;

    padding: 0 9px;

    border-radius: 6px;

    text-decoration: none;

    font-size: 12px;
}


.lead-grid > tbody > tr:last-child table a {
    background: #fff4ed;

    color: #ef4b25;

    border: 1px solid #ffe0d0;
}


.lead-grid > tbody > tr:last-child table a:hover {
    background: #ffebe1;
}


.lead-grid > tbody > tr:last-child table span {
    background: linear-gradient(
        90deg,
        #ff6411,
        #ef2d32
    );

    color: #ffffff;
}


/* =========================================================
   EMPTY GRID
========================================================= */

.lead-grid .empty-row,
.lead-grid td[colspan] {
    padding: 30px;

    color: #8a8f98;

    text-align: center;
}


/* =========================================================
   TABLET
========================================================= */

@media (max-width: 900px) {

    .container {
        width: 95%;

        margin: 25px auto 40px;
    }


    .stats {
        grid-template-columns: repeat(2, 1fr);

        gap: 15px;
    }


    .header h1 {
        font-size: 27px;
    }


    .stat-card {
        padding: 20px;
    }

}


/* =========================================================
   MOBILE
========================================================= */

@media (max-width: 600px) {

    .container {
        width: 94%;

        margin: 20px auto 35px;
    }


    .header {
        align-items: flex-start;

        flex-direction: column;

        gap: 15px;

        margin-bottom: 20px;
    }


    .header h1 {
        font-size: 25px;
    }


    .stats {
        grid-template-columns: 1fr;

        gap: 14px;

        margin-bottom: 20px;
    }


    .stat-card {
        min-height: 95px;

        padding: 18px;
    }


    .stat-number {
        font-size: 25px;
    }


    .card-header {
        padding: 16px;
    }


    .card-header h2 {
        font-size: 17px;
    }


    .lead-grid th,
    .lead-grid td {
        padding: 12px 10px;

        font-size: 12px;
    }

}
.lead-filters {
    display: flex;
    gap: 8px;
    align-items: center;
    flex-wrap: wrap;
}

.lead-filter {
    display: inline-flex;
    align-items: center;
    padding: 9px 18px;
    border-radius: 7px;
    border: 1px solid #e5e7eb;
    background: #fff;
    color: #4b5563;
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all .2s ease;
}

.lead-filter:hover {
    background: #fff7f2;
    color: #f65a18;
    border-color: #f65a18;
}

.lead-filter.active {
    background: #f65a18;
    color: #fff;
    border-color: #f65a18;
}
.green-line {
    border: 0;
    height: 2px;
    background: #16a34a;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="container">


    <!-- Header -->
<div class="header">

    <div>
        <h1>My Leads</h1>

        <div class="welcome">
            Welcome,
            <strong>
                <asp:Label
                    ID="lblUserName"
                    runat="server">
                </asp:Label>
            </strong>
        </div>
    </div>



</div>
            <hr class="green-line" />
            <div class="lead-filters">

    <asp:LinkButton
        ID="btnAllLeads"
        runat="server"
        Text="My Leads"
        CommandArgument="All"
        OnCommand="LeadFilter_Command"
        CssClass="lead-filter active">
    </asp:LinkButton>

    <asp:LinkButton
        ID="btnFollowUp"
        runat="server"
        Text="Follow Up"
        CommandArgument="Follow Up"
        OnCommand="LeadFilter_Command"
        CssClass="lead-filter">
    </asp:LinkButton>

    <asp:LinkButton
        ID="btnConvertedFilter"
        runat="server"
        Text="Converted"
        CommandArgument="Converted"
        OnCommand="LeadFilter_Command"
        CssClass="lead-filter">
    </asp:LinkButton>
 <asp:LinkButton
     ID="btnInterested"
     runat="server"
     Text="Interested"
     CommandArgument="Interested"
     OnCommand="LeadFilter_Command"
     CssClass="lead-filter">
 </asp:LinkButton>
 <asp:LinkButton
     ID="btnWorking"
     runat="server"
     Text="Working"
     CommandArgument="Working"
     OnCommand="LeadFilter_Command"
     CssClass="lead-filter">
 </asp:LinkButton>
  <asp:LinkButton
     ID="btnNotInterested"
     runat="server"
     Text="Not Interested"
     CommandArgument="Not Interested"
     OnCommand="LeadFilter_Command"
     CssClass="lead-filter">
 </asp:LinkButton>

</div>
            <hr class="green-line" />

    <!-- Statistics -->

    <div class="stats">

        <div class="stat-card">

            <div class="stat-title">
                My Total Leads
            </div>

            <div class="stat-number">

                <asp:Label
                    ID="lblTotal"
                    runat="server"
                    Text="0">
                </asp:Label>

            </div>

        </div>


        <div class="stat-card">

            <div class="stat-title">
                Assigned
            </div>

            <div class="stat-number">

                <asp:Label
                    ID="lblAssigned"
                    runat="server"
                    Text="0">
                </asp:Label>

            </div>

        </div>


      <asp:LinkButton
    ID="btnFollowUps"
    runat="server"
    CssClass="stat-card followup-card"
    OnClick="btnFollowUps_Click">

    <div class="stat-title">
        Follow Ups
        <span class="view-followups">
            View →
        </span>
    </div>

    <div class="stat-number">

        <asp:Label
            ID="lblFollowUp"
            runat="server"
            Text="0">
        </asp:Label>

    </div>

</asp:LinkButton>

    <asp:LinkButton
    ID="btnconverted"
    runat="server"
    CssClass="stat-card followup-card"
    OnClick="btnconverted_Click">

    <div class="stat-title">
        Converted
        <span class="view-followups">
            View →
        </span>
    </div>

    <div class="stat-number">

        <asp:Label
            ID="lblconverted"
            runat="server"
            Text="0">
        </asp:Label>

    </div>

</asp:LinkButton>

    </div>


    <!-- Leads -->

  <asp:Panel
    ID="pnlMyLeads"
    runat="server"
    Visible="true"
    CssClass="card">

    <div class="card-header">

       <h2>
    <asp:Label
        ID="lblLeadGridTitle"
        runat="server"
        Text="My Assigned Leads">
    </asp:Label>
</h2>

    </div>

    <div class="grid-wrapper">

         <asp:GridView
     ID="gvMyLeads"
     runat="server"
     AutoGenerateColumns="False"
     CssClass="lead-grid"
     GridLines="None"
     AllowPaging="True"
     PageSize="50"
     OnPageIndexChanging="gvMyLeads_PageIndexChanging"
     EmptyDataText="No leads assigned to you.">

              <Columns>


     <asp:BoundField
         DataField="ID"
         HeaderText="ID" />


     <asp:BoundField
         DataField="Name"
         HeaderText="Name" />


     <asp:BoundField
         DataField="Email"
         HeaderText="Email" />


     <asp:BoundField
         DataField="Phone"
         HeaderText="Phone" />


     <asp:BoundField
         DataField="Qualification"
         HeaderText="Qualification" />


     <asp:BoundField
         DataField="Stream"
         HeaderText="Stream" />


     <asp:BoundField
         DataField="PassingYear"
         HeaderText="Passing Year" />


     <asp:TemplateField HeaderText="Status">

         <ItemTemplate>

             <span class='status <%# GetStatusClass(Eval("Status")) %>'>

                 <%# Eval("Status") %>

             </span>

         </ItemTemplate>

     </asp:TemplateField>


     <asp:BoundField
         DataField="AssignedOn"
         HeaderText="Assigned On"
         DataFormatString="{0:dd-MMM-yyyy}" />


     <asp:TemplateField HeaderText="Action">

         <ItemTemplate>

           <asp:HyperLink
                ID="lnkCall"
                runat="server"
                CssClass="btn-call"

               NavigateUrl='<%#"LeadCall.aspx?id=" +Eval("ID")%>'

                Text="Call / Feedback">
            </asp:HyperLink>

         </ItemTemplate>

     </asp:TemplateField>


 </Columns>

        </asp:GridView>

    </div>

</asp:Panel>

     

        <!-- =====================================================
     FOLLOW UP LEADS
====================================================== -->

<asp:Panel
    ID="pnlFollowUps"
    runat="server"
    Visible="false"
    CssClass="card followup-section">

    <div class="card-header">

        <div>

            <h2>My Follow Ups</h2>

            <p class="followup-subtitle">
                Leads that require follow-up calls.
            </p>

        </div>

    </div>


    <div class="grid-wrapper">

        <asp:GridView
            ID="gvFollowUps"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="lead-grid"
            GridLines="None"
            AllowPaging="True"
            PageSize="50"
            OnPageIndexChanging="gvFollowUps_PageIndexChanging"
            EmptyDataText="No follow-ups available.">

            <Columns>


                <asp:BoundField
                    DataField="ID"
                    HeaderText="ID" />


                <asp:BoundField
                    DataField="Name"
                    HeaderText="Name" />


                <asp:BoundField
                    DataField="Phone"
                    HeaderText="Phone" />


                <asp:BoundField
                    DataField="Email"
                    HeaderText="Email" />


                <asp:BoundField
                    DataField="Status"
                    HeaderText="Status" />


                <asp:BoundField
                    DataField="FollowUpDate"
                    HeaderText="Follow Up Date"
                    DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" />


                <asp:BoundField
                    DataField="LastFeedback"
                    HeaderText="Last Feedback" />


                <asp:TemplateField HeaderText="Action">

                    <ItemTemplate>

                        <asp:HyperLink
                            ID="lnkFollowUpCall"
                            runat="server"
                            CssClass="btn-call"

                           NavigateUrl='<%#
                            "LeadCall.aspx?id=" +
                            Eval("ID")
                        %>'

                            Text="Call / Feedback">

                        </asp:HyperLink>

                    </ItemTemplate>

                </asp:TemplateField>


            </Columns>

        </asp:GridView>

    </div>

</asp:Panel>

                <!-- =====================================================
     FOLLOW UP LEADS
====================================================== -->

<asp:Panel
    ID="pnlConverted"
    runat="server"
    Visible="false"
    CssClass="card followup-section">

    <div class="card-header">

        <div>

            <h2>My Converted Leads</h2>

            <p class="followup-subtitle">
                Leads that have been converted.
            </p>

        </div>

    </div>


    <div class="grid-wrapper">

        <asp:GridView
            ID="gvConverted"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="lead-grid"
            GridLines="None"
            AllowPaging="True"
            PageSize="50"
            OnPageIndexChanging="gvConverted_PageIndexChanging"
            EmptyDataText="No converted leads available.">

            <Columns>


                <asp:BoundField
                    DataField="ID"
                    HeaderText="ID" />


                <asp:BoundField
                    DataField="Name"
                    HeaderText="Name" />


                <asp:BoundField
                    DataField="Phone"
                    HeaderText="Phone" />


                <asp:BoundField
                    DataField="Email"
                    HeaderText="Email" />


                <asp:BoundField
                    DataField="Status"
                    HeaderText="Status" />


                <asp:BoundField
                    DataField="FollowUpDate"
                    HeaderText="Follow Up Date"
                    DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" />


                <asp:BoundField
                    DataField="LastFeedback"
                    HeaderText="Last Feedback" />


                <asp:TemplateField HeaderText="Action">

                    <ItemTemplate>

                        <asp:HyperLink
                            ID="lnkFollowUpCall"
                            runat="server"
                            CssClass="btn-call"

                           NavigateUrl='<%#
                            "LeadCall.aspx?id=" +
                            Eval("ID")
                        %>'

                            Text="Call / Feedback">

                        </asp:HyperLink>

                    </ItemTemplate>

                </asp:TemplateField>


            </Columns>

        </asp:GridView>

    </div>

</asp:Panel>

    </div>
</asp:Content>
