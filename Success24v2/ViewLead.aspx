<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewLead.aspx.cs" Inherits="Success24v2.ViewLead" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>
        .view-page {
            max-width: 850px;
            margin: 35px auto;
            padding: 0 18px;
        }

        .view-card {
            background: #fff;
            border: 1px solid #eceef2;
            border-radius: 12px;
            padding: 28px;
            box-shadow: 0 5px 20px rgba(31,41,55,.07);
        }

        .view-title {
            margin: 0 0 8px;
            color: #172033;
            font-size: 27px;
        }

        .view-subtitle {
            margin: 0 0 25px;
            color: #6b7280;
            font-size: 14px;
        }

        .view-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
        }

        .view-field {
            padding: 15px;
            border: 1px solid #eef0f3;
            border-radius: 8px;
            background: #fafbfc;
            min-width: 0;
        }

        .view-label {
            display: block;
            margin-bottom: 8px;
            color: #6b7280;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .view-value {
            display: block;
            color: #172033;
            font-size: 14px;
            font-weight: 600;
            overflow-wrap: anywhere;
        }

        .view-actions {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }

        .view-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 42px;
            padding: 0 20px;
            border-radius: 7px;
            text-decoration: none !important;
            font-size: 13px;
            font-weight: 600;
        }

        .view-edit {
            background: linear-gradient(90deg, #ff6411, #ef2d32);
            color: #fff !important;
        }

        .view-back {
            background: #f1f5f9;
            color: #475569 !important;
            border: 1px solid #cbd5e1;
        }

        @media(max-width: 600px) {
            .view-card { padding: 20px; }
            .view-grid { grid-template-columns: 1fr; }
            .view-title { font-size: 23px; }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="view-page">
        <div class="view-card">
            <h1 class="view-title">Lead Details</h1>
            <p class="view-subtitle">View the complete information for this lead.</p>

            <div class="view-grid">
                <div class="view-field">
                    <span class="view-label">Lead ID</span>
                    <asp:Label ID="lblID" runat="server" CssClass="view-value" />
                </div>

                <div class="view-field">
                    <span class="view-label">Full Name</span>
                    <asp:Label ID="lblName" runat="server" CssClass="view-value" />
                </div>

                <div class="view-field">
                    <span class="view-label">Email</span>
                    <asp:Label ID="lblEmail" runat="server" CssClass="view-value" />
                </div>

                <div class="view-field">
                    <span class="view-label">Phone</span>
                    <asp:Label ID="lblPhone" runat="server" CssClass="view-value" />
                </div>

                <div class="view-field">
                    <span class="view-label">Qualification</span>
                    <asp:Label ID="lblQualification" runat="server" CssClass="view-value" />
                </div>

                <div class="view-field">
                    <span class="view-label">Stream</span>
                    <asp:Label ID="lblStream" runat="server" CssClass="view-value" />
                </div>

                <div class="view-field">
                    <span class="view-label">Passing Year</span>
                    <asp:Label ID="lblPassingYear" runat="server" CssClass="view-value" />
                </div>

                <div class="view-field">
                    <span class="view-label">Status</span>
                    <asp:Label ID="lblStatus" runat="server" CssClass="view-value" />
                </div>

                <div class="view-field">
                    <span class="view-label">Assigned To</span>
                    <asp:Label ID="lblAssignTo" runat="server" CssClass="view-value" />
                </div>
            </div>

            <div class="view-actions">
                <asp:HyperLink ID="lnkEdit" runat="server"
                    Text="Edit Lead" CssClass="view-btn view-edit" />

                <asp:HyperLink ID="lnkBack" runat="server"
                    NavigateUrl="~/LeadManagement.aspx"
                    Text="Back to Leads" CssClass="view-btn view-back" />
            </div>
        </div>
    </div>

</asp:Content>
