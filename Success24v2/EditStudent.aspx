<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditStudent.aspx.cs" Inherits="Success24v2.EditStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
          <style>
        .edit-page {
            max-width: 1250px;
            margin: 0 auto;
            padding: 28px;
            color: #172033;
            font-family: Inter, "Segoe UI", sans-serif;
        }

        .edit-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 18px;
            flex-wrap: wrap;
            margin-bottom: 25px;
        }

        .edit-eyebrow {
            color: #ea580c;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: 1.5px;
            text-transform: uppercase;
        }

        .edit-header h1 {
            margin: 7px 0;
            font-size: clamp(25px, 3vw, 34px);
            font-weight: 800;
            letter-spacing: -1px;
        }

        .edit-subtitle {
            color: #64748b;
            margin: 0;
            font-size: 14px;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 11px 16px;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            color: #334155;
            text-decoration: none;
            font-weight: 700;
            background: #fff;
        }

        .edit-card {
            background: #fff;
            border: 1px solid #e8edf3;
            border-radius: 18px;
            margin-bottom: 20px;
            overflow: hidden;
            box-shadow: 0 5px 22px rgba(15, 23, 42, .035);
        }

        .card-heading {
            padding: 21px 25px;
            border-bottom: 1px solid #edf1f5;
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .section-icon {
            width: 43px;
            height: 43px;
            border-radius: 12px;
            background: #fff1e8;
            color: #ea580c;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
            flex-shrink: 0;
        }

        .card-heading h2 {
            margin: 0 0 4px;
            font-size: 17px;
            font-weight: 800;
        }

        .card-heading p {
            margin: 0;
            color: #94a3b8;
            font-size: 12px;
        }

        .card-body {
            padding: 25px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 22px 20px;
        }

        .field {
            min-width: 0;
        }

        .field.full-width {
            grid-column: 1 / -1;
        }

        .field label {
            display: block;
            margin-bottom: 8px;
            font-size: 13px;
            color: #334155;
            font-weight: 700;
        }

        .field input,
        .field select,
        .field textarea {
            width: 100%;
            box-sizing: border-box;
            padding: 12px 13px;
            border: 1px solid #dce3eb;
            border-radius: 9px;
            background: #fff;
            color: #172033;
            font: inherit;
            font-size: 13px;
            outline: none;
            transition: border-color .2s, box-shadow .2s;
        }

        .field input:focus,
        .field select:focus,
        .field textarea:focus {
            border-color: #f97316;
            box-shadow: 0 0 0 3px rgba(249, 115, 22, .11);
        }

        .field textarea {
            min-height: 95px;
            resize: vertical;
        }

        .field input::placeholder,
        .field textarea::placeholder {
            color: #a0aab8;
        }

        .form-footer {
            position: sticky;
            bottom: 0;
            z-index: 2;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            background: rgba(255, 255, 255, .96);
            border: 1px solid #e8edf3;
            border-radius: 14px;
            padding: 16px 20px;
            margin-top: 24px;
            box-shadow: 0 -5px 20px rgba(15, 23, 42, .035);
        }

        .footer-note {
            color: #64748b;
            font-size: 12px;
        }

        .footer-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .btn-cancel,
        .btn-save {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            padding: 12px 19px;
            border-radius: 9px;
            font-size: 13px;
            font-weight: 800;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-cancel {
            border: 1px solid #dce3eb;
            color: #475569;
            background: #fff;
        }

        .btn-save {
            border: 0;
            color: #fff;
            background: linear-gradient(135deg, #f97316, #ea580c);
            box-shadow: 0 5px 12px rgba(234, 88, 12, .2);
        }

        .btn-save:hover {
            filter: brightness(.96);
        }

        .message {
            display: block;
            padding: 12px 15px;
            border-radius: 9px;
            margin-bottom: 18px;
            font-size: 13px;
            font-weight: 600;
        }

        .message:empty {
            display: none;
        }

        .message-success {
            background: #dcfce7;
            color: #166534;
        }

        .message-error {
            background: #fee2e2;
            color: #991b1b;
        }

        .student-id {
            display: inline-block;
            padding: 6px 10px;
            background: #f1f5f9;
            border-radius: 7px;
            color: #475569;
            font-size: 12px;
            font-weight: 800;
            margin-top: 8px;
        }

        @media (max-width: 900px) {
            .form-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 600px) {
            .edit-page {
                padding: 16px 12px;
            }

            .card-heading,
            .card-body {
                padding: 18px;
            }

            .form-grid {
                grid-template-columns: 1fr;
                gap: 17px;
            }

            .field.full-width {
                grid-column: auto;
            }

            .form-footer {
                align-items: stretch;
            }

            .footer-actions {
                width: 100%;
            }

            .footer-actions > * {
                flex: 1;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="edit-page">

        <div class="edit-header">
            <div>
                <div class="edit-eyebrow">Student Management</div>
                <h1>Edit Student Profile</h1>
                <p class="edit-subtitle">
                    Update student information, academic records and contact details.
                </p>
                <asp:Label ID="lblStudentId" runat="server" CssClass="student-id" />
            </div>

            <asp:HyperLink ID="lnkBack" runat="server"
                NavigateUrl="~/StudentDetails.aspx" CssClass="back-link">
                &#8592; Back to Students
            </asp:HyperLink>
        </div>

        <asp:Label ID="lblMessage" runat="server" EnableViewState="false" />

        <asp:ValidationSummary ID="vsEditStudent" runat="server"
            ValidationGroup="EditStudent"
            CssClass="message message-error"
            HeaderText="Please correct the following:" />

        <asp:Panel ID="pnlEditForm" runat="server">

            <section class="edit-card">
                <div class="card-heading">
                    <div class="section-icon">&#128100;</div>
                    <div>
                        <h2>Personal Information</h2>
                        <p>Basic identity and course details</p>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-grid">
                        <div class="field">
                            <label>First Name *</label>
                            <asp:TextBox ID="txtFirstName" runat="server"
                                MaxLength="100" placeholder="Enter first name" />
                            <asp:RequiredFieldValidator runat="server"
                                ControlToValidate="txtFirstName"
                                ValidationGroup="EditStudent"
                                ErrorMessage="First Name is required."
                                Display="None" />
                        </div>

                        <div class="field">
                            <label>Last Name</label>
                            <asp:TextBox ID="txtLastName" runat="server"
                                MaxLength="100" placeholder="Enter last name" />
                        </div>

                        <div class="field">
                            <label>Date of Birth</label>
                            <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" />
                        </div>

                        <div class="field">
                            <label>Course</label>
                            <asp:TextBox ID="txtCourse" runat="server"
                                MaxLength="150" placeholder="Enter course" />
                        </div>
                         <div class="field">
                             <label>Batch No</label>
                             <asp:TextBox ID="txtbatch" runat="server"
                                 MaxLength="4" placeholder="Enter Batch No" />
                         </div>
                        <div class="field">
                            <label>Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server"
                                TextMode="Email" MaxLength="200"
                                placeholder="student@example.com" />
                        </div>

                        <div class="field">
                            <label>Primary Mobile</label>
                            <asp:TextBox ID="txtMobile" runat="server"
                                MaxLength="20" placeholder="Enter mobile number" />
                        </div>
                    </div>
                </div>
            </section>

            <section class="edit-card">
                <div class="card-heading">
                    <div class="section-icon">&#127891;</div>
                    <div>
                        <h2>Academic Information</h2>
                        <p>Qualifications and passing years</p>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-grid">
                        <div class="field">
                            <label>Qualification</label>
                            <asp:TextBox ID="txtQualification" runat="server"
                                MaxLength="150" placeholder="e.g. B.Tech, BCA" />
                        </div>

                        <div class="field">
                            <label>Passing Year</label>
                            <asp:TextBox ID="txtPassoutYear" runat="server"
                                MaxLength="10" placeholder="e.g. 2026" />
                        </div>

                        <div class="field">
                            <label>Master's Qualification</label>
                            <asp:TextBox ID="txtMastersQualification" runat="server"
                                MaxLength="150" placeholder="e.g. MCA, MBA" />
                        </div>

                        <div class="field">
                            <label>Master's Passing Year</label>
                            <asp:TextBox ID="txtMastersPassoutYear" runat="server"
                                MaxLength="10" placeholder="e.g. 2028" />
                        </div>
                    </div>
                </div>
            </section>

            <section class="edit-card">
                <div class="card-heading">
                    <div class="section-icon">&#128106;</div>
                    <div>
                        <h2>Family & Guardian Details</h2>
                        <p>Parent and emergency contact information</p>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-grid">
                        <div class="field">
                            <label>Father's Name</label>
                            <asp:TextBox ID="txtFatherName" runat="server"
                                MaxLength="150" placeholder="Enter father's name" />
                        </div>

                        <div class="field">
                            <label>Guardian Name</label>
                            <asp:TextBox ID="txtGuardianName" runat="server"
                                MaxLength="150" placeholder="Enter guardian's name" />
                        </div>

                        <div class="field">
                            <label>Guardian Relationship</label>
                            <asp:TextBox ID="txtGuardianRelationship" runat="server"
                                MaxLength="100" placeholder="e.g. Father, Uncle" />
                        </div>

                        <div class="field">
                            <label>Parent Mobile Number</label>
                            <asp:TextBox ID="txtParentNo" runat="server"
                                MaxLength="20" placeholder="Enter parent mobile" />
                        </div>
                    </div>
                </div>
            </section>

            <section class="edit-card">
                <div class="card-heading">
                    <div class="section-icon">&#127968;</div>
                    <div>
                        <h2>Address Information</h2>
                        <p>Current and permanent residential address</p>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-grid">
                        <div class="field full-width">
                            <label>Current Address</label>
                            <asp:TextBox ID="txtCurrentAddress" runat="server"
                                TextMode="MultiLine" MaxLength="1000"
                                placeholder="Enter current address" />
                        </div>

                        <div class="field full-width">
                            <label>Permanent Address</label>
                            <asp:TextBox ID="txtPermanentAddress" runat="server"
                                TextMode="MultiLine" MaxLength="1000"
                                placeholder="Enter permanent address" />
                        </div>
                    </div>
                </div>
            </section>

            <section class="edit-card">
                <div class="card-heading">
                    <div class="section-icon">&#128221;</div>
                    <div>
                        <h2>Reference Information</h2>
                        <p>Student referral details</p>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-grid">
                        <div class="field">
                            <label>Reference Name</label>
                            <asp:TextBox ID="txtReferenceName" runat="server"
                                MaxLength="150" placeholder="Enter reference name" />
                        </div>
                    </div>
                </div>
            </section>

            <div class="form-footer">
                <div class="footer-note">
                    * Required field. Please review the details before saving.
                </div>
                <div class="footer-actions">
                    <asp:HyperLink ID="lnkCancel" runat="server"
                        NavigateUrl="~/StudentDetails.aspx"
                        CssClass="btn-cancel">Cancel</asp:HyperLink>

                    <asp:Button ID="btnUpdate" runat="server"
                        Text="Save Changes"
                        CssClass="btn-save"
                        ValidationGroup="EditStudent"
                        OnClick="btnUpdate_Click" />
                </div>
            </div>

        </asp:Panel>
    </div>

</asp:Content>
