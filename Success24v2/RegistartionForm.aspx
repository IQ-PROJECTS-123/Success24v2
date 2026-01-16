<%@ Page Title="Student Registration" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="RegistartionForm.aspx.cs" Inherits="Success24v2.RegistartionFormaspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-6xl mx-auto my-12 px-4">
        <div class="bg-white shadow-2xl rounded-xl overflow-hidden border border-orange-200">
            <!-- Header -->
            <div class="bg-gradient-to-r from-orange-500 to-red-500 text-white text-center py-6">
                <h2 class="text-3xl font-bold">Student Registration Form</h2>
                <p class="text-sm opacity-90">Build Your Career</p>
            </div>
            <!-- Form Body -->
            <div class="p-8 grid md:grid-cols-2 gap-5">
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="First Name *"></asp:TextBox>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="Last Name *"></asp:TextBox>
                <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="w-full border rounded px-3 py-2"></asp:TextBox>
                <asp:TextBox ID="txtBatch" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="Batch No"></asp:TextBox>
                <asp:TextBox ID="txtQualification" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="Qualification"></asp:TextBox>
                <asp:TextBox ID="txtPassout" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="Passout Year"></asp:TextBox>
                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="w-full border rounded px-3 py-2">
                    <asp:ListItem>Select Course</asp:ListItem>
                    <asp:ListItem>Web Development</asp:ListItem>
                    <asp:ListItem>Data Science</asp:ListItem>
                    <asp:ListItem>DevOps</asp:ListItem>
                    <asp:ListItem>AI & ML</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtJoinDate" runat="server" TextMode="Date" CssClass="w-full border rounded px-3 py-2"></asp:TextBox>
                <asp:TextBox ID="txtPrimaryMobile" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="Primary Mobile *"></asp:TextBox>
                <asp:TextBox ID="txtSecondaryMobile" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="Secondary Mobile"></asp:TextBox>
                <asp:TextBox ID="txtWhatsapp" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="WhatsApp No"></asp:TextBox>
                <asp:TextBox ID="txtParentMobile" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="Parent Mobile"></asp:TextBox>
                <asp:TextBox ID="txtEmail1" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="Primary Email *"></asp:TextBox>
                <asp:TextBox ID="txtEmail2" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="Secondary Email"></asp:TextBox>
                <asp:TextBox ID="txtAadhar" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="Aadhar Card No"></asp:TextBox>
                <asp:TextBox ID="txtPAN" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="PAN Card No"></asp:TextBox>
                <asp:TextBox ID="txtVoter" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="Voter ID No"></asp:TextBox>
                <asp:TextBox ID="txtPassport" runat="server" CssClass="w-full border rounded px-3 py-2" placeholder="Passport No"></asp:TextBox>
                <asp:DropDownList ID="ddlReference" runat="server" CssClass="w-full border rounded px-3 py-2">
                    <asp:ListItem>Reference Name</asp:ListItem>
                    <asp:ListItem>Shivani Ranaut</asp:ListItem>
                    <asp:ListItem>Radha shukla</asp:ListItem>
                    <asp:ListItem>Priya</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtCurrentAddress" runat="server" TextMode="MultiLine" CssClass="md:col-span-2 w-full border rounded px-3 py-2" placeholder="Current Address"></asp:TextBox>
                <asp:TextBox ID="txtPermanentAddress" runat="server" TextMode="MultiLine" CssClass="md:col-span-2 w-full border rounded px-3 py-2" placeholder="Permanent Address"></asp:TextBox>
            </div>
            <!-- Buttons -->
            <div class="flex flex-wrap justify-center gap-4 pb-8 mt-6">
                <!-- Submit -->
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="bg-gradient-to-r from-orange-500 to-red-500 text-white px-8 py-2 rounded-lg shadow-md hover:shadow-xl hover:scale-105 transition duration-300 ease-in-out" OnClick="btnSubmit_Click" />
                <!-- Edit -->
                <asp:Button ID="Button1" runat="server" Text="Edit" CssClass="bg-gradient-to-r from-blue-500 to-indigo-600 text-white px-8 py-2 rounded-lg shadow-md hover:shadow-xl hover:scale-105 transition duration-300 ease-in-out" OnClick="btnEdit_Click" />
                <!-- Reset -->
                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="bg-gray-400 text-white px-8 py-2 rounded-lg shadow-md hover:bg-gray-500 hover:shadow-xl hover:scale-105 transition duration-300 ease-in-out" OnClientClick="this.form.reset();return false;" />
            </div>
        </div>
    </div>
</asp:Content>
