<%@ Page Title="Student Registration" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="RegistartionForm.aspx.cs" Inherits="Success24v2.RegistartionFormaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 1.25rem;
        }
        .form-label {
            font-weight: 600;
            font-size: 0.85rem;
            color: #4b5563;
            margin-bottom: 4px;
        }
        .input-box {
            width: 100%;
            border: 1px solid #cccccc;
            border-radius: 6px;
            padding: 8px 12px;
            background-color: #ffffff;
            font-size: 14px;
            color: #333;
            outline: none;
        }
        .input-box:focus {
            border-color: #f97316;
            box-shadow: 0 0 0 2px rgba(249, 115, 22, 0.1);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-6xl mx-auto my-12 px-4">
        <div class="bg-white shadow-2xl rounded-xl overflow-hidden border border-orange-200">
            <div class="bg-gradient-to-r from-orange-500 to-red-500 text-white text-center py-6">
                <h2 class="text-3xl font-bold">Student Registration Form</h2>
                <p class="text-sm opacity-90">Please provide accurate information</p>
            </div>

            <div class="p-8">
                <div class="grid md:grid-cols-2 gap-x-6">
                    
                    <div class="form-group">
                        <label class="form-label">First Name *</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Last Name *</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Date of Birth</label>
                        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="input-box"></asp:TextBox>
                    </div>

                   <%-- <div class="form-group">
                        <label class="form-label">Batch No</label>
                        <asp:TextBox ID="txtBatch" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>--%>

                    <div class="form-group">
                        <label class="form-label">Qualification</label>
                        <asp:TextBox ID="txtQualification" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Passout Year</label>
                        <asp:TextBox ID="txtPassout" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Course</label>
                        <asp:DropDownList ID="ddlCourse" runat="server" CssClass="input-box">
                            <asp:ListItem>Select Course</asp:ListItem>
                            <asp:ListItem>Web Development</asp:ListItem>
                            <asp:ListItem>Data Science</asp:ListItem>
                            <asp:ListItem>DevOps</asp:ListItem>
                            <asp:ListItem>AI & ML</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Joining Date</label>
                        <asp:TextBox ID="txtJoinDate" runat="server" TextMode="Date" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Primary Mobile *</label>
                        <asp:TextBox ID="txtPrimaryMobile" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Secondary Mobile</label>
                        <asp:TextBox ID="txtSecondaryMobile" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">WhatsApp No</label>
                        <asp:TextBox ID="txtWhatsapp" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Parent Mobile</label>
                        <asp:TextBox ID="txtParentMobile" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Primary Email *</label>
                        <asp:TextBox ID="txtEmail1" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Secondary Email</label>
                        <asp:TextBox ID="txtEmail2" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Aadhar Card No</label>
                        <asp:TextBox ID="txtAadhar" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">PAN Card No</label>
                        <asp:TextBox ID="txtPAN" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Voter ID No</label>
                        <asp:TextBox ID="txtVoter" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Passport No</label>
                        <asp:TextBox ID="txtPassport" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Reference Name</label>
                        <asp:TextBox ID="txtReference" runat="server" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="md:col-span-2 form-group">
                        <label class="form-label">Current Address</label>
                        <asp:TextBox ID="txtCurrentAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="input-box"></asp:TextBox>
                    </div>

                    <div class="md:col-span-2 form-group">
                        <label class="form-label">Permanent Address</label>
                        <asp:TextBox ID="txtPermanentAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="input-box"></asp:TextBox>
                    </div>
                </div>

                <div class="flex flex-wrap justify-center gap-4 mt-8">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="bg-orange-500 text-white px-8 py-2 rounded-lg font-bold hover:bg-orange-600 transition cursor-pointer" OnClick="btnSubmit_Click" />
                    <asp:Button ID="Button1" runat="server" Text="Update" CssClass="bg-blue-600 text-white px-8 py-2 rounded-lg font-bold hover:bg-blue-700 transition cursor-pointer" OnClick="btnEdit_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="bg-gray-400 text-white px-8 py-2 rounded-lg font-bold hover:bg-gray-500 transition cursor-pointer" OnClientClick="this.form.reset();return false;" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>