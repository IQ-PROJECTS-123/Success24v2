<%@ Page Title="Student Login" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Success24v2.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page-bg{background:linear-gradient(135deg,#fff7ed 0%,#ffedd5 45%,#fff 100%);min-height:100vh;padding:50px 0;}
        .auth-card{max-width:500px;margin:0 auto;background:#fff;border-radius:24px;padding:36px;box-shadow:0 25px 60px rgba(234,88,12,.12);border:1px solid #fed7aa;}
        .brand-badge{display:inline-block;background:#fff7ed;color:#ea580c;border:1px solid #fdba74;padding:8px 14px;border-radius:999px;font-weight:700;font-size:12px;letter-spacing:.08em;text-transform:uppercase;}
        .auth-title{font-size:34px;font-weight:800;color:#7c2d12;line-height:1.2;margin:14px 0 10px;}
        .auth-sub{color:#9a3412;font-size:15px;line-height:1.7;margin-bottom:22px;}
        .input-box{width:100%;height:54px;border:1px solid #fdba74;border-radius:14px;padding:0 16px;font-size:15px;background:#fff;transition:.25s;}
        .input-box:focus{outline:none;border-color:#f97316;box-shadow:0 0 0 4px rgba(249,115,22,.12);}
        .btn-main{width:100%;height:56px;border:none;border-radius:14px;background:linear-gradient(135deg,#f97316,#ea580c);color:#fff;font-weight:800;font-size:16px;box-shadow:0 18px 32px rgba(249,115,22,.22);}
        .msg{display:block;margin-top:14px;padding:12px 14px;border-radius:12px;font-size:14px;}
        .msg-error{background:#fff1f2;color:#be123c;border:1px solid #fecdd3;}
        .label{font-weight:700;color:#7c2d12;margin-bottom:8px;display:block;}
        .muted-link{color:#ea580c;font-weight:700;text-decoration:none;}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-bg">
        <div class="container">
            <div class="auth-card">
                <span class="brand-badge">Success24 Student Access</span>
                <h1 class="auth-title">Welcome Back</h1>
                <p class="auth-sub">Login using your registered mobile number or email address and continue your application.</p>

                <div class="mb-3">
                    <label class="label">Email or Mobile Number</label>
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="input-box" placeholder="Enter email or mobile number"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Login to Continue" CssClass="btn-main" OnClick="btnLogin_Click" />

                <asp:Label ID="lblMessage" runat="server"></asp:Label>

                <div class="text-center mt-4" style="color:#9a3412;">
                    New student?
                    <a href="Signup.aspx" class="muted-link">Create account</a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>