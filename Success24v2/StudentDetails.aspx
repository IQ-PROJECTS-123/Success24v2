<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="StudentDetails.aspx.cs" Inherits="Success24v2.StudentDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>

/* =========================================
   STUDENT DETAILS PAGE
========================================= */

.details-page {
    width: 95%;
    max-width: 1550px;
    margin: 32px auto 50px;
}


/* =========================================
   PAGE HEADER
========================================= */

.details-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    margin-bottom: 24px;
}

.details-header h1 {
    margin: 0 0 7px;
    font-size: 29px;
    font-weight: 700;
    color: #172033;
    letter-spacing: -0.4px;
}

.details-header p {
    margin: 0;
    color: #718096;
    font-size: 14px;
}


/* =========================================
   MAIN CARD
========================================= */

.details-card {
    background: #ffffff;
    border: 1px solid #e8edf3;
    border-radius: 14px;
    box-shadow:
        0 4px 12px rgba(15, 23, 42, 0.04),
        0 12px 30px rgba(15, 23, 42, 0.05);

    overflow: hidden;
}


/* =========================================
   CARD HEADER
========================================= */

.details-card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;

    padding: 20px 24px;

    background: #ffffff;

    border-bottom: 1px solid #edf0f4;
}

.details-card-header h2 {
    margin: 0;

    font-size: 19px;
    font-weight: 700;

    color: #172033;
}


/* =========================================
   SMALL HEADER ACCENT
========================================= */

.details-card-header h2::before {
    content: "";

    display: inline-block;

    width: 4px;
    height: 20px;

    margin-right: 10px;

    vertical-align: -3px;

    background: #f65a18;

    border-radius: 4px;
}


/* =========================================
   GRID SCROLL AREA
========================================= */

.grid-wrapper {
    width: 100%;

    overflow-x: auto;
    overflow-y: hidden;

    scrollbar-width: thin;
    scrollbar-color: #cbd5e1 #f8fafc;
}


/* Chrome / Edge scrollbar */

.grid-wrapper::-webkit-scrollbar {
    height: 8px;
}

.grid-wrapper::-webkit-scrollbar-track {
    background: #f8fafc;
}

.grid-wrapper::-webkit-scrollbar-thumb {
    background: #cbd5e1;
    border-radius: 20px;
}

.grid-wrapper::-webkit-scrollbar-thumb:hover {
    background: #94a3b8;
}


/* =========================================
   GRID
========================================= */

.details-grid {
    width: 100%;
    min-width: 1800px;

    border-collapse: separate;
    border-spacing: 0;

    background: #ffffff;

    font-family: Arial, Helvetica, sans-serif;
}


/* =========================================
   TABLE HEADER
========================================= */

.details-grid th {
    position: relative;

    padding: 15px 16px;

    background: #f8fafc;

    color: #344054;

    text-align: left;

    font-size: 12px;

    font-weight: 700;

    letter-spacing: 0.3px;

    text-transform: uppercase;

    white-space: nowrap;

    border-bottom: 1px solid #e4e7ec;

    vertical-align: middle;
}


.btn-action {
    display: inline-block;
    padding: 7px 11px;
    margin: 2px;
    border-radius: 5px;
    font-size: 12px;
    font-weight: 600;
    text-decoration: none;
    border: none;
    cursor: pointer;
}

.btn-edit {
    background: #ffedd5;
    color: #c2410c;
}

.btn-delete {
    background: #fee2e2;
    color: #b91c1c;
}

.btn-action:hover {
    opacity: 0.8;
}
/* Header orange bottom line */

.details-grid th::after {
    content: "";

    position: absolute;

    left: 0;
    right: 0;

    bottom: -1px;

    height: 2px;

    background: #f65a18;

    opacity: 0.75;
}


/* =========================================
   TABLE BODY
========================================= */

.details-grid td {
    padding: 15px 16px;

    color: #475467;

    font-size: 13px;

    line-height: 1.45;

    white-space: nowrap;

    border-bottom: 1px solid #eef1f5;

    vertical-align: middle;

    background: #ffffff;
}


/* =========================================
   ZEBRA ROWS
========================================= */

.details-grid tr:nth-child(even) td {
    background: #fbfcfe;
}


/* =========================================
   ROW HOVER
========================================= */

.details-grid tr:hover td {
    background: #fff7f2;

    transition: background 0.18s ease;
}


/* =========================================
   FIRST COLUMN / ID
========================================= */

.details-grid th:first-child {
    text-align: center;
}

.details-grid td:first-child {
    text-align: center;

    font-weight: 700;

    color: #f65a18;
}


/* =========================================
   NAME COLUMNS
========================================= */

.details-grid td:nth-child(2),
.details-grid td:nth-child(3) {
    font-weight: 600;

    color: #1f2937;
}


/* =========================================
   EMAIL
========================================= */

.details-grid td:nth-child(6) {
    color: #2563eb;
}


/* =========================================
   MOBILE NUMBER
========================================= */

.details-grid td:nth-child(7) {
    font-weight: 600;

    color: #344054;
}


/* =========================================
   DATE OF BIRTH
========================================= */

.details-grid td:nth-child(4) {
    color: #475467;
}


/* =========================================
   QUALIFICATION
========================================= */

.details-grid td:nth-child(8),
.details-grid td:nth-child(10) {
    font-weight: 600;

    color: #344054;
}


/* =========================================
   PASSOUT YEAR
========================================= */

.details-grid td:nth-child(9),
.details-grid td:nth-child(11) {
    font-weight: 600;

    color: #667085;

    text-align: center;
}
/* =========================================================
   SEARCH BOX
========================================================= */

.lead-search {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 3px;
}

.search-input {
    width: 320px;
    height: 42px;
    padding: 0 14px;

    background: #ffffff;
    color: #1f2937;

    border: 1px solid #e5e7eb;
    border-radius: 7px;

    font-size: 13px;
    outline: none;

    transition: all .2s ease;
}

.search-input::placeholder {
    color: #9ca3af;
}

.search-input:focus {
    border-color: #f65a18;

    box-shadow:
        0 0 0 3px rgba(246, 90, 24, .10);
}


/* =========================================================
   SEARCH BUTTON
========================================================= */

.btn-search {
    height: 42px;

    padding: 0 20px;

    border: none;
    border-radius: 7px;

    background: linear-gradient(
        90deg,
        #ff6411,
        #ef2d32
    );

    color: #ffffff;

    font-size: 13px;
    font-weight: 600;

    cursor: pointer;

    box-shadow:
        0 3px 10px rgba(239, 45, 50, .18);

    transition:
        transform .2s ease,
        box-shadow .2s ease;
}

.btn-search:hover {
    color: #ffffff;

    transform: translateY(-1px);

    box-shadow:
        0 6px 15px rgba(239, 45, 50, .28);
}

.btn-search:active {
    transform: translateY(0);
}


/* =========================================================
   CLEAR BUTTON
========================================================= */

.btn-clear-search {
    height: 42px;

    padding: 0 18px;

    border: 1px solid #e5e7eb;
    border-radius: 7px;

    background: #ffffff;

    color: #6b7280;

    font-size: 13px;
    font-weight: 600;

    cursor: pointer;

    transition: all .2s ease;
}

.btn-clear-search:hover {
    background: #f9fafb;

    color: #ef4b25;

    border-color: #f65a18;

    transform: translateY(-1px);
}


/* =========================================================
   MOBILE SEARCH
========================================================= */

@media (max-width: 600px) {

    .lead-search {
        width: 100%;
        flex-wrap: wrap;
    }

    .search-input {
        width: 100%;
    }

    .btn-search,
    .btn-clear-search {
        flex: 1;
    }
}



/* =========================================
   ADDRESS COLUMNS
========================================= */

.details-grid td:nth-child(16),
.details-grid td:nth-child(17) {
    max-width: 300px;

    white-space: normal;

    line-height: 1.5;
}


/* =========================================
   EMPTY DATA
========================================= */

.details-grid tbody tr td[colspan] {
    padding: 50px 20px;

    text-align: center;

    color: #98a2b3;

    font-size: 14px;

    background: #ffffff;
}


/* =========================================
   PAGINATION
========================================= */

.details-grid > tbody > tr:last-child td {
    background: #ffffff;

    border-bottom: none;

    padding: 18px;
}


/* ASP.NET Pager */

.details-grid > tbody > tr:last-child table {
    margin: 0 auto;
}

.details-grid > tbody > tr:last-child table td {
    padding: 3px;

    border: none;

    background: transparent;
}


/* Page numbers */

.details-grid > tbody > tr:last-child table a,
.details-grid > tbody > tr:last-child table span {
    min-width: 34px;
    height: 34px;

    display: inline-flex;

    align-items: center;
    justify-content: center;

    padding: 0 9px;

    border: 1px solid #e4e7ec;

    border-radius: 7px;

    background: #ffffff;

    color: #475467;

    text-decoration: none;

    font-size: 13px;

    font-weight: 600;

    transition: all 0.2s ease;
}


/* Hover page */

.details-grid > tbody > tr:last-child table a:hover {
    background: #fff4ee;

    border-color: #f65a18;

    color: #f65a18;
}


/* Active page */

.details-grid > tbody > tr:last-child table span {
    background: #f65a18;

    border-color: #f65a18;

    color: #ffffff;

    box-shadow:
        0 3px 8px rgba(246, 90, 24, 0.25);
}


/* =========================================
   RESPONSIVE
========================================= */

@media (max-width: 900px) {

    .details-page {
        width: 94%;
        margin-top: 22px;
    }

    .details-header h1 {
        font-size: 24px;
    }

    .details-card-header {
        padding: 17px 18px;
    }

    .details-grid {
        min-width: 1800px;
    }
}


/* =========================================
   MOBILE
========================================= */

@media (max-width: 600px) {

    .details-page {
        width: 96%;
    }

    .details-header {
        display: block;
    }

    .details-header h1 {
        font-size: 22px;
    }

    .details-header p {
        font-size: 13px;
    }

    .details-card-header h2 {
        font-size: 17px;
    }

}

        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="details-page">

        <div class="details-header">

            <h1>Student Details</h1>

            <p>
                View complete details of registered students.
            </p>

        </div>


        <div class="details-card">

            <div class="details-card-header">

                <h2>All Student Details</h2>

            </div>
               <div class="lead-search">

                <asp:TextBox
                    ID="txtSearch"
                    runat="server"
                    CssClass="search-input"
                    placeholder="Search Name / Phone / Email">
                </asp:TextBox>

                <asp:Button
                    ID="btnSearch"
                    runat="server"
                    Text="Search"
                    CssClass="btn-search"
                    OnClick="btnSearch_Click" />

                <asp:Button
                    ID="btnClearSearch"
                    runat="server"
                    Text="Clear"
                    CssClass="btn-clear-search"
                    OnClick="btnClearSearch_Click" />

            </div>


            <div class="grid-wrapper">

                <asp:GridView
                    ID="gvLeadDetails"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="details-grid"
                    GridLines="None"
                    AllowPaging="True"
                    PageSize="100"
                    OnPageIndexChanging="gvLeadDetails_PageIndexChanging"
                    onRowCommand="gvLeadDetails_RowCommand"
                    EmptyDataText="No Student details found.">

                    <Columns>

                        <asp:BoundField
                            DataField="ID"
                            HeaderText="ID" />

                        <asp:BoundField
                            DataField="FirstName"
                            HeaderText="First Name" />

                        <asp:BoundField
                            DataField="LastName"
                            HeaderText="Last Name" />

                        <asp:BoundField DataField="DOB" HeaderText="Date of Birth" DataFormatString="{0:dd-MMM-yyyy}" />

                        <asp:BoundField DataField="Course" HeaderText="Course" />

                        <asp:BoundField
                            DataField="Email1"
                            HeaderText="Email" />

                        <asp:BoundField
                            DataField="PrimaryMobile"
                            HeaderText="Mobile No" />

                        <asp:BoundField
                            DataField="Qualification"
                            HeaderText="GraduationQualification" />

                        <asp:BoundField
                        DataField="PassoutYear"
                        HeaderText="Graduation Passout Year" />

                        <asp:BoundField
                            DataField="MastersQualification"
                            HeaderText="Masters Qualification" />

                        <asp:BoundField
                            DataField="MastersPassoutYear"
                            HeaderText="Masters Passout Year" />

                        <asp:BoundField
                            DataField="FatherName"
                            HeaderText="Father's Name" />

                         <asp:BoundField
                             DataField="GuardianName"
                             HeaderText="Guardian's Name" />

                        <asp:BoundField
                            DataField="GuardianRelationship"
                            HeaderText="Guardian Relationship" />
                         <asp:BoundField
                            DataField="ParentNo"
                            HeaderText="Guardian's No" />
                         <asp:BoundField
                             DataField="CurrentAddress"
                             HeaderText="Current Address" />
                         <asp:BoundField
                             DataField="PermanentAddress"
                             HeaderText="Permanent Address" />
                         <asp:BoundField
                             DataField="ReferenceName"
                             HeaderText="Reference Name" />

                        
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:HyperLink
                                ID="lnkEdit"
                                runat="server"
                                Text="Edit"
                                CssClass="btn-action btn-edit"
                                NavigateUrl='<%# "EditStudent.aspx?ID=" + Eval("ID") %>' />

                           
                        <asp:LinkButton
                            ID="btnDelete"
                            runat="server"
                            Text="Delete"
                            CssClass="btn-action btn-delete"
                            CommandName="DeleteStudent"
                            CommandArgument='<%# Eval("ID") %>'
                            OnClientClick="return confirm('Are you sure you want to delete this student?');"
                            CausesValidation="false" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </div>

</asp:Content>
