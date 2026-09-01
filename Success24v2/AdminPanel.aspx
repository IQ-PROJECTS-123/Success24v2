<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="Success24v2.AdminPanel1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
        <style>

        /* =========================================
           ADMIN PANEL
        ========================================= */

        .admin-panel {
            width: 94%;
            max-width: 1550px;
            margin: 30px auto 50px;
        }


        /* =========================================
           PAGE HEADER
        ========================================= */

        .panel-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .panel-header h1 {
            margin: 0 0 7px;
            color: #172033;
            font-size: 29px;
            font-weight: 700;
        }

        .panel-header p {
            margin: 0;
            color: #718096;
            font-size: 14px;
        }


        /* =========================================
           REPORT FILTER
        ========================================= */

        .report-filter {
            display: flex;
            align-items: flex-end;
            gap: 16px;

            background: #ffffff;

            border: 1px solid #e8edf3;

            border-radius: 12px;

            padding: 20px;

            margin-bottom: 25px;

            box-shadow:
                0 4px 14px rgba(15,23,42,.05);
        }


        .filter-item {
            display: flex;
            flex-direction: column;
            gap: 7px;
        }


        .filter-item label {
            font-size: 12px;

            font-weight: 700;

            color: #475467;
        }


        .report-dropdown,
        .report-date {
            height: 42px;

            min-width: 190px;

            padding: 0 12px;

            border: 1px solid #d0d5dd;

            border-radius: 7px;

            background: #ffffff;

            color: #344054;

            font-size: 14px;

            outline: none;
        }


        .report-dropdown:focus,
        .report-date:focus {
            border-color: #f65a18;

            box-shadow:
                0 0 0 3px rgba(246,90,24,.10);
        }


        .btn-filter {
            height: 42px;

            padding: 0 22px;

            border: none;

            border-radius: 7px;

            background: #f65a18;

            color: #ffffff;

            font-size: 14px;

            font-weight: 600;

            cursor: pointer;
        }


        .btn-filter:hover {
            background: #df4e12;
        }


        /* =========================================
           STATISTICS
        ========================================= */

        .stats-grid {
            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 18px;

            margin-bottom: 25px;
        }


        .stat-card {
            position: relative;

            background: #ffffff;

            border: 1px solid #e8edf3;

            border-radius: 12px;

            padding: 21px;

            overflow: hidden;

            box-shadow:
                0 4px 14px rgba(15,23,42,.05);

            transition:
                transform .2s ease,
                box-shadow .2s ease;
        }


        .stat-card:hover {
            transform: translateY(-2px);

            box-shadow:
                0 8px 22px rgba(15,23,42,.08);
        }


        .stat-card::before {
            content: "";

            position: absolute;

            left: 0;
            top: 0;
            bottom: 0;

            width: 4px;

            background: #f65a18;
        }


        .stat-title {
            color: #667085;

            font-size: 13px;

            font-weight: 600;

            margin-bottom: 10px;
        }


        .stat-number {
            color: #172033;

            font-size: 30px;

            line-height: 1;

            font-weight: 700;
        }


        .stat-subtitle {
            margin-top: 9px;

            color: #98a2b3;

            font-size: 12px;
        }


        /* =========================================
           CARD COLORS
        ========================================= */

        .stat-card.assigned::before {
            background: #f59e0b;
        }

        .stat-card.followup::before {
            background: #7c3aed;
        }

        .stat-card.working::before {
            background: #2563eb;
        }

        .stat-card.interested::before {
            background: #16a34a;
        }

        .stat-card.not-interested::before {
            background: #dc2626;
        }

        .stat-card.converted::before {
            background: #059669;
        }

        .stat-card.students::before {
            background: #0891b2;
        }


        /* =========================================
           SUMMARY CARD
        ========================================= */

        .summary-card {
            background: #ffffff;

            border: 1px solid #e8edf3;

            border-radius: 12px;

            overflow: hidden;

            box-shadow:
                0 4px 16px rgba(15,23,42,.05);
        }


        .summary-header {
            padding: 20px 22px;

            border-bottom: 1px solid #edf0f4;
        }


        .summary-header h2 {
            margin: 0;

            color: #172033;

            font-size: 19px;

            font-weight: 700;
        }


        .summary-header p {
            margin: 6px 0 0;

            color: #718096;

            font-size: 13px;
        }


        /* =========================================
           SUMMARY TABLE
        ========================================= */

        .summary-wrapper {
            width: 100%;

            overflow-x: auto;
        }


        .summary-grid {
            width: 100%;

            min-width: 900px;

            border-collapse: collapse;
        }


        .summary-grid th {
            padding: 14px 16px;

            background: #f8fafc;

            color: #344054;

            font-size: 12px;

            text-align: left;

            text-transform: uppercase;

            letter-spacing: .3px;

            border-bottom: 1px solid #e4e7ec;

            white-space: nowrap;
        }


        .summary-grid td {
            padding: 14px 16px;

            color: #475467;

            font-size: 13px;

            border-bottom: 1px solid #eef1f5;

            white-space: nowrap;
        }


        .summary-grid tr:nth-child(even) td {
            background: #fbfcfe;
        }


        .summary-grid tr:hover td {
            background: #fff7f2;
        }


        .summary-grid td:first-child {
            color: #1f2937;

            font-weight: 700;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media(max-width:1100px) {

            .stats-grid {
                grid-template-columns:
                    repeat(2, 1fr);
            }

        }


        @media(max-width:900px) {

            .report-filter {
                flex-wrap: wrap;
            }

            .filter-item {
                width: 100%;
            }

            .report-dropdown,
            .report-date {
                width: 100%;
            }

        }


        @media(max-width:700px) {

            .admin-panel {
                width: 94%;
            }

            .panel-header {
                display: block;
            }

            .panel-header h1 {
                font-size: 24px;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="admin-panel">


        <!-- =====================================
             HEADER
        ====================================== -->

        <div class="panel-header">

            <div>

                <h1>Admin Panel</h1>

                <p>
                    Monitor and manage your complete lead activity.
                </p>

            </div>

        </div>


        <!-- =====================================
             REPORT FILTER
        ====================================== -->

        <div class="report-filter">


            <!-- CALLER -->

            <div class="filter-item">

                <label>
                    Caller
                </label>


                <asp:DropDownList
                    ID="ddlCaller"
                    runat="server"
                    CssClass="report-dropdown"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlCaller_SelectedIndexChanged">

                </asp:DropDownList>

            </div>


            <!-- REPORT TYPE -->

            <div class="filter-item">

                <label>
                    Report
                </label>


               <asp:DropDownList
                ID="ddlReportType"
                runat="server"
                CssClass="report-dropdown">

                <asp:ListItem
                    Text="All Data"
                    Value="All">
                </asp:ListItem>

                <asp:ListItem
                    Text="Particular Date"
                    Value="Date">
                </asp:ListItem>

            </asp:DropDownList>

            </div>


            <!-- DATE -->

            <div class="filter-item">

                <label>
                    Select Date
                </label>


                <asp:TextBox
                    ID="txtReportDate"
                    runat="server"
                    TextMode="Date"
                    CssClass="report-date">
                </asp:TextBox>

            </div>


            <!-- FILTER BUTTON -->

            <div class="filter-item">

                <asp:Button
                    ID="btnFilter"
                    runat="server"
                    Text="Filter Report"
                    CssClass="btn-filter"
                    OnClick="btnFilter_Click" />

            </div>


        </div>


        <!-- =====================================
             STATISTICS
        ====================================== -->

        <div class="stats-grid">


            <!-- TOTAL -->

            <div class="stat-card">

                <div class="stat-title">
                    Total Leads
                </div>


                <div class="stat-number">

                    <asp:Label
                        ID="lblTotal"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </div>


                <div class="stat-subtitle">
                    Total leads
                </div>

            </div>


            <!-- ASSIGNED -->

            <div class="stat-card assigned">

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


                <div class="stat-subtitle">
                    Currently assigned
                </div>

            </div>


            <!-- FOLLOW UP -->

            <div class="stat-card followup">

                <div class="stat-title">
                    Follow Up
                </div>


                <div class="stat-number">

                    <asp:Label
                        ID="lblFollowUp"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </div>


                <div class="stat-subtitle">
                    Leads requiring follow up
                </div>

            </div>


            <!-- WORKING -->

            <div class="stat-card working">

                <div class="stat-title">
                    Working
                </div>


                <div class="stat-number">

                    <asp:Label
                        ID="lblWorking"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </div>


                <div class="stat-subtitle">
                    Currently working
                </div>

            </div>


            <!-- INTERESTED -->

            <div class="stat-card interested">

                <div class="stat-title">
                    Interested
                </div>


                <div class="stat-number">

                    <asp:Label
                        ID="lblInterested"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </div>


                <div class="stat-subtitle">
                    Interested candidates
                </div>

            </div>


            <!-- NOT INTERESTED -->

            <div class="stat-card not-interested">

                <div class="stat-title">
                    Not Interested
                </div>


                <div class="stat-number">

                    <asp:Label
                        ID="lblNotInterested"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </div>


                <div class="stat-subtitle">
                    Not interested candidates
                </div>

            </div>


            <!-- CONVERTED -->

            <div class="stat-card converted">

                <div class="stat-title">
                    Converted
                </div>


                <div class="stat-number">

                    <asp:Label
                        ID="lblConverted"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </div>


                <div class="stat-subtitle">
                    Successfully converted
                </div>

            </div>


            <!-- STUDENTS -->

            <div class="stat-card students">

                <div class="stat-title">
                    Registered Students
                </div>


                <div class="stat-number">

                    <asp:Label
                        ID="lblStudents"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </div>


                <div class="stat-subtitle">
                    Total registrations
                </div>

            </div>


        </div>


        <!-- =====================================
             CALLER PERFORMANCE
        ====================================== -->

        <div class="summary-card">


            <div class="summary-header">

                <h2>
                    Caller Performance
                </h2>


                <p>
                    Lead activity according to the selected report.
                </p>

            </div>


            <div class="summary-wrapper">


                <asp:GridView
                    ID="gvCallerSummary"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="summary-grid"
                    GridLines="None"
                    EmptyDataText="No caller data found.">


                    <Columns>


                        <asp:BoundField
                            DataField="CallerName"
                            HeaderText="Caller" />


                        <asp:BoundField
                            DataField="Total"
                            HeaderText="Total" />


                        <asp:BoundField
                            DataField="Assigned"
                            HeaderText="Assigned" />


                        <asp:BoundField
                            DataField="FollowUp"
                            HeaderText="Follow Up" />


                        <asp:BoundField
                            DataField="Working"
                            HeaderText="Working" />


                        <asp:BoundField
                            DataField="Interested"
                            HeaderText="Interested" />


                        <asp:BoundField
                            DataField="NotInterested"
                            HeaderText="Not Interested" />


                        <asp:BoundField
                            DataField="Converted"
                            HeaderText="Converted" />


                    </Columns>


                </asp:GridView>


            </div>

        </div>


    </div>

</asp:Content>
