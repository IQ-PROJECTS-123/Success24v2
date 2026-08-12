<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="CreateLead.aspx.cs" Inherits="Success24v2.CreateLead" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
        <style>

        * {
            box-sizing: border-box;
        }

        .create-page {
            width: 92%;
            max-width: 1000px;
            margin: 35px auto 50px;
        }


        /* =========================
           PAGE HEADER
        ========================= */

        .create-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            margin-bottom: 25px;
        }

        .create-title h1 {
            margin: 0 0 9px;
            color: #172033;
            font-size: 29px;
            font-weight: 700;
        }

        .create-title h1::after {
            content: "";
            display: block;

            width: 48px;
            height: 4px;

            margin-top: 8px;

            border-radius: 10px;

            background:
                linear-gradient(
                    90deg,
                    #ff6411,
                    #ef2d32
                );
        }

        .create-title p {
            margin: 0;
            color: #6b7280;
            font-size: 14px;
        }


        /* Back button */

        .btn-back {
            display: inline-flex;
            align-items: center;
            justify-content: center;

            padding: 10px 17px;

            background: #ffffff;

            color: #374151 !important;

            border: 1px solid #d8dce3;

            border-radius: 7px;

            text-decoration: none !important;

            font-size: 13px;
            font-weight: 600;

            transition: all .2s ease;
        }

        .btn-back:hover {
            border-color: #ff6411;
            color: #ef4b25 !important;
            background: #fff8f4;
        }


        /* =========================
           FORM CARD
        ========================= */

        .form-card {
            position: relative;

            background: #ffffff;

            border: 1px solid #eceef2;

            border-radius: 12px;

            box-shadow:
                0 6px 25px rgba(31,41,55,.07);

            overflow: hidden;
        }

        .form-card::before {
            content: "";

            position: absolute;

            top: 0;
            left: 0;

            width: 100%;
            height: 4px;

            background:
                linear-gradient(
                    90deg,
                    #ff6411,
                    #ef2d32
                );
        }


        /* =========================
           CARD HEADER
        ========================= */

        .form-card-header {
            padding: 22px 25px;

            background:
                linear-gradient(
                    90deg,
                    #fff7f2,
                    #ffffff
                );

            border-bottom:
                1px solid #f0e5df;
        }

        .form-card-header h2 {
            margin: 0 0 5px;

            color: #172033;

            font-size: 19px;
            font-weight: 700;
        }

        .form-card-header p {
            margin: 0;

            color: #7a8089;

            font-size: 13px;
        }


        /* =========================
           FORM BODY
        ========================= */

        .form-body {
            padding: 28px 25px;
        }


        .form-grid {
            display: grid;

            grid-template-columns:
                repeat(2, minmax(0, 1fr));

            gap: 22px 25px;
        }


        /* =========================
           FORM GROUP
        ========================= */

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }


        .form-group label {
            color: #374151;

            font-size: 13px;
            font-weight: 600;
        }


        .required {
            color: #ef2d32;
        }


        /* =========================
           INPUT
        ========================= */

        .form-control {
            width: 100%;
            height: 44px;

            padding: 9px 13px;

            background: #ffffff;

            color: #1f2937;

            border: 1px solid #d5d9e0;

            border-radius: 7px;

            outline: none;

            font-family:
                Arial,
                Helvetica,
                sans-serif;

            font-size: 14px;

            transition:
                border-color .2s ease,
                box-shadow .2s ease;
        }


        .form-control::placeholder {
            color: #a1a6ae;
        }


        .form-control:focus {
            border-color: #ff6411;

            box-shadow:
                0 0 0 3px
                rgba(255,100,17,.10);
        }


        /* =========================
           VALIDATION
        ========================= */

        .validation-error {
            color: #dc2626;

            font-size: 11px;

            font-weight: 500;
        }


        /* =========================
           FORM FOOTER
        ========================= */

        .form-footer {
            display: flex;

            justify-content: flex-end;

            align-items: center;

            gap: 10px;

            padding: 18px 25px;

            background: #fafbfc;

            border-top:
                1px solid #eceef2;
        }


        /* Cancel */

        .btn-cancel {
            display: inline-flex;

            height: 42px;

            align-items: center;
            justify-content: center;

            padding: 0 20px;

            background: #ffffff;

            color: #4b5563 !important;

            border: 1px solid #d5d9e0;

            border-radius: 7px;

            text-decoration: none !important;

            font-size: 13px;

            font-weight: 600;
        }


        .btn-cancel:hover {
            background: #f3f4f6;
        }


        /* Save */

        .btn-save {
            height: 42px;

            padding: 0 23px;

            border: none;

            border-radius: 7px;

            background:
                linear-gradient(
                    90deg,
                    #ff6411,
                    #ef2d32
                );

            color: #ffffff;

            font-size: 13px;

            font-weight: 600;

            cursor: pointer;

            box-shadow:
                0 4px 11px
                rgba(239,45,50,.20);

            transition:
                transform .2s ease,
                box-shadow .2s ease;
        }


        .btn-save:hover {
            transform: translateY(-1px);

            box-shadow:
                0 6px 15px
                rgba(239,45,50,.28);
        }


        /* =========================
           MESSAGE
        ========================= */

        .message {
            display: block;

            margin-bottom: 20px;

            padding: 12px 15px;

            border-radius: 7px;

            font-size: 13px;

            font-weight: 600;
        }


        .message:empty {
            display: none;
        }


        .success-message {
            background: #ecfdf3;

            color: #15803d;

            border: 1px solid #bbf7d0;
        }


        .error-message {
            background: #fef2f2;

            color: #dc2626;

            border: 1px solid #fecaca;
        }


        /* =========================
           RESPONSIVE
        ========================= */

        @media(max-width:700px) {

            .create-page {
                width: 94%;
                margin: 20px auto 35px;
            }

            .create-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .create-title h1 {
                font-size: 25px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-body {
                padding: 20px;
            }

            .form-footer {
                padding: 16px 20px;
            }

        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="create-page">


        <!-- =========================
             PAGE HEADER
        ========================== -->

        <div class="create-header">

            <div class="create-title">

                <h1>Create New Lead</h1>

                <p>
                    Add a new lead to the lead management system.
                </p>

            </div>


            <asp:HyperLink
                ID="lnkBack"
                runat="server"
                NavigateUrl="~/LeadManagement.aspx"
                CssClass="btn-back">

                ← Back to Leads

            </asp:HyperLink>

        </div>


        <!-- Message -->

        <asp:Label
            ID="lblMessage"
            runat="server">
        </asp:Label>


        <!-- =========================
             FORM CARD
        ========================== -->

        <div class="form-card">


            <div class="form-card-header">

                <h2>Lead Information</h2>

                <p>
                    Enter the basic information of the new lead.
                </p>

            </div>


            <div class="form-body">


                <div class="form-grid">


                    <!-- Name -->

                    <div class="form-group">

                        <label>
                            Name
                            <span class="required">*</span>
                        </label>

                        <asp:TextBox
                            ID="txtName"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter full name">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvName"
                            runat="server"
                            ControlToValidate="txtName"
                            ErrorMessage="Name is required."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="CreateLead">
                        </asp:RequiredFieldValidator>

                    </div>


                    <!-- Email -->

                    <div class="form-group">

                        <label>
                            Email
                            <span class="required">*</span>
                        </label>

                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"
                            TextMode="Email"
                            CssClass="form-control"
                            placeholder="example@email.com">
                        </asp:TextBox>

                        

               <asp:RequiredFieldValidator
                     ID="rfvEmail"
                     runat="server"
                     ControlToValidate="txtEmail"
                     ErrorMessage="Email is required."
                     CssClass="validation-error"
                     Display="Dynamic"
                     ValidationGroup="CreateLead">
               </asp:RequiredFieldValidator>

                    </div>


                    <!-- Phone -->

                    <div class="form-group">

                        <label>
                            Phone
                            <span class="required">*</span>
                        </label>

                        <asp:TextBox
                            ID="txtPhone"
                            runat="server"
                            CssClass="form-control"
                            MaxLength="20"
                            placeholder="Enter phone number">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvPhone"
                            runat="server"
                            ControlToValidate="txtPhone"
                            ErrorMessage="Phone number is required."
                            CssClass="validation-error"
                            Display="Dynamic"
                            ValidationGroup="CreateLead">
                        </asp:RequiredFieldValidator>

                    </div>


                    <!-- Qualification -->

                    <div class="form-group">

                        <label>
                            Qualification
                       <span class="required">*</span>

                        </label>

                        <asp:TextBox
                            ID="txtQualification"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Example: B.Tech, MCA, BCA">
                        </asp:TextBox>
                        
                     <asp:RequiredFieldValidator
                         ID="rfvQualification"
                         runat="server"
                         ControlToValidate="txtQualification"
                         ErrorMessage="Qualification is required."
                         CssClass="validation-error"
                         Display="Dynamic"
                         ValidationGroup="CreateLead">
                     </asp:RequiredFieldValidator>

                    </div>


                    <!-- Stream -->

                    <div class="form-group">

                        <label>
                            Stream
                            <span class="required">*</span>
                        </label>

                        <asp:TextBox
                            ID="txtStream"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Example: CS, IT, Mechanical">
                        </asp:TextBox>
                        
                          <asp:RequiredFieldValidator
                             ID="rfvStream"
                             runat="server"
                             ControlToValidate="txtStream"
                             ErrorMessage="Stream is required."
                             CssClass="validation-error"
                             Display="Dynamic"
                             ValidationGroup="CreateLead">
                          </asp:RequiredFieldValidator>

                    </div>


                    <!-- Passing Year -->

                    <div class="form-group">

                        <label>
                            Passing Year
                            <span class="required">*</span>
                        </label>

                        <asp:TextBox
                            ID="txtPassingYear"
                            runat="server"
                            TextMode="Number"
                            CssClass="form-control"
                            placeholder="Example: 2026">
                        </asp:TextBox>
                        
                         <asp:RequiredFieldValidator
                                 ID="rfvPassingYear"
                                 runat="server"
                                 ControlToValidate="txtPassingYear"
                                 ErrorMessage="Passing Year is required."
                                 CssClass="validation-error"
                                 Display="Dynamic"
                                 ValidationGroup="CreateLead">
                          </asp:RequiredFieldValidator>


                    </div>


                </div>

            </div>


            <!-- =========================
                 FOOTER
            ========================== -->

            <div class="form-footer">


                <asp:HyperLink
                    ID="lnkCancel"
                    runat="server"
                    NavigateUrl="~/LeadManagement.aspx"
                    CssClass="btn-cancel">

                    Cancel

                </asp:HyperLink>


                <asp:Button
                    ID="btnSaveLead"
                    runat="server"
                    Text="Create Lead"
                    CssClass="btn-save"
                    ValidationGroup="CreateLead"
                    OnClick="btnSaveLead_Click" />


            </div>


        </div>


    </div>

</asp:Content>
