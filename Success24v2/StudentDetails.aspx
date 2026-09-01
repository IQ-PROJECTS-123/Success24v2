<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="StudentDetails.aspx.cs" Inherits="Success24v2.StudentDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
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

                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </div>

</asp:Content>
