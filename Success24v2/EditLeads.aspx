<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditLeads.aspx.cs" Inherits="Success24v2.EditLeads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>
        .edit-page {
            max-width: 850px;
            margin: 35px auto;
            padding: 0 18px;
            color: #1f2937;
        }

        .edit-card {
            background: #fff;
            border: 1px solid #eceef2;
            border-radius: 12px;
            padding: 28px;
            box-shadow: 0 5px 20px rgba(31,41,55,.07);
        }

        .edit-title {
            margin: 0 0 8px;
            font-size: 27px;
            color: #172033;
        }

        .edit-subtitle {
            margin: 0 0 25px;
            color: #6b7280;
            font-size: 14px;
        }

        .edit-form {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
        }

        .edit-field {
            display: flex;
            flex-direction: column;
            gap: 7px;
        }

        .edit-field label {
            font-size: 13px;
            font-weight: 600;
            color: #4b5563;
        }

        .edit-input {
            width: 100%;
            height: 43px;
            padding: 10px 12px;
            border: 1px solid #d6dae1;
            border-radius: 7px;
            box-sizing: border-box;
            outline: none;
        }

        .edit-input:focus {
            border-color: #ff6411;
            box-shadow: 0 0 0 3px rgba(255,100,17,.10);
        }

        .edit-actions {
            display: flex;
            gap: 10px;
            margin-top: 25px;
            flex-wrap: wrap;
        }

        .edit-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 42px;
            padding: 0 20px;
            border-radius: 7px;
            border: 1px solid transparent;
            font-weight: 600;
            font-size: 13px;
            cursor: pointer;
            text-decoration: none;
        }

        .save-btn {
            color: #fff;
            background: linear-gradient(90deg, #ff6411, #ef2d32);
        }

        .back-btn {
            color: #475569;
            background: #f1f5f9;
            border-color: #cbd5e1;
        }

        .edit-message {
            display: block;
            margin-top: 18px;
            font-size: 13px;
            font-weight: 600;
        }

        .edit-success { color: #15803d; }
        .edit-error { color: #dc2626; }

        @media(max-width: 600px) {
            .edit-card { padding: 20px; }
            .edit-form { grid-template-columns: 1fr; }
            .edit-title { font-size: 23px; }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="edit-page">
        <div class="edit-card">
            <h1 class="edit-title">Edit Lead</h1>
            <p class="edit-subtitle">Update the selected lead's information.</p>

            <asp:Label ID="lblMessage" runat="server"
                CssClass="edit-message" />

            <div class="edit-form">
                <div class="edit-field">
                    <label>Full Name</label>
                    <asp:TextBox ID="txtName" runat="server"
                        CssClass="edit-input" MaxLength="250" />
                </div>

                <div class="edit-field">
                    <label>Email</label>
                    <asp:TextBox ID="txtEmail" runat="server"
                        CssClass="edit-input" MaxLength="250"
                        TextMode="Email" />
                </div>

                <div class="edit-field">
                    <label>Phone</label>
                    <asp:TextBox ID="txtPhone" runat="server"
                        CssClass="edit-input" MaxLength="10" />
                </div>

                <div class="edit-field">
                    <label>Qualification</label>
                    <asp:TextBox ID="txtQualification" runat="server"
                        CssClass="edit-input" MaxLength="250" />
                </div>

                <div class="edit-field">
                    <label>Stream</label>
                    <asp:TextBox ID="txtStream" runat="server"
                        CssClass="edit-input" MaxLength="250" />
                </div>

                <div class="edit-field">
                    <label>Passing Year</label>
                    <asp:TextBox ID="txtPassingYear" runat="server"
                        CssClass="edit-input" MaxLength="4" />
                </div>
            </div>

            <div class="edit-actions">
                <asp:Button ID="btnUpdate" runat="server"
                    Text="Save Changes"
                    CssClass="edit-btn save-btn"
                    OnClick="btnUpdate_Click" />

                <asp:HyperLink ID="lnkBack" runat="server"
                    NavigateUrl="~/LeadManagement.aspx"
                    Text="Cancel"
                    CssClass="edit-btn back-btn" />
            </div>
        </div>
    </div>

</asp:Content>
