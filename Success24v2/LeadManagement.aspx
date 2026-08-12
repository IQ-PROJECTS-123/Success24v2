<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="LeadManagement.aspx.cs" Inherits="Success24v2.LeadManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>

      /* =========================================================
   LEAD MANAGEMENT - SUCCESS24 CRM
========================================================= */

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    padding: 0;
    background: #f7f8fc;
    font-family: Arial, Helvetica, sans-serif;
    color: #1f2937;
}


/* =========================================================
   PAGE CONTAINER
========================================================= */

.page-container {
    width: 95%;
    max-width: 1500px;
    margin: 35px auto 50px;
}


/* =========================================================
   PAGE HEADER
========================================================= */

.page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;

    gap: 20px;

    margin-bottom: 28px;
}


/* Left heading area */

.page-title h1 {
    position: relative;

    margin: 0 0 10px 0;

    color: #172033;

    font-size: 30px;
    font-weight: 700;
}


/* Success24 underline */

.page-title h1::after {
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


.page-title p {
    margin: 0;

    color: #6b7280;

    font-size: 14px;
}


/* =========================================================
   CREATE NEW LEAD BUTTON
========================================================= */

.btn-create-lead {
    display: inline-flex;

    align-items: center;
    justify-content: center;

    gap: 8px;

    min-height: 43px;

    padding: 0 20px;

    background: linear-gradient(
        90deg,
        #ff6411,
        #ef2d32
    );

    color: #ffffff !important;

    border: none;

    border-radius: 7px;

    text-decoration: none !important;

    font-size: 14px;

    font-weight: 600;

    white-space: nowrap;

    cursor: pointer;

    box-shadow:
        0 4px 12px rgba(239, 45, 50, 0.20);

    transition:
        transform .2s ease,
        box-shadow .2s ease;
}


.btn-create-lead:hover {
    color: #ffffff !important;

    transform: translateY(-2px);

    box-shadow:
        0 7px 18px rgba(239, 45, 50, 0.30);
}


/* Plus circle */

.plus-icon {
    width: 22px;
    height: 22px;

    display: inline-flex;

    align-items: center;
    justify-content: center;

    background: rgba(255,255,255,.20);

    border-radius: 50%;

    color: #ffffff;

    font-size: 18px;

    font-weight: 400;

    line-height: 1;
}


/* =========================================================
   OLD LOGOUT BUTTON
========================================================= */

.btn-logout {
    background: #dc2626;

    color: #ffffff;

    border: none;

    padding: 10px 20px;

    border-radius: 6px;

    font-weight: 600;

    cursor: pointer;
}


.btn-logout:hover {
    background: #b91c1c;
}


/* =========================================================
   STATISTICS
========================================================= */

.stats {
    display: grid;

    grid-template-columns: repeat(4, 1fr);

    gap: 20px;

    margin-bottom: 25px;
}


/* =========================================================
   STAT CARD
========================================================= */

.stat-card {
    position: relative;

    min-height: 110px;

    padding: 21px;

    background: #ffffff;

    border: 1px solid #eeeeee;

    border-radius: 11px;

    box-shadow:
        0 4px 16px rgba(31, 41, 55, .06);

    overflow: hidden;

    transition:
        transform .2s ease,
        box-shadow .2s ease;
}


/* Success24 top border */

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


/* Decorative circle */

.stat-card::after {
    content: "";

    position: absolute;

    right: -25px;
    bottom: -30px;

    width: 75px;
    height: 75px;

    border-radius: 50%;

    background: linear-gradient(
        135deg,
        rgba(255,100,17,.07),
        rgba(239,45,50,.07)
    );
}


.stat-card:hover {
    transform: translateY(-3px);

    box-shadow:
        0 9px 25px rgba(31,41,55,.10);
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

    font-size: 28px;

    font-weight: 700;

    line-height: 1;
}


/* =========================================================
   ASSIGNMENT CARD
========================================================= */

.assignment-card {
    position: relative;

    background: #ffffff;

    padding: 23px;

    margin-bottom: 25px;

    border: 1px solid #eeeeee;

    border-radius: 11px;

    box-shadow:
        0 4px 18px rgba(31,41,55,.06);

    overflow: hidden;
}


/* Left accent */

.assignment-card::before {
    content: "";

    position: absolute;

    top: 0;
    left: 0;

    width: 4px;
    height: 100%;

    background: linear-gradient(
        #ff6411,
        #ef2d32
    );
}


.assignment-title {
    margin-bottom: 20px;

    color: #172033;

    font-size: 20px;

    font-weight: 700;
}


/* =========================================================
   ASSIGNMENT CONTROLS
========================================================= */

.assignment-controls {
    display: flex;

    gap: 20px;

    align-items: flex-end;

    flex-wrap: wrap;
}


.form-group {
    display: flex;

    flex-direction: column;

    gap: 7px;
}


.form-group label {
    color: #4b5563;

    font-size: 13px;

    font-weight: 600;
}


/* =========================================================
   FORM CONTROL
========================================================= */

.form-control {
    width: 230px;
    height: 42px;

    padding: 8px 12px;

    background: #ffffff;

    color: #1f2937;

    border: 1px solid #d6dae1;

    border-radius: 6px;

    outline: none;

    font-family: Arial, Helvetica, sans-serif;

    transition:
        border-color .2s ease,
        box-shadow .2s ease;
}


.form-control:focus {
    border-color: #ff6411;

    box-shadow:
        0 0 0 3px rgba(255,100,17,.10);
}


/* =========================================================
   ASSIGN BUTTON
========================================================= */

.btn-assign {
    height: 42px;

    padding: 0 23px;

    border: none;

    border-radius: 6px;

    background: #16a34a;

    color: #ffffff;

    font-size: 13px;

    font-weight: 600;

    cursor: pointer;

    box-shadow:
        0 3px 9px rgba(22,163,74,.18);

    transition:
        transform .2s ease,
        background .2s ease,
        box-shadow .2s ease;
}


.btn-assign:hover {
    background: #15803d;

    transform: translateY(-1px);

    box-shadow:
        0 5px 12px rgba(22,163,74,.25);
}


/* =========================================================
   MESSAGES
========================================================= */

.success-message {
    display: block;

    margin-top: 15px;

    color: #15803d;

    font-size: 13px;

    font-weight: 600;
}


.error-message {
    display: block;

    margin-top: 15px;

    color: #dc2626;

    font-size: 13px;

    font-weight: 600;
}


/* =========================================================
   ALL LEADS CARD
========================================================= */

.card {
    width: 100%;

    background: #ffffff;

    border: 1px solid #eceef2;

    border-radius: 11px;

    box-shadow:
        0 5px 20px rgba(31,41,55,.07);

    overflow: hidden;
}


/* =========================================================
   CARD HEADER
========================================================= */

.card-header {
    display: flex;

    justify-content: space-between;

    align-items: center;

    gap: 15px;

    padding: 20px 22px;

    background: linear-gradient(
        90deg,
        #fff7f2 0%,
        #ffffff 65%
    );

    border-bottom: 1px solid #f0e5df;
}


.card-header h2 {
    margin: 0;

    color: #172033;

    font-size: 20px;

    font-weight: 700;
}


/* Accent beside All Leads */

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
   SEARCH
========================================================= */

.search-box {
    width: 300px;

    height: 40px;

    padding: 9px 12px;

    background: #ffffff;

    color: #1f2937;

    border: 1px solid #d6dae1;

    border-radius: 6px;

    outline: none;

    font-family: Arial, Helvetica, sans-serif;

    transition:
        border-color .2s ease,
        box-shadow .2s ease;
}


.search-box:focus {
    border-color: #ff6411;

    box-shadow:
        0 0 0 3px rgba(255,100,17,.10);
}


.btn-search {
    height: 40px;

    padding: 0 19px;

    margin-left: 4px;

    border: none;

    border-radius: 6px;

    background: linear-gradient(
        90deg,
        #ff6411,
        #ef2d32
    );

    color: #ffffff;

    font-size: 13px;

    font-weight: 600;

    cursor: pointer;

    box-shadow:
        0 3px 9px rgba(239,45,50,.16);

    transition:
        transform .2s ease,
        box-shadow .2s ease;
}


.btn-search:hover {
    transform: translateY(-1px);

    box-shadow:
        0 5px 13px rgba(239,45,50,.25);
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
    background: #c4c7cd;

    border-radius: 10px;
}


.grid-wrapper::-webkit-scrollbar-thumb:hover {
    background: #9ca3af;
}


/* =========================================================
   GRIDVIEW
========================================================= */

.lead-grid {
    width: 100%;

    min-width: 1100px;

    border-collapse: collapse;

    background: #ffffff;
}


/* =========================================================
   GRID HEADER
========================================================= */

.lead-grid th {
    padding: 14px 12px;

    background: #fff8f4;

    color: #4b3028;

    text-align: left;

    border-bottom: 1px solid #f4d9cd;

    font-size: 12px;

    font-weight: 700;

    text-transform: uppercase;

    letter-spacing: .2px;

    white-space: nowrap;
}


/* =========================================================
   GRID ROW
========================================================= */

.lead-grid td {
    padding: 14px 12px;

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


/* NEW */

.status-new {
    background: #e8f1ff;

    color: #2563eb;

    border: 1px solid #cfe0ff;
}


/* ASSIGNED */

.status-assigned {
    background: #fff3df;

    color: #b45309;

    border: 1px solid #ffdda8;
}


/* FOLLOW UP */

.status-followup {
    background: #f1eaff;

    color: #6d28d9;

    border: 1px solid #e2d5ff;
}


/* CONVERTED */

.status-converted {
    background: #e4f8ea;

    color: #15803d;

    border: 1px solid #c4ebcf;
}


/* =========================================================
   GRIDVIEW PAGER
========================================================= */

.lead-grid table {
    margin: 15px auto;
}


.lead-grid table td {
    padding: 4px;

    border: none;
}


.lead-grid table a,
.lead-grid table span {
    display: inline-flex;

    align-items: center;

    justify-content: center;

    min-width: 32px;
    height: 32px;

    padding: 0 9px;

    border: 1px solid #f0d8cc;

    border-radius: 6px;

    text-decoration: none;

    font-size: 12px;
}


.lead-grid table a {
    background: #fff7f2;

    color: #ef4b25;
}


.lead-grid table a:hover {
    background: #ffebe1;
}


.lead-grid table span {
    background: linear-gradient(
        90deg,
        #ff6411,
        #ef2d32
    );

    color: #ffffff;

    border-color: transparent;
}


/* =========================================================
   TABLET
========================================================= */

@media(max-width: 900px) {

    .page-container {
        width: 94%;

        margin: 25px auto 40px;
    }


    .page-header {
        gap: 15px;
    }


    .page-title h1 {
        font-size: 26px;
    }


    .stats {
        grid-template-columns: repeat(2, 1fr);
    }


    .card-header {
        flex-direction: column;

        align-items: stretch;
    }


    .search-box {
        width: calc(100% - 85px);
    }

}


/* =========================================================
   MOBILE
========================================================= */

@media(max-width: 600px) {

    .page-container {
        width: 94%;

        margin: 20px auto 35px;
    }


    .page-header {
        flex-direction: column;

        align-items: flex-start;

        margin-bottom: 20px;
    }


    .page-title h1 {
        font-size: 24px;
    }


    .btn-create-lead {
        width: 100%;

        min-height: 42px;
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


    .assignment-card {
        padding: 18px;
    }


    .assignment-controls {
        flex-direction: column;

        align-items: stretch;

        gap: 15px;
    }


    .form-group {
        width: 100%;
    }


    .form-control {
        width: 100%;
    }


    .btn-assign {
        width: 100%;
    }


    .card-header {
        padding: 16px;
    }


    .card-header h2 {
        font-size: 18px;
    }


    .card-header > div {
        display: flex;

        width: 100%;

        gap: 6px;
    }


    .search-box {
        flex: 1;

        width: auto;

        min-width: 0;
    }


    .btn-search {
        margin-left: 0;
    }


    .lead-grid th,
    .lead-grid td {
        padding: 12px 10px;

        font-size: 12px;
    }

}

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <div class="page-container">

    <!-- ==========================
         Header
    =========================== -->

  <div class="page-header">

    <div class="page-title">

        <h1>Lead Management</h1>

        <p>
            Manage and monitor all leads from one place.
        </p>

    </div>


    <asp:HyperLink
        ID="lnkCreateLead"
        runat="server"
        NavigateUrl="~/CreateLead.aspx"
        CssClass="btn-create-lead">

        <span class="plus-icon">+</span>
        Create New Lead

    </asp:HyperLink>

</div>


    <!-- ==========================
         Statistics
    =========================== -->

    <div class="stats">

        <div class="stat-card">

            <div class="stat-title">
                Total Leads
            </div>

            <div class="stat-number">
                <asp:Label ID="lblTotalLeads"
                    runat="server"
                    Text="0">
                </asp:Label>
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-title">
                New Leads
            </div>

            <div class="stat-number">
                <asp:Label ID="lblNewLeads"
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
                <asp:Label ID="lblAssigned"
                    runat="server"
                    Text="0">
                </asp:Label>
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-title">
                Follow Ups
            </div>

            <div class="stat-number">

                <asp:Label ID="lblFollowUps"
                    runat="server"
                    Text="0">
                </asp:Label>

            </div>

        </div>

    </div>

        <!-- ==========================
     Lead Assignment
=========================== -->

<div class="assignment-card">

    <div class="assignment-title">
        Assign Leads
    </div>

    <div class="assignment-controls">

        <div class="form-group">

            <label>Select Person</label>

            <asp:DropDownList
                ID="ddlUsers"
                runat="server"
                CssClass="form-control">
            </asp:DropDownList>

        </div>


        <div class="form-group">

            <label>Number of Leads</label>

            <asp:TextBox
                ID="txtLeadCount"
                runat="server"
                Text="10"
                TextMode="Number"
                CssClass="form-control">
            </asp:TextBox>

        </div>


        <div class="form-group button-group">

            <asp:Button
                ID="btnAssign"
                runat="server"
                Text="Assign Leads"
                CssClass="btn-assign"
                OnClick="btnAssign_Click" />

        </div>

    </div>


    <asp:Label
        ID="lblMessage"
        runat="server">
    </asp:Label>

</div>

    <!-- ==========================
         Grid Card
    =========================== -->

    <div class="card">

        <div class="card-header">

            <h2>All Leads</h2>

            <div>

                <asp:TextBox
                    ID="txtSearch"
                    runat="server"
                    CssClass="search-box"
                    placeholder="Search name, email or phone...">
                </asp:TextBox>

                <asp:Button
                    ID="btnSearch"
                    runat="server"
                    Text="Search"
                    CssClass="btn-search"
                    OnClick="btnSearch_Click" />

            </div>

        </div>


        <div class="grid-wrapper">

            <asp:GridView
                ID="gvLeads"
                runat="server"

                AutoGenerateColumns="False"

                CssClass="lead-grid"

                GridLines="None"

                AllowPaging="True"

                PageSize="10"

                OnPageIndexChanging="gvLeads_PageIndexChanging"

                EmptyDataText="No leads found.">

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
                        DataField="AssignTo"
                        HeaderText="Assign To"
                        NullDisplayText="Not Assigned" />

                </Columns>


                <PagerSettings
                    Mode="NumericFirstLast"
                    FirstPageText="First"
                    LastPageText="Last"
                    PageButtonCount="5" />

            </asp:GridView>

        </div>

    </div>

</div>
        </div>
</asp:Content>
