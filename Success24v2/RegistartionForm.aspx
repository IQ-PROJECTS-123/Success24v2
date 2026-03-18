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

        .error-msg {
            color: red;
            font-size: 0.75rem;
            margin-top: 2px;
        }

        .photo-preview-wrap img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 10px;
            border: 2px solid #f97316;
            display: block;
        }

        .created-badge {
            background: #fff7ed;
            border: 1px solid #fed7aa;
            border-radius: 8px;
            padding: 10px 16px;
            font-size: 13px;
            color: #92400e;
            margin-bottom: 20px;
            display: inline-block;
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

                <%-- Show form filled date when editing --%>
                <asp:Panel ID="pnlCreatedOn" runat="server" Visible="false">
                    <div class="created-badge">
                        🕒 Form Filled On: <strong>
                            <asp:Label ID="lblCreatedOn" runat="server"></asp:Label></strong>
                    </div>
                </asp:Panel>

                <div class="grid md:grid-cols-2 gap-x-6">

                    <div class="form-group">
                        <label class="form-label">First Name *</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                            ControlToValidate="txtFirstName" ErrorMessage="First Name is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">Last Name *</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                            ControlToValidate="txtLastName" ErrorMessage="Last Name is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">Date of Birth</label>
                        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDOB" runat="server"
                            ControlToValidate="txtDOB" ErrorMessage="Date of Birth is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">Qualification *</label>
                        <asp:TextBox ID="txtQualification" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQualification" runat="server"
                            ControlToValidate="txtQualification" ErrorMessage="Qualification is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">Passout Year *</label>
                        <asp:TextBox ID="txtPassout" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassout" runat="server"
                            ControlToValidate="txtPassout" ErrorMessage="Passout Year is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <%-- Batch No — Admin Only, hidden from students --%>
                    <asp:Panel ID="pnlBatchNo" runat="server" Visible="false">
                        <div class="form-group">
                            <label class="form-label">
                                Batch No
                                <span style="font-size: 10px; background: #fff4ec; color: #c2560e; border: 1px solid rgba(249,115,22,0.3); border-radius: 4px; padding: 1px 6px; margin-left: 6px; font-weight: 600;">ADMIN ONLY</span>
                            </label>
                            <asp:TextBox ID="txtBatch" runat="server" CssClass="input-box" placeholder="e.g. 101"></asp:TextBox>
                        </div>
                    </asp:Panel>

                    <div class="form-group">
                        <label class="form-label">Course *</label>
                        <asp:DropDownList ID="ddlCourse" runat="server" CssClass="input-box">
                            <asp:ListItem Value="">Select Course</asp:ListItem>
                            <asp:ListItem>Web Development</asp:ListItem>
                            <asp:ListItem>Data Science</asp:ListItem>
                            <asp:ListItem>DevOps</asp:ListItem>
                            <asp:ListItem>AI & ML</asp:ListItem>
                            <asp:ListItem>Cyber Security</asp:ListItem>
                            <asp:ListItem>Quality Assurance</asp:ListItem>
                            <asp:ListItem>SharePoint 2019</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCourse" runat="server"
                            ControlToValidate="ddlCourse" InitialValue=""
                            ErrorMessage="Please select a Course."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">Primary Mobile *</label>
                        <asp:TextBox ID="txtPrimaryMobile" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPrimaryMobile" runat="server"
                            ControlToValidate="txtPrimaryMobile" ErrorMessage="Primary Mobile is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">Secondary Mobile</label>
                        <asp:TextBox ID="txtSecondaryMobile" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSecondaryMobile" runat="server"
                            ControlToValidate="txtSecondaryMobile" ErrorMessage="Secondary Mobile is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">WhatsApp No *</label>
                        <asp:TextBox ID="txtWhatsapp" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvWhatsapp" runat="server"
                            ControlToValidate="txtWhatsapp" ErrorMessage="WhatsApp No is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">Parent Mobile *</label>
                        <asp:TextBox ID="txtParentMobile" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvParentMobile" runat="server"
                            ControlToValidate="txtParentMobile" ErrorMessage="Parent Mobile is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">Father Name *</label>
                        <asp:TextBox ID="txtFatherName" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFatherName" runat="server"
                            ControlToValidate="txtFatherName" ErrorMessage="Father Name is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>


                    <div class="form-group">
                        <label class="form-label">Primary Email *</label>
                        <asp:TextBox ID="txtEmail1" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail1" runat="server"
                            ControlToValidate="txtEmail1" ErrorMessage="Primary Email is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">Secondary Email</label>
                        <asp:TextBox ID="txtEmail2" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail2" runat="server"
                            ControlToValidate="txtEmail2" ErrorMessage="Secondary Email is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">Aadhar Card No *</label>
                        <asp:TextBox ID="txtAadhar" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAadhar" runat="server"
                            ControlToValidate="txtAadhar" ErrorMessage="Aadhar Card No is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">PAN Card No *</label>
                        <asp:TextBox ID="txtPAN" runat="server" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPAN" runat="server"
                            ControlToValidate="txtPAN" ErrorMessage="PAN Card No is required."
                            CssClass="error-msg" Display="Dynamic" />
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

                    <%-- Photo Upload --%>
                    <div class="form-group">
                        <label class="form-label">Student Photo *</label>
                        <asp:Panel ID="pnlExistingPhoto" runat="server" Visible="false">
                            <div style="display: flex; align-items: center; gap: 16px; margin-bottom: 10px; background: #fff7ed; border: 1px solid #fed7aa; border-radius: 10px; padding: 12px;">
                                <asp:Image ID="imgPreview" runat="server"
                                    Style="width: 80px; height: 80px; object-fit: cover; border-radius: 10px; border: 2px solid #f97316;" />
                                <div>
                                    <p style="font-size: 12px; color: #6b7280; margin: 0 0 8px;">Current photo on file</p>
                                    <asp:Button ID="btnDeletePhoto" runat="server" Text="🗑️ Delete Photo"
                                        CssClass="bg-red-500 text-white px-4 py-1 rounded-lg text-sm font-bold hover:bg-red-600 cursor-pointer"
                                        OnClick="btnDeletePhoto_Click"
                                        OnClientClick="return confirm('Delete this photo permanently?');"
                                        CausesValidation="false" />
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlUploadNew" runat="server" Visible="true">
                            <asp:FileUpload ID="fuPhoto" runat="server" CssClass="input-box" accept="image/*" />
                            <asp:RequiredFieldValidator ID="rfvPhoto" runat="server"
                                ControlToValidate="fuPhoto"
                                ErrorMessage="Please upload a photo."
                                CssClass="error-msg" Display="Dynamic" />
                            <p style="font-size: 11px; color: #9ca3af; margin-top: 4px;">Accepted: JPG, PNG, GIF — Max 2MB</p>
                        </asp:Panel>
                    </div>

                    <div class="md:col-span-2 form-group">
                        <label class="form-label">Current Address *</label>
                        <asp:TextBox ID="txtCurrentAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCurrentAddress" runat="server"
                            ControlToValidate="txtCurrentAddress" ErrorMessage="Current Address is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                    <div class="md:col-span-2 form-group">
                        <label class="form-label">Permanent Address *</label>
                        <asp:TextBox ID="txtPermanentAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="input-box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPermanentAddress" runat="server"
                            ControlToValidate="txtPermanentAddress" ErrorMessage="Permanent Address is required."
                            CssClass="error-msg" Display="Dynamic" />
                    </div>

                </div>

                <div class="flex flex-wrap justify-center gap-4 mt-8">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                        CssClass="bg-orange-500 text-white px-8 py-2 rounded-lg font-bold hover:bg-orange-600 transition cursor-pointer"
                        OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
