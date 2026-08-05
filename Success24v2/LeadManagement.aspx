<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="LeadManagement.aspx.cs" Inherits="Success24v2.LeadManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            background: #f5f7fb;
            font-family: Arial, Helvetica, sans-serif;
            color: #333;
        }

        .page-container {
            width: 95%;
            max-width: 1500px;
            margin: 35px auto;
        }

        .page-header {
            margin-bottom: 25px;
        }

        .page-header h1 {
            margin: 0 0 8px;
            font-size: 28px;
            color: #1f2937;
        }

        .page-header p {
            margin: 0;
            color: #6b7280;
        }
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .btn-logout {
            background: #dc2626;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-logout:hover {
            background: #b91c1c;
        }

        /* ==========================
           Statistics
        ========================== */

        .stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 25px;
        }

        .stat-card {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,.06);
        }

        .stat-title {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 10px;
        }

        .stat-number {
            font-size: 27px;
            font-weight: bold;
            color: #111827;
        }
        .assignment-card {
    background: #fff;
    padding: 22px;
    margin-bottom: 25px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,.06);
}

.assignment-title {
    font-size: 20px;
    font-weight: 600;
    margin-bottom: 18px;
    color: #1f2937;
}

.assignment-controls {
    display: flex;
    gap: 20px;
    align-items: end;
    flex-wrap: wrap;
}

.form-group {
    display: flex;
    flex-direction: column;
    gap: 7px;
}

.form-group label {
    font-size: 13px;
    font-weight: 600;
    color: #4b5563;
}

.form-control {
    width: 230px;
    height: 42px;
    padding: 8px 12px;
    border: 1px solid #d1d5db;
    border-radius: 6px;
    outline: none;
}

.form-control:focus {
    border-color: #2563eb;
}

.btn-assign {
    height: 42px;
    padding: 0 22px;
    border: none;
    border-radius: 6px;
    background: #16a34a;
    color: white;
    font-weight: 600;
    cursor: pointer;
}

.btn-assign:hover {
    background: #15803d;
}

.success-message {
    display: block;
    margin-top: 15px;
    color: #15803d;
    font-weight: 600;
}

.error-message {
    display: block;
    margin-top: 15px;
    color: #dc2626;
    font-weight: 600;
}

        /* ==========================
           Main card
        ========================== */

        .card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,.06);
            overflow: hidden;
        }

        .card-header {
            padding: 20px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
        }

        .card-header h2 {
            margin: 0;
            font-size: 20px;
        }

        .search-box {
            width: 300px;
            padding: 10px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            outline: none;
        }

        .search-box:focus {
            border-color: #2563eb;
        }

        .btn-search {
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            background: #2563eb;
            color: white;
            cursor: pointer;
        }

        .btn-search:hover {
            background: #1d4ed8;
        }

        /* ==========================
           GridView
        ========================== */

        .grid-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .lead-grid {
            width: 100%;
            border-collapse: collapse;
            min-width: 1100px;
        }

        .lead-grid th {
            background: #f9fafb;
            padding: 14px 12px;
            text-align: left;
            font-size: 13px;
            color: #374151;
            border-bottom: 1px solid #e5e7eb;
            white-space: nowrap;
        }

        .lead-grid td {
            padding: 14px 12px;
            font-size: 14px;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
        }

        .lead-grid tr:hover td {
            background: #f9fbff;
        }

        /* ==========================
           Status
        ========================== */

        .status {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-new {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .status-assigned {
            background: #fef3c7;
            color: #92400e;
        }

        .status-followup {
            background: #ede9fe;
            color: #6d28d9;
        }

        .status-converted {
            background: #dcfce7;
            color: #166534;
        }

        /* ==========================
           Pager
        ========================== */

        .lead-grid table {
            margin: 15px auto;
        }

        .lead-grid table td {
            border: none;
            padding: 4px;
        }

        .lead-grid table a,
        .lead-grid table span {
            display: inline-block;
            padding: 7px 11px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-decoration: none;
        }

        .lead-grid table span {
            background: #2563eb;
            color: white;
            border-color: #2563eb;
        }

        /* ==========================
           Responsive
        ========================== */

        @media(max-width:900px) {

            .stats {
                grid-template-columns: repeat(2,1fr);
            }

            .card-header {
                flex-direction: column;
                align-items: stretch;
            }

            .search-box {
                width: 100%;
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

        <h1>Lead Management</h1>

        <p>
            Manage and monitor all leads from one place.
        </p>

         <asp:Button
        ID="btnLogout"
        runat="server"
        Text="Logout"
        CssClass="btn-logout"
        OnClick="btnLogout_Click" />


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
