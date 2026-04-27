<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAdmin.aspx.cs" Inherits="Success24v2.CreateAdmin" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Setup Admin</title>
    <style>
        body { font-family: Arial; padding: 40px; background:#fff7ed; }
        .box { background:#fff; padding:30px; border-radius:12px; max-width:500px; margin:auto; }
        .btn { padding:12px 20px; background:#ea580c; color:#fff; border:none; border-radius:6px; cursor:pointer; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h2>Admin Setup</h2>
            <p>This will create default admin (only once)</p>

            <asp:Button ID="btnCreateAdmin" runat="server" Text="Create Admin" CssClass="btn" OnClick="btnCreateAdmin_Click" />

            <br /><br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>