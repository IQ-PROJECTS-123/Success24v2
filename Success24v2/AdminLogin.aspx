<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Success24v2.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .login-wrapper {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-box {
            background: white;
            border-radius: 16px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.12);
            padding: 48px 40px;
            width: 100%;
            max-width: 420px;
            border-top: 5px solid #f97316;
        }
        .login-title {
            font-size: 1.75rem;
            font-weight: 700;
            color: #1f2937;
            text-align: center;
            margin-bottom: 6px;
        }
        .login-subtitle {
            text-align: center;
            color: #6b7280;
            font-size: 0.875rem;
            margin-bottom: 32px;
        }
        .field-label {
            display: block;
            font-weight: 600;
            font-size: 0.8rem;
            color: #374151;
            margin-bottom: 6px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        .field-input {
            width: 100%;
            border: 1.5px solid #e5e7eb;
            border-radius: 8px;
            padding: 10px 14px;
            font-size: 14px;
            color: #111827;
            outline: none;
            transition: border-color 0.2s;
            margin-bottom: 20px;
            box-sizing: border-box;
        }
        .field-input:focus {
            border-color: #f97316;
            box-shadow: 0 0 0 3px rgba(249,115,22,0.1);
        }
        .btn-login {
            width: 100%;
            background: linear-gradient(135deg, #f97316, #ef4444);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: opacity 0.2s;
            letter-spacing: 0.03em;
        }
        .btn-login:hover { opacity: 0.9; }
        .error-box {
            background: #fef2f2;
            border: 1px solid #fca5a5;
            color: #dc2626;
            border-radius: 8px;
            padding: 10px 14px;
            font-size: 13px;
            margin-bottom: 20px;
            text-align: center;
        }
        .lock-icon {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 16px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-wrapper">
        <div class="login-box">
            <div class="lock-icon">🔐</div>
            <div class="login-title">Admin Panel</div>
            <div class="login-subtitle">Enter your credentials to continue</div>

            <asp:Panel ID="pnlError" runat="server" Visible="false">
                <div class="error-box">
                    ❌ Invalid username or password.
                </div>
            </asp:Panel>

            <label class="field-label">Username</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="field-input" placeholder="Enter username"></asp:TextBox>

            <label class="field-label">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="field-input" placeholder="Enter password"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server" Text="Login to Admin Panel"
                CssClass="btn-login" OnClick="btnLogin_Click" />
        </div>
    </div>
</asp:Content>