<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="MyLeads.aspx.cs" Inherits="Success24v2.MyLeads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #f5f7fb;
            font-family: Arial, Helvetica, sans-serif;
            color: #1f2937;
        }

        .container {
            width: 92%;
            max-width: 1500px;
            margin: 30px auto;
        }

      .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
      }

        .btn-logout {
            background: #dc2626;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
        }

        .btn-logout:hover {
            background: #b91c1c;
        }

        .welcome {
            color: #6b7280;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 25px;
        }

        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,.06);
        }

        .stat-title {
            font-size: 13px;
            color: #6b7280;
            margin-bottom: 10px;
        }

        .stat-number {
            font-size: 27px;
            font-weight: bold;
        }

        .card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,.06);
            overflow: hidden;
        }

        .card-header {
            padding: 20px;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .card-header h2 {
            margin: 0;
            font-size: 20px;
        }

        .grid-wrapper {
            overflow-x: auto;
        }

        .lead-grid {
            width: 100%;
            min-width: 1100px;
            border-collapse: collapse;
        }

        .lead-grid th {
            padding: 13px;
            background: #f9fafb;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
            font-size: 13px;
        }

        .lead-grid td {
            padding: 13px;
            border-bottom: 1px solid #eee;
            font-size: 14px;
        }

        .lead-grid tr:hover td {
            background: #f9fbff;
        }

        .status {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .assigned {
            background: #fef3c7;
            color: #92400e;
        }

        .followup {
            background: #ede9fe;
            color: #6d28d9;
        }

        .btn-call {
            display: inline-block;
            background: #2563eb;
            color: white;
            padding: 7px 14px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 13px;
        }

        .btn-call:hover {
            background: #1d4ed8;
        }

        @media(max-width:800px) {

            .stats {
                grid-template-columns: 1fr;
            }

        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
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


    <asp:Button
        ID="btnLogout"
        runat="server"
        Text="Logout"
        CssClass="btn-logout"
        OnClick="btnLogout_Click" />

</div>

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


        <div class="stat-card">

            <div class="stat-title">
                Follow Ups
            </div>

            <div class="stat-number">

                <asp:Label
                    ID="lblFollowUp"
                    runat="server"
                    Text="0">
                </asp:Label>

            </div>

        </div>

    </div>


    <!-- Leads -->

    <div class="card">

        <div class="card-header">

            <h2>My Assigned Leads</h2>

        </div>


        <div class="grid-wrapper">

            <asp:GridView
                ID="gvMyLeads"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="lead-grid"
                GridLines="None"
                AllowPaging="True"
                PageSize="10"
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

    </div>


</div>

    </div>
</asp:Content>
