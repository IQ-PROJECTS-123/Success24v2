<%@ Page Title="Edit Student" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="AdminEditStudent.aspx.cs" Inherits="Success24v2.AdminEditStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,300;0,400;0,500;0,600;1,400&family=Syne:wght@600;700&display=swap" rel="stylesheet">
<style>
  :root {
    --brand:      #f97316;
    --brand-dark: #c2560e;
    --brand-soft: #fff4ec;
    --danger:     #ef4444;
    --success:    #16a34a;
    --info:       #2563eb;
    --surface:    #ffffff;
    --surface-2:  #f8f7f4;
    --surface-3:  #f0ede8;
    --border:     rgba(0,0,0,0.08);
    --border-md:  rgba(0,0,0,0.14);
    --text-1:     #141412;
    --text-2:     #5c5b57;
    --text-3:     #9a9892;
    --radius-sm:  6px;
    --radius-md:  10px;
    --radius-lg:  16px;
    --radius-xl:  22px;
    --font-head:  'Syne', sans-serif;
    --font-body:  'DM Sans', sans-serif;
    --shadow-sm:  0 1px 4px rgba(0,0,0,0.07);
    --shadow-md:  0 4px 18px rgba(0,0,0,0.09);
  }

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  .edit-page { font-family: var(--font-body); background: var(--surface-2); min-height: 100vh; padding: 28px 24px 80px; }

  /* ── Top Bar ── */
  .edit-topbar {
    display: flex; align-items: center; justify-content: space-between;
    background: var(--surface); border: 1px solid var(--border);
    border-radius: var(--radius-xl); padding: 13px 22px;
    margin-bottom: 28px; box-shadow: var(--shadow-sm);
  }
  .edit-topbar-left { display: flex; align-items: center; gap: 14px; }
  .back-btn {
    display: inline-flex; align-items: center; gap: 7px;
    background: var(--surface-3); color: var(--text-2);
    border: 1px solid var(--border-md); border-radius: var(--radius-md);
    padding: 8px 14px; font-size: 13px; font-weight: 500;
    cursor: pointer; font-family: var(--font-body); text-decoration: none;
    transition: background 0.16s, color 0.16s;
  }
  .back-btn:hover { background: var(--surface); color: var(--text-1); }
  .edit-topbar-title { font-family: var(--font-head); font-size: 1.1rem; color: var(--text-1); }
  .edit-topbar-sub   { font-size: 12px; color: var(--text-3); margin-top: 2px; }
  .student-id-pill {
    background: var(--brand-soft); color: var(--brand-dark);
    border: 1px solid rgba(249,115,22,0.2);
    border-radius: 20px; padding: 5px 13px;
    font-size: 12px; font-weight: 600;
  }

  /* ── Layout ── */
  .edit-layout {
    display: grid;
    grid-template-columns: 300px 1fr;
    gap: 22px; align-items: start;
  }

  /* ── Left Panel (Photo + Quick Info) ── */
  .left-panel { display: flex; flex-direction: column; gap: 16px; }

  .photo-card {
    background: var(--surface); border: 1px solid var(--border);
    border-radius: var(--radius-lg); padding: 28px 22px;
    box-shadow: var(--shadow-sm); text-align: center;
  }
  .photo-frame {
    width: 120px; height: 120px; border-radius: 50%;
    margin: 0 auto 16px; position: relative;
    border: 3px solid var(--border-md);
    overflow: hidden; background: var(--surface-3);
    display: flex; align-items: center; justify-content: center;
  }
  .photo-frame img { width: 100%; height: 100%; object-fit: cover; display: block; }
  .photo-initials  { font-family: var(--font-head); font-size: 2.2rem; color: var(--text-3); }
  .photo-name      { font-family: var(--font-head); font-size: 1.05rem; color: var(--text-1); margin-bottom: 4px; }
  .photo-course    { font-size: 12.5px; color: var(--text-3); margin-bottom: 18px; }

  .status-toggle-wrap {
    display: flex; align-items: center; justify-content: space-between;
    background: var(--surface-2); border-radius: var(--radius-md);
    padding: 12px 14px; margin-bottom: 16px;
  }
  .status-toggle-lbl { font-size: 13px; font-weight: 500; color: var(--text-2); }
  .toggle-pill {
    position: relative; width: 44px; height: 24px;
    background: var(--border-md); border-radius: 12px;
    cursor: pointer; transition: background 0.22s; flex-shrink: 0;
  }
  .toggle-pill.on { background: var(--success); }
  .toggle-pill::after {
    content: ''; position: absolute; top: 3px; left: 3px;
    width: 18px; height: 18px; border-radius: 50%;
    background: #fff; transition: transform 0.22s;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);
  }
  .toggle-pill.on::after { transform: translateX(20px); }

  .photo-actions { display: flex; flex-direction: column; gap: 8px; }
  .upload-label {
    display: flex; align-items: center; justify-content: center; gap: 7px;
    background: var(--brand); color: #fff; border-radius: var(--radius-md);
    padding: 9px 14px; font-size: 13px; font-weight: 500; cursor: pointer;
    transition: background 0.16s; font-family: var(--font-body);
  }
  .upload-label:hover { background: var(--brand-dark); }
  .upload-label input[type=file] { display: none; }
  .btn-del-photo {
    display: flex; align-items: center; justify-content: center; gap: 7px;
    background: #fef2f2; color: var(--danger);
    border: 1px solid rgba(239,68,68,0.25);
    border-radius: var(--radius-md); padding: 9px 14px;
    font-size: 13px; font-weight: 500; cursor: pointer;
    font-family: var(--font-body); transition: background 0.16s;
  }
  .btn-del-photo:hover { background: #fee2e2; }
  .photo-hint { font-size: 11px; color: var(--text-3); text-align: center; margin-top: 6px; }

  /* Info summary card */
  .info-card {
    background: var(--surface); border: 1px solid var(--border);
    border-radius: var(--radius-lg); padding: 18px 20px;
    box-shadow: var(--shadow-sm);
  }
  .info-card-title { font-size: 11px; font-weight: 600; color: var(--text-3); text-transform: uppercase; letter-spacing: 0.07em; margin-bottom: 14px; }
  .info-row { display: flex; justify-content: space-between; align-items: center; padding: 8px 0; border-bottom: 1px solid var(--border); }
  .info-row:last-child { border-bottom: none; }
  .info-row-lbl { font-size: 12px; color: var(--text-3); }
  .info-row-val { font-size: 12.5px; font-weight: 500; color: var(--text-1); max-width: 160px; text-align: right; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }

  /* ── Right Panel (Form) ── */
  .form-card {
    background: var(--surface); border: 1px solid var(--border);
    border-radius: var(--radius-lg); box-shadow: var(--shadow-sm);
    overflow: hidden;
  }
  .form-section-header {
    display: flex; align-items: center; gap: 10px;
    padding: 18px 26px 14px; border-bottom: 1px solid var(--border);
  }
  .section-icon {
    width: 32px; height: 32px; border-radius: var(--radius-sm);
    display: flex; align-items: center; justify-content: center;
    font-size: 15px; flex-shrink: 0;
  }
  .section-title { font-family: var(--font-head); font-size: 0.95rem; color: var(--text-1); }
  .section-desc  { font-size: 12px; color: var(--text-3); margin-top: 1px; }

  .form-body { padding: 22px 26px; }

  /* Section divider */
  .form-section-divider {
    display: flex; align-items: center; gap: 12px;
    margin: 24px 0 18px; font-size: 11px; font-weight: 600;
    color: var(--text-3); text-transform: uppercase; letter-spacing: 0.07em;
  }
  .form-section-divider::before, .form-section-divider::after {
    content: ''; flex: 1; height: 1px; background: var(--border);
  }

  /* Grid */
  .field-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px 20px; }
  .field-grid .span-2 { grid-column: 1 / -1; }

  /* Field */
  .field { display: flex; flex-direction: column; gap: 5px; }
  .field-label {
    font-size: 11.5px; font-weight: 600; color: var(--text-2);
    letter-spacing: 0.02em;
  }
  .field-required { color: var(--brand); margin-left: 2px; }
  .field-input, .field-select, .field-textarea {
    width: 100%; border: 1.5px solid var(--border-md);
    border-radius: var(--radius-md); padding: 9px 12px;
    font-size: 13.5px; font-family: var(--font-body);
    color: var(--text-1); background: var(--surface-2); outline: none;
    transition: border-color 0.18s, background 0.18s, box-shadow 0.18s;
  }
  .field-input:focus, .field-select:focus, .field-textarea:focus {
    border-color: var(--brand); background: var(--surface);
    box-shadow: 0 0 0 3px rgba(249,115,22,0.1);
  }
  .field-input:hover, .field-select:hover, .field-textarea:hover {
    border-color: rgba(0,0,0,0.22);
  }
  .field-select {
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%239a9892' stroke-width='1.5' fill='none' stroke-linecap='round'/%3E%3C/svg%3E");
    background-repeat: no-repeat; background-position: right 12px center;
    padding-right: 34px;
  }
  .field-textarea { resize: vertical; min-height: 80px; line-height: 1.5; }
  .field-input[readonly] { background: var(--surface-3); color: var(--text-3); cursor: not-allowed; }
  .error-msg { color: var(--danger); font-size: 11.5px; margin-top: 2px; }

  /* ── Form Footer ── */
  .form-footer {
    display: flex; align-items: center; justify-content: space-between;
    padding: 18px 26px; background: var(--surface-2);
    border-top: 1px solid var(--border); flex-wrap: wrap; gap: 12px;
  }
  .form-footer-left  { font-size: 12px; color: var(--text-3); }
  .form-footer-right { display: flex; gap: 10px; }

  .btn {
    display: inline-flex; align-items: center; gap: 7px;
    border: none; border-radius: var(--radius-md);
    padding: 10px 22px; font-size: 13.5px; font-weight: 500;
    font-family: var(--font-body); cursor: pointer;
    transition: all 0.18s; white-space: nowrap;
  }
  .btn-save   { background: var(--brand); color: #fff; }
  .btn-save:hover { background: var(--brand-dark); box-shadow: 0 4px 14px rgba(249,115,22,0.35); }
  .btn-reset  { background: var(--surface); color: var(--text-2); border: 1.5px solid var(--border-md); }
  .btn-reset:hover { background: var(--surface-3); }

  /* ── Success Toast ── */
  .toast {
    position: fixed; bottom: 28px; right: 28px; z-index: 9999;
    background: #1a1a18; color: #fff; border-radius: var(--radius-lg);
    padding: 14px 20px; font-size: 13.5px; font-family: var(--font-body);
    display: flex; align-items: center; gap: 10px;
    box-shadow: 0 8px 30px rgba(0,0,0,0.2);
    transform: translateY(80px); opacity: 0;
    transition: transform 0.3s ease, opacity 0.3s ease;
  }
  .toast.show { transform: translateY(0); opacity: 1; }
  .toast-icon { font-size: 18px; }

  /* ── Responsive ── */
  @media (max-width: 900px) {
    .edit-layout { grid-template-columns: 1fr; }
    .left-panel  { display: grid; grid-template-columns: 1fr 1fr; }
  }
  @media (max-width: 600px) {
    .field-grid { grid-template-columns: 1fr; }
    .field-grid .span-2 { grid-column: 1; }
    .left-panel { grid-template-columns: 1fr; }
    .edit-page  { padding: 14px 12px 60px; }
  }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="edit-page">

  <%-- ── Top Bar ── --%>
  <div class="edit-topbar">
    <div class="edit-topbar-left">
      <a href="AdminDashboard.aspx" class="back-btn">← Back to Dashboard</a>
      <div>
        <div class="edit-topbar-title">Edit Student Record</div>
        <div class="edit-topbar-sub">Admin — Success24</div>
      </div>
    </div>
    <asp:Label ID="lblStudentID" runat="server" CssClass="student-id-pill"></asp:Label>
  </div>

  <%-- ── Two-column Layout ── --%>
  <div class="edit-layout">

    <%-- ── LEFT: Photo + Status + Info ── --%>
    <div class="left-panel">

      <div class="photo-card">

        <%-- Photo Preview --%>
        <div class="photo-frame" id="photoFrame">
          <asp:Image ID="imgPhoto" runat="server" Visible="false" />
          <div id="photoInitials" class="photo-initials">
            <asp:Label ID="lblInitials" runat="server"></asp:Label>
          </div>
        </div>

        <div class="photo-name"><asp:Label ID="lblFullName" runat="server"></asp:Label></div>
        <div class="photo-course"><asp:Label ID="lblCourseLabel" runat="server"></asp:Label></div>

        <%-- Active / Inactive Toggle --%>
        <div class="status-toggle-wrap">
          <span class="status-toggle-lbl">Student Status</span>
          <asp:LinkButton ID="lbStatusToggle" runat="server"
              OnClick="lbStatusToggle_Click"
              OnClientClick="return confirm('Are you sure you want to change this student\'s status?');"
              CausesValidation="false">
            <div id="togglePill" runat="server" class="toggle-pill"></div>
          </asp:LinkButton>
        </div>
        <div style="text-align:center; margin-bottom:16px;">
          <asp:Label ID="lblStatusText" runat="server" style="font-size:12px;font-weight:600;"></asp:Label>
        </div>

        <%-- Photo Upload / Delete --%>
        <div class="photo-actions">
          <asp:Panel ID="pnlUpload" runat="server">
            <label class="upload-label">
              📷 Upload New Photo
              <asp:FileUpload ID="fuPhoto" runat="server" accept="image/*" />
            </label>
          </asp:Panel>
          <asp:Panel ID="pnlDeletePhoto" runat="server" Visible="false">
            <asp:Button ID="btnDeletePhoto" runat="server" Text="🗑️ Remove Photo"
                CssClass="btn-del-photo" OnClick="btnDeletePhoto_Click"
                OnClientClick="return confirm('Remove this photo permanently?');"
                CausesValidation="false" />
          </asp:Panel>
          <div class="photo-hint">JPG or PNG · Max 2MB</div>
        </div>

      </div>

      <%-- Quick Info Card --%>
      <div class="info-card">
        <div class="info-card-title">Record Info</div>
        <div class="info-row">
          <span class="info-row-lbl">Student ID</span>
          <span class="info-row-val"><asp:Label ID="lblIDValue" runat="server"></asp:Label></span>
        </div>
        <div class="info-row">
          <span class="info-row-lbl">Registered On</span>
          <span class="info-row-val"><asp:Label ID="lblCreatedOn" runat="server"></asp:Label></span>
        </div>
        <div class="info-row">
          <span class="info-row-lbl">Batch No</span>
          <span class="info-row-val"><asp:Label ID="lblBatchInfo" runat="server"></asp:Label></span>
        </div>
        <div class="info-row">
          <span class="info-row-lbl">Course</span>
          <span class="info-row-val"><asp:Label ID="lblCourseInfo" runat="server"></asp:Label></span>
        </div>
      </div>

    </div>

    <%-- ── RIGHT: Edit Form ── --%>
    <div class="form-card">

      <div class="form-section-header">
        <div class="section-icon" style="background:#fff4ec;">✏️</div>
        <div>
          <div class="section-title">Student Information</div>
          <div class="section-desc">All fields marked * are required</div>
        </div>
      </div>

      <div class="form-body">
        <div class="field-grid">

          <%-- ── Personal ── --%>
          <div class="form-section-divider span-2">Personal Details</div>

          <div class="field">
            <label class="field-label">First Name <span class="field-required">*</span></label>
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="field-input"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <div class="field">
            <label class="field-label">Last Name <span class="field-required">*</span></label>
            <asp:TextBox ID="txtLastName" runat="server" CssClass="field-input"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <div class="field">
            <label class="field-label">Date of Birth <span class="field-required">*</span></label>
            <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="field-input"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDOB"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <div class="field">
            <label class="field-label">Father Name <span class="field-required">*</span></label>
            <asp:TextBox ID="txtFatherName" runat="server" CssClass="field-input"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFatherName"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <%-- ── Academic (Admin Only) ── --%>
          <div class="form-section-divider span-2">Academic & Batch</div>

          <div class="field">
            <label class="field-label">Course <span class="field-required">*</span></label>
            <asp:DropDownList ID="ddlCourse" runat="server" CssClass="field-select">
              <asp:ListItem Value="">Select Course</asp:ListItem>
              <asp:ListItem>Web Development</asp:ListItem>
              <asp:ListItem>Data Science</asp:ListItem>
              <asp:ListItem>DevOps</asp:ListItem>
              <asp:ListItem>AI & ML</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCourse"
                InitialValue="" ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <div class="field">
            <label class="field-label">Batch No <span class="field-required">*</span> <span style="font-size:10.5px;color:var(--brand);font-weight:400;">(Admin only)</span></label>
            <asp:TextBox ID="txtBatch" runat="server" CssClass="field-input" placeholder="e.g. 101"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBatch"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <div class="field">
            <label class="field-label">Qualification <span class="field-required">*</span></label>
            <asp:TextBox ID="txtQualification" runat="server" CssClass="field-input"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtQualification"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <div class="field">
            <label class="field-label">Passout Year <span class="field-required">*</span></label>
            <asp:TextBox ID="txtPassout" runat="server" CssClass="field-input"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassout"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <%-- ── Contact ── --%>
          <div class="form-section-divider span-2">Contact Details</div>

          <div class="field">
            <label class="field-label">Primary Mobile <span class="field-required">*</span></label>
            <asp:TextBox ID="txtPrimaryMobile" runat="server" CssClass="field-input"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPrimaryMobile"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <div class="field">
            <label class="field-label">Secondary Mobile</label>
            <asp:TextBox ID="txtSecondaryMobile" runat="server" CssClass="field-input"></asp:TextBox>
          </div>

          <div class="field">
            <label class="field-label">WhatsApp No <span class="field-required">*</span></label>
            <asp:TextBox ID="txtWhatsapp" runat="server" CssClass="field-input"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtWhatsapp"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <div class="field">
            <label class="field-label">Parent Mobile <span class="field-required">*</span></label>
            <asp:TextBox ID="txtParentMobile" runat="server" CssClass="field-input"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtParentMobile"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <div class="field">
            <label class="field-label">Primary Email <span class="field-required">*</span></label>
            <asp:TextBox ID="txtEmail1" runat="server" CssClass="field-input"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail1"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <div class="field">
            <label class="field-label">Secondary Email</label>
            <asp:TextBox ID="txtEmail2" runat="server" CssClass="field-input"></asp:TextBox>
          </div>

          <%-- ── Identity ── --%>
          <div class="form-section-divider span-2">Identity Documents</div>

          <div class="field">
            <label class="field-label">Aadhar Card No <span class="field-required">*</span></label>
            <asp:TextBox ID="txtAadhar" runat="server" CssClass="field-input"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAadhar"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <div class="field">
            <label class="field-label">PAN Card No <span class="field-required">*</span></label>
            <asp:TextBox ID="txtPAN" runat="server" CssClass="field-input"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPAN"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <div class="field">
            <label class="field-label">Voter ID</label>
            <asp:TextBox ID="txtVoter" runat="server" CssClass="field-input"></asp:TextBox>
          </div>

          <div class="field">
            <label class="field-label">Passport No</label>
            <asp:TextBox ID="txtPassport" runat="server" CssClass="field-input"></asp:TextBox>
          </div>

          <div class="field">
            <label class="field-label">Reference Name</label>
            <asp:TextBox ID="txtReference" runat="server" CssClass="field-input"></asp:TextBox>
          </div>

          <%-- ── Address ── --%>
          <div class="form-section-divider span-2">Address</div>

          <div class="field span-2">
            <label class="field-label">Current Address <span class="field-required">*</span></label>
            <asp:TextBox ID="txtCurrentAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="field-textarea"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCurrentAddress"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

          <div class="field span-2">
            <label class="field-label">Permanent Address <span class="field-required">*</span></label>
            <asp:TextBox ID="txtPermanentAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="field-textarea"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPermanentAddress"
                ErrorMessage="Required" CssClass="error-msg" Display="Dynamic" />
          </div>

        </div>
      </div>

      <%-- ── Footer Buttons ── --%>
      <div class="form-footer">
        <div class="form-footer-left">
          🔒 Changes are saved immediately to the database
        </div>
        <div class="form-footer-right">
          <a href="AdminDashboard.aspx" class="btn btn-reset" style="text-decoration:none;">Cancel</a>
          <asp:Button ID="btnSave" runat="server" Text="💾 Save Changes"
              CssClass="btn btn-save" OnClick="btnSave_Click" />
        </div>
      </div>

    </div>
  </div>
</div>

<%-- Toast notification --%>
<div id="toast" class="toast">
  <span class="toast-icon">✅</span>
  <span id="toastMsg">Changes saved successfully!</span>
</div>

<%-- Show toast if triggered from server --%>
<asp:HiddenField ID="hfShowToast" runat="server" Value="" />
<asp:HiddenField ID="hfToastMsg"  runat="server" Value="" />

<script>
  window.addEventListener('load', function () {
    var show = document.getElementById('<%= hfShowToast.ClientID %>').value;
    var msg  = document.getElementById('<%= hfToastMsg.ClientID %>').value;
    if (show === '1' && msg) {
      var t = document.getElementById('toast');
      document.getElementById('toastMsg').textContent = msg;
      t.classList.add('show');
      setTimeout(function () { t.classList.remove('show'); }, 3500);
      document.getElementById('<%= hfShowToast.ClientID %>').value = '';
    }
  });
</script>
</asp:Content>
