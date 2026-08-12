<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Success24v2.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            background: #f4f7fb;
            font-family: Arial, Helvetica, sans-serif;
            color: #1f2937;
        }

        .registration-container {
            width: 95%;
            max-width: 1100px;
            margin: 30px auto 50px;
        }

        /* ==============================
           HEADER
        ============================== */

        .page-title {
            margin-bottom: 25px;
        }

        .page-title h1 {
            margin: 0;
            font-size: 42px;
            font-weight: 700;
            color: #111827;
        }

        .page-title h1 span {
            color: #ef4168;
        }

        .page-title p {
            margin: 8px 0 0;
            color: #6b7280;
            font-size: 15px;
        }


        /* ==============================
           FORM CARD
        ============================== */

        .form-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 30px;
            box-shadow:
                0 4px 18px rgba(0,0,0,.06);
        }


        /* ==============================
           SECTION
        ============================== */

        .section-title {
            font-size: 20px;
            font-weight: 700;
            margin: 0 0 20px;
            color: #111827;
        }

        .section-title span {
            color: #ef4168;
        }


        /* ==============================
           FORM GRID
        ============================== */

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-group label {
            font-size: 14px;
            font-weight: 600;
            color: #374151;
            margin-bottom: 7px;
        }

        .required {
            color: #ef4168;
        }


        /* ==============================
           INPUTS
        ============================== */

        .form-control {
            width: 100%;
            height: 50px;

            padding: 0 14px;

            border: 1px solid #d1d5db;
            border-radius: 8px;

            background: #ffffff;

            color: #1f2937;

            font-size: 14px;

            outline: none;

            transition:
                border-color .2s ease,
                box-shadow .2s ease;
        }

        .form-control:focus {
            border-color: #f65a18;

            box-shadow:
                0 0 0 3px rgba(246,90,24,.10);
        }


        textarea.form-control {
            height: 110px;
            padding: 12px 14px;
            resize: vertical;
        }


        select.form-control {
            cursor: pointer;
        }


        /* ==============================
           ADDRESS
        ============================== */

        .address-box {
            min-height: 110px;
        }


        /* ==============================
           NOTE
        ============================== */

        .form-note {
            margin-top: 25px;
            padding: 15px 18px;

            background: #fff7f2;

            border-left: 4px solid #f65a18;

            border-radius: 6px;

            color: #4b5563;

            font-size: 14px;

            line-height: 1.6;
        }

        .form-note strong {
            color: #111827;
        }


        /* ==============================
           BUTTON
        ============================== */

        .button-area {
            margin-top: 25px;

            display: flex;
            justify-content: flex-end;
        }

        .btn-submit {
            border: none;

            padding: 13px 30px;

            border-radius: 7px;

            background: linear-gradient(
                135deg,
                #ff641b,
                #e92d36
            );

            color: #ffffff;

            font-size: 15px;

            font-weight: 700;

            cursor: pointer;

            transition:
                transform .2s ease,
                box-shadow .2s ease;
        }

        .btn-submit:hover {
            transform: translateY(-2px);

            box-shadow:
                0 8px 20px rgba(233,45,54,.20);
        }


        /* ==============================
           MESSAGE
        ============================== */

        .message {
            display: block;
            margin-top: 15px;
            font-size: 14px;
            font-weight: 600;
        }

        .success-message {
            color: #15803d;
        }

        .error-message {
            color: #dc2626;
        }


        /* ==============================
           MOBILE
        ============================== */

        @media(max-width:768px) {

            .registration-container {
                width: 94%;
                margin-top: 20px;
            }

            .page-title h1 {
                font-size: 32px;
            }

            .form-card {
                padding: 20px;
            }

            .form-grid {
                grid-template-columns: 1fr;
                gap: 16px;
            }

            .form-group.full-width {
                grid-column: auto;
            }

            .button-area {
                justify-content: stretch;
            }

            .btn-submit {
                width: 100%;
            }

        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="registration-container">


        <!-- ==============================
             PAGE HEADER
        ============================== -->
         <div>

        <div class="page-title">

            <h1>
                <span>Registration</span> Form
            </h1>

            <p>
                Please provide the following details for registration.
            </p>

        </div>


        <!-- ==============================
             FORM
        ============================== -->

        <div class="form-card">


            <h2 class="section-title">
                Required <span>Details</span>
            </h2>


            <div class="form-grid">


                <!-- First Name -->

                <div class="form-group">

                    <label>
                        First Name
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtFirstName"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter your first name">
                    </asp:TextBox>

                </div>
                  <!-- Last NAME -->

          <div class="form-group">

              <label>
                  Last Name
                  <span class="required">*</span>
              </label>

              <asp:TextBox
                  ID="txtLastName"
                  runat="server"
                  CssClass="form-control"
                  placeholder="Enter your last name">
              </asp:TextBox>

          </div>


                <!-- DATE OF BIRTH -->

                <div class="form-group">

                    <label>
                        Date of Birth
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtDOB"
                        runat="server"
                        TextMode="Date"
                        CssClass="form-control">
                    </asp:TextBox>

                </div>


                <!-- GRADUATION QUALIFICATION -->

                <div class="form-group">

                    <label>
                        Graduation Qualification
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtGraduation"
                        runat="server"
                        CssClass="form-control"
                        placeholder="e.g. B.Tech, BCA, B.Sc">
                    </asp:TextBox>

                </div>


                <!-- GRADUATION PASSOUT -->

                <div class="form-group">

                    <label>
                        Graduation Passout Year
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtGraduationYear"
                        runat="server"
                        TextMode="Number"
                        CssClass="form-control"
                        placeholder="e.g. 2024">
                    </asp:TextBox>

                </div>


                <!-- MASTERS QUALIFICATION -->

                <div class="form-group">

                    <label>
                        Masters Qualification
                    </label>

                    <asp:TextBox
                        ID="txtMasters"
                        runat="server"
                        CssClass="form-control"
                        placeholder="If applicable">
                    </asp:TextBox>

                </div>


                <!-- MASTERS PASSOUT -->

                <div class="form-group">

                    <label>
                        Masters Passout Year
                    </label>

                    <asp:TextBox
                        ID="txtMastersYear"
                        runat="server"
                        TextMode="Number"
                        CssClass="form-control"
                        placeholder="If applicable">
                    </asp:TextBox>

                </div>


                <!-- PRIMARY MOBILE -->

                <div class="form-group">

                    <label>
                        Primary Mobile Number
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtPrimaryMobile"
                        runat="server"
                        TextMode="Phone"
                        CssClass="form-control"
                        placeholder="Enter primary mobile number">
                    </asp:TextBox>

                </div>

                


                <!-- WHATSAPP -->

                <div class="form-group">

                    <label>
                        WhatsApp Number
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtWhatsApp"
                        runat="server"
                        TextMode="Phone"
                        CssClass="form-control"
                        placeholder="Enter WhatsApp number">
                    </asp:TextBox>

                </div>


                <!-- SECONDARY MOBILE -->

                <div class="form-group">

                    <label>
                        Secondary Mobile Number
                    </label>

                    <asp:TextBox
                        ID="txtSecondaryMobile"
                        runat="server"
                        TextMode="Phone"
                        CssClass="form-control"
                        placeholder="If applicable">
                    </asp:TextBox>

                </div>


                <!-- PRIMARY EMAIL -->

                <div class="form-group">

                    <label>
                        Primary Email Address
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtPrimaryEmail"
                        runat="server"
                        TextMode="Email"
                        CssClass="form-control"
                        placeholder="Enter primary email address">
                    </asp:TextBox>

                </div>


                <!-- SECONDARY EMAIL -->

                <div class="form-group">

                    <label>
                        Secondary Email Address
                    </label>

                    <asp:TextBox
                        ID="txtSecondaryEmail"
                        runat="server"
                        TextMode="Email"
                        CssClass="form-control"
                        placeholder="If applicable">
                    </asp:TextBox>

                </div>


                <!-- FATHER NAME -->

                <div class="form-group">

                    <label>
                        Father Name
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtFatherName"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter father's name">
                    </asp:TextBox>

                </div>


                <!-- GUARDIAN NAME -->

                <div class="form-group">

                    <label>
                        Guardian Name
                    </label>

                    <asp:TextBox
                        ID="txtGuardianName"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter guardian name">
                    </asp:TextBox>

                </div>


                <!-- GUARDIAN RELATIONSHIP -->

                <div class="form-group">

                    <label>
                        Guardian Relationship
                    </label>

                    <asp:TextBox
                        ID="txtGuardianRelationship"
                        runat="server"
                        CssClass="form-control"
                        placeholder="e.g. Uncle, Brother">
                    </asp:TextBox>

                </div>


                <!-- GUARDIAN CONTACT -->

                <div class="form-group">

                    <label>
                        Guardian Contact Number
                    </label>

                    <asp:TextBox
                        ID="txtGuardianContact"
                        runat="server"
                        TextMode="Phone"
                        CssClass="form-control"
                        placeholder="Enter guardian contact number">
                    </asp:TextBox>

                </div>


                <!-- CURRENT ADDRESS -->

                <div class="form-group full-width">

                    <label>
                        Full Current Address
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtCurrentAddress"
                        runat="server"
                        TextMode="MultiLine"
                        CssClass="form-control address-box"
                        placeholder="Enter your complete current address">
                    </asp:TextBox>

                </div>


                <!-- PERMANENT ADDRESS -->

                <div class="form-group full-width">

                    <label>
                        Full Permanent Address
                        <span class="required">*</span>
                    </label>

                    <asp:TextBox
                        ID="txtPermanentAddress"
                        runat="server"
                        TextMode="MultiLine"
                        CssClass="form-control address-box"
                        placeholder="Enter your complete permanent address">
                    </asp:TextBox>

                </div>


                <!-- REFERENCE -->

                <div class="form-group full-width">

                    <label>
                        Reference
                    </label>

                    <asp:TextBox
                        ID="txtReference"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Email / Old Candidate">
                    </asp:TextBox>

                </div>


            </div>


            <!-- ==============================
                 WHATSAPP NOTE
            ============================== -->

            <div class="form-note">

                <strong>Registration Instructions:</strong>

                Please provide all the above details correctly.
                After completing the registration, the required
                details will be used for registration verification.

              
            </div>


            <!-- ==============================
                 BUTTON
            ============================== -->

            <div class="button-area">

                <asp:Button
                    ID="btnRegister"
                    runat="server"
                    Text="Submit Registration"
                    CssClass="btn-submit"
                    OnClick="btnRegister_Click" />

            </div>


            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>


        </div>

    </div>
         </div>
</asp:Content>
