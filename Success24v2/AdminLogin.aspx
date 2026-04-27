<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Success24v2.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page-bg{background:linear-gradient(135deg,#7c2d12 0%,#ea580c 45%,#fb923c 100%);min-height:100vh;padding:50px 0;}
        .auth-card{max-width:500px;margin:0 auto;background:#fff;border-radius:24px;padding:36px;box-shadow:0 30px 70px rgba(0,0,0,.18);}
        .badge{display:inline-block;background:#fff7ed;color:#ea580c;border:1px solid #fdba74;padding:8px 14px;border-radius:999px;font-weight:800;font-size:12px;text-transform:uppercase;}
        .title{font-size:34px;font-weight:900;color:#7c2d12;margin:14px 0 8px;}
        .sub{color:#9a3412;margin-bottom:20px;}
        .input-box{width:100%;height:54px;border:1px solid #fdba74;border-radius:14px;padding:0 16px;}
        .btn-main{width:100%;height:56px;border:none;border-radius:14px;background:linear-gradient(135deg,#f97316,#ea580c);color:#fff;font-weight:800;}
        .label{display:block;font-weight:700;color:#7c2d12;margin-bottom:8px;}
        .msg{display:block;margin-top:14px;padding:12px 14px;border-radius:12px;font-size:14px;}
        .msg-error{background:#fff1f2;color:#be123c;border:1px solid #fecdd3;}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-bg">
        <div class="container">
            <div class="auth-card">
                <span class="badge">Admin Secure Access</span>
                <h1 class="title">Admin Login</h1>
                <p class="sub">Review and verify student applications from one premium control panel.</p>

                <div class="mb-3">
                    <label class="label">Username</label>
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="input-box"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password"></asp:TextBox>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Admin Login" CssClass="btn-main" OnClick="btnLogin_Click" />
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>
        </div>
    </section>
</asp:Content>