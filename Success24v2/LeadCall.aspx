<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="LeadCall.aspx.cs" Inherits="Success24v2.LeadCall" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #f5f7fb;
            font-family: Arial, Helvetica, sans-serif;
            color: #1f2937;
        }

        .container {
            width: 92%;
            max-width: 1200px;
            margin: 30px auto;
        }

        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: #2563eb;
            text-decoration: none;
            font-size: 14px;
        }

        .page-title {
            margin-bottom: 25px;
        }

        .page-title h1 {
            margin: 0 0 6px;
            font-size: 27px;
        }

        .page-title p {
            margin: 0;
            color: #6b7280;
        }

        .top-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .btn-logout {
            background: #dc2626;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
        }

        .card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,.06);
            margin-bottom: 25px;
            overflow: hidden;
        }

        .card-header {
            padding: 18px 22px;
            border-bottom: 1px solid #e5e7eb;
        }

        .card-header h2 {
            margin: 0;
            font-size: 19px;
        }

        .card-body {
            padding: 22px;
        }


        /* Lead Information */

        .lead-info {
            display: grid;
            grid-template-columns: repeat(3,1fr);
            gap: 22px;
        }

        .info-label {
            font-size: 12px;
            color: #6b7280;
            margin-bottom: 5px;
        }

        .info-value {
            font-size: 15px;
            font-weight: 600;
        }

        .phone {
            font-size: 18px;
            color: #2563eb;
        }


        /* Form */

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 7px;
        }

        .form-control {
            width: 100%;
            min-height: 43px;
            padding: 10px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            outline: none;
            font-size: 14px;
            background: white;
        }

        .form-control:focus {
            border-color: #2563eb;
        }

        textarea.form-control {
            resize: vertical;
            min-height: 120px;
        }

        .full-width {
            margin-bottom: 20px;
        }

        .btn-save {
            border: none;
            background: #16a34a;
            color: white;
            padding: 12px 24px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
        }

        .btn-save:hover {
            background: #15803d;
        }

        .message-success {
            display: block;
            margin-top: 15px;
            padding: 12px;
            border-radius: 6px;
            background: #dcfce7;
            color: #166534;
        }

        .message-error {
            display: block;
            margin-top: 15px;
            padding: 12px;
            border-radius: 6px;
            background: #fee2e2;
            color: #991b1b;
        }


        /* Feedback History */

        .history-item {
            padding: 17px 0;
            border-bottom: 1px solid #e5e7eb;
        }

        .history-item:last-child {
            border-bottom: none;
        }

        .history-top {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
        }

        .history-date {
            font-size: 13px;
            color: #6b7280;
        }

        .history-status {
            padding: 4px 9px;
            border-radius: 15px;
            background: #ede9fe;
            color: #6d28d9;
            font-size: 12px;
            font-weight: 600;
        }

        .history-feedback {
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 8px;
        }

        .follow-date {
            font-size: 13px;
            color: #b45309;
        }


        @media(max-width:800px) {

            .lead-info {
                grid-template-columns: 1fr 1fr;
            }

            .form-row {
                grid-template-columns: 1fr;
            }
        }

        @media(max-width:500px) {

            .lead-info {
                grid-template-columns: 1fr;
            }

        }

    </style>

        <script type="text/javascript">

        function toggleFollowUp() {

            var status =
                document.getElementById(
                    '<%= ddlStatus.ClientID %>'
                ).value;

            var followSection =
                document.getElementById(
                    'followUpSection'
                );

            if (
                status === "Follow Up" ||
                status === "Call Back" ||
                status === "No Answer"
            ) {

                followSection.style.display = "block";

            }
            else {

                followSection.style.display = "none";

            }
        }

        window.onload = function () {
            toggleFollowUp();
        };

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="container">


<a href="MyLeads.aspx"
   class="back-link">
    ← Back to My Leads
</a>

   

           
    <div class="page-title">

        <h1>Call & Feedback</h1>

        <p>
            Update the call result and schedule follow-up if required.
        </p>

    </div>


    <!-- =====================================
         Lead Information
    ====================================== -->

    <div class="card">

        <div class="card-header">

            <h2>Lead Information</h2>

        </div>


        <div class="card-body">

            <div class="lead-info">


                <div>

                    <div class="info-label">
                        Lead ID
                    </div>

                    <div class="info-value">

                        <asp:Label
                            ID="lblLeadID"
                            runat="server">
                        </asp:Label>

                    </div>

                </div>


                <div>

                    <div class="info-label">
                        Name
                    </div>

                    <div class="info-value">

                        <asp:Label
                            ID="lblName"
                            runat="server">
                        </asp:Label>

                    </div>

                </div>


                <div>

                    <div class="info-label">
                        Phone
                    </div>

                    <div class="info-value phone">

                        <asp:Label
                            ID="lblPhone"
                            runat="server">
                        </asp:Label>

                    </div>

                </div>


                <div>

                    <div class="info-label">
                        Email
                    </div>

                    <div class="info-value">

                        <asp:Label
                            ID="lblEmail"
                            runat="server">
                        </asp:Label>

                    </div>

                </div>


                <div>

                    <div class="info-label">
                        Qualification
                    </div>

                    <div class="info-value">

                        <asp:Label
                            ID="lblQualification"
                            runat="server">
                        </asp:Label>

                    </div>

                </div>


                <div>

                    <div class="info-label">
                        Stream
                    </div>

                    <div class="info-value">

                        <asp:Label
                            ID="lblStream"
                            runat="server">
                        </asp:Label>

                    </div>

                </div>


                <div>

                    <div class="info-label">
                        Passing Year
                    </div>

                    <div class="info-value">

                        <asp:Label
                            ID="lblPassingYear"
                            runat="server">
                        </asp:Label>

                    </div>

                </div>


                <div>

                    <div class="info-label">
                        Current Status
                    </div>

                    <div class="info-value">

                        <asp:Label
                            ID="lblCurrentStatus"
                            runat="server">
                        </asp:Label>

                    </div>

                </div>


                <div>

                    <div class="info-label">
                        Assigned To
                    </div>

                    <div class="info-value">

                        <asp:Label
                            ID="lblAssignedTo"
                            runat="server">
                        </asp:Label>

                    </div>

                </div>


            </div>

        </div>

    </div>



    <!-- =====================================
         Feedback Form
    ====================================== -->

    <div class="card">

        <div class="card-header">

            <h2>Add Call Feedback</h2>

        </div>


        <div class="card-body">


            <div class="form-row">


                <div class="form-group">

                    <label>Call Status *</label>

                    <asp:DropDownList
                        ID="ddlStatus"
                        runat="server"
                        CssClass="form-control"
                        onchange="toggleFollowUp();">

                        <asp:ListItem
                            Text="-- Select Status --"
                            Value="">
                        </asp:ListItem>

                        <asp:ListItem
                            Text="Follow Up"
                            Value="Follow Up">
                        </asp:ListItem>

                        <asp:ListItem
                            Text="Interested"
                            Value="Interested">
                        </asp:ListItem>

                        <asp:ListItem
                            Text="Not Interested"
                            Value="Not Interested">
                        </asp:ListItem>

                        <asp:ListItem
                            Text="No Answer"
                            Value="No Answer">
                        </asp:ListItem>

                        <asp:ListItem
                            Text="Call Back"
                            Value="Call Back">
                        </asp:ListItem>

                        <asp:ListItem
                            Text="Converted"
                            Value="Converted">
                        </asp:ListItem>
                                              
                        <asp:ListItem
                            Text="Working"
                            Value="Working">
                        </asp:ListItem>


                    </asp:DropDownList>

                </div>


                <div
                    class="form-group"
                    id="followUpSection"
                    style="display:none;">

                    <label>Follow Up Date *</label>

                    <asp:TextBox
                        ID="txtFollowUpDate"
                        runat="server"
                        TextMode="DateTimeLocal"
                        CssClass="form-control">
                    </asp:TextBox>

                </div>


            </div>


            <div class="form-group full-width">

                <label>Feedback *</label>

                <asp:TextBox
                    ID="txtFeedback"
                    runat="server"
                    TextMode="MultiLine"
                    Rows="5"
                    CssClass="form-control"
                    placeholder="Enter call details, student response, discussion, etc.">
                </asp:TextBox>

            </div>


            <asp:Button
                ID="btnSaveFeedback"
                runat="server"
                Text="Save Feedback"
                CssClass="btn-save"
                OnClick="btnSaveFeedback_Click" />


            <asp:Label
                ID="lblMessage"
                runat="server">
            </asp:Label>


        </div>

    </div>



    <!-- =====================================
         Feedback History
    ====================================== -->

    <div class="card">

        <div class="card-header">

            <h2>Call History</h2>

        </div>


        <div class="card-body">


            <asp:Repeater
                ID="rptHistory"
                runat="server">


                <ItemTemplate>

                    <div class="history-item">


                        <div class="history-top">

                            <div class="history-date">

                                <%#
                                    Eval(
                                        "FeedbackOn",
                                        "{0:dd-MMM-yyyy hh:mm tt}"
                                    )
                                %>

                                &nbsp; • &nbsp;

                                <%# Eval("CallerName") %>

                            </div>


                            <div class="history-status">

                                <%# Eval("Status") %>

                            </div>

                        </div>


                        <div class="history-feedback">

                            <%# Eval("Feedback") %>

                        </div>


                        <asp:Panel
                            runat="server"
                            Visible='<%#
                                Eval("FollowUpDate") != DBNull.Value
                            %>'>

                            <div class="follow-date">

                                Follow Up:

                                <%#
                                    Eval(
                                        "FollowUpDate",
                                        "{0:dd-MMM-yyyy}"
                                    )
                                %>

                            </div>

                        </asp:Panel>


                    </div>

                </ItemTemplate>


            </asp:Repeater>


            <asp:Label
                ID="lblNoHistory"
                runat="server"
                Text="No previous call history."
                ForeColor="#6b7280"
                Visible="false">
            </asp:Label>


        </div>

    </div>


</div>

    </div>
</asp:Content>
