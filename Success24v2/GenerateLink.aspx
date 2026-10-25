<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="GenerateLink.aspx.cs" Inherits="Success24v2.GenerateLink" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <title>Generate Success Story Link</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6fb;
            margin: 0;
            padding: 30px 15px;
        }

        .generate-link-container {
            max-width: 700px;
            margin: 30px auto;
            padding: 28px;
            background: #fff;
            border-radius: 14px;
            box-shadow: 0 8px 28px rgba(0,0,0,.08);
        }

        h2 { margin-top: 0; color: #1f2937; }

        .btn {
            padding: 12px 20px;
            border: 0;
            border-radius: 8px;
            background: #4f46e5;
            color: white;
            cursor: pointer;
            font-size: 15px;
        }

        .message {
            display: block;
            margin-top: 16px;
            overflow-wrap: anywhere;
        }

        .success { color: #15803d; }
        .error { color: #b91c1c; }

        .link-box {
            margin-top: 18px;
            padding: 14px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            overflow-wrap: anywhere;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="generate-link-container">            <h2>Generate One-Time Link</h2>

            <p>
                Generate a unique link for sharing the Success Story page.
                Each generated link can be used once.
            </p>

            <asp:Button
                ID="btnGenerate"
                runat="server"
                Text="Generate Link"
                CssClass="btn"
                OnClick="btnGenerate_Click" />

            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="message" />

            <asp:Panel
                ID="pnlGenerated"
                runat="server"
                Visible="false"
                CssClass="link-box">

                <strong>Generated Link:</strong><br />

                <asp:HyperLink
                    ID="lnkGenerated"
                    runat="server"
                    Target="_blank" />
                <button type="button"
                    class="btn"
                    style="margin-top: 12px;"
                    onclick="copyGeneratedLink()">
                    Copy Link
                </button>
            </asp:Panel>
        </div>

  
<script>
    function copyGeneratedLink() {
        var linkElement = document.getElementById(
            '<%= lnkGenerated.ClientID %>'
        );

        if (!linkElement || !linkElement.href) {
            return;
        }

        var link = linkElement.href;

        function afterCopy() {
            // Sirf screen se hide hoga, token expire nahi hoga
            document.getElementById('<%= pnlGenerated.ClientID %>').style.display = 'none';

            alert('Link copied successfully!');
        }

        if (navigator.clipboard && window.isSecureContext) {
            navigator.clipboard.writeText(link)
                .then(afterCopy)
                .catch(function () {
                    window.prompt('Copy this link:', link);
                });
        } else {
            window.prompt('Copy this link:', link);
        }
    }
</script>

</asp:Content>
