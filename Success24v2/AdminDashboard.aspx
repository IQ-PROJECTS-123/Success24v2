<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Success24v2.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500;600&family=Syne:wght@600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --brand: #f97316;
            --brand-dark: #c2560e;
            --brand-soft: #fff4ec;
            --danger: #ef4444;
            --success: #16a34a;
            --warning: #d97706;
            --info: #2563eb;
            --surface: #ffffff;
            --surface-2: #f8f7f4;
            --surface-3: #f1ede8;
            --border: rgba(0,0,0,0.08);
            --border-md: rgba(0,0,0,0.14);
            --text-1: #141412;
            --text-2: #5c5b57;
            --text-3: #9a9892;
            --radius-sm: 6px;
            --radius-md: 10px;
            --radius-lg: 16px;
            --radius-xl: 22px;
            --shadow-sm: 0 1px 3px rgba(0,0,0,0.07);
            --shadow-md: 0 4px 16px rgba(0,0,0,0.09);
            --shadow-lg: 0 12px 40px rgba(0,0,0,0.12);
            --font-head: 'Syne', sans-serif;
            --font-body: 'DM Sans', sans-serif;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body, .admin-wrap {
            font-family: var(--font-body);
            color: var(--text-1);
        }

        /* ── Page Wrapper ── */
        .admin-wrap {
            background: var(--surface-2);
            min-height: 100vh;
            padding: 28px 24px 60px;
        }

        /* ── Top Bar ── */
        .topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: var(--radius-xl);
            padding: 14px 24px;
            margin-bottom: 28px;
            box-shadow: var(--shadow-sm);
        }

        .topbar-brand {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .topbar-logo {
            width: 38px;
            height: 38px;
            border-radius: 10px;
            background: linear-gradient(135deg, #f97316, #ef4444);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            color: #fff;
            font-weight: 700;
            flex-shrink: 0;
        }

        .topbar-title {
            font-family: var(--font-head);
            font-size: 1.15rem;
            color: var(--text-1);
            line-height: 1.2;
        }

        .topbar-sub {
            font-size: 11.5px;
            color: var(--text-3);
            margin-top: 1px;
        }

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .admin-pill {
            background: var(--brand-soft);
            color: var(--brand-dark);
            border: 1px solid rgba(249,115,22,0.2);
            border-radius: 20px;
            padding: 5px 12px;
            font-size: 12px;
            font-weight: 600;
            letter-spacing: 0.02em;
        }

        .btn-logout-top {
            background: var(--surface-3);
            color: var(--text-2);
            border: 1px solid var(--border-md);
            border-radius: var(--radius-md);
            padding: 8px 16px;
            font-size: 13px;
            font-weight: 500;
            cursor: pointer;
            font-family: var(--font-body);
            transition: background 0.18s, color 0.18s;
        }

            .btn-logout-top:hover {
                background: #fee2e2;
                color: var(--danger);
                border-color: rgba(239,68,68,0.3);
            }

        /* ── Stats Grid ── */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 14px;
            margin-bottom: 24px;
        }

        .stat-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            padding: 20px 18px;
            box-shadow: var(--shadow-sm);
            position: relative;
            overflow: hidden;
            transition: transform 0.18s, box-shadow 0.18s;
        }

            .stat-card:hover {
                transform: translateY(-2px);
                box-shadow: var(--shadow-md);
            }

            .stat-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 3px;
                border-radius: var(--radius-lg) var(--radius-lg) 0 0;
                background: var(--c, #f97316);
            }

        .stat-icon {
            width: 36px;
            height: 36px;
            border-radius: var(--radius-sm);
            background: var(--ic, #fff4ec);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            margin-bottom: 14px;
        }

        .stat-val {
            font-family: var(--font-head);
            font-size: 2rem;
            font-weight: 700;
            color: var(--text-1);
            line-height: 1;
            margin-bottom: 5px;
        }

        .stat-lbl {
            font-size: 11.5px;
            color: var(--text-3);
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.06em;
        }

        /* ── Toolbar Card ── */
        .toolbar-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            padding: 16px 20px;
            margin-bottom: 16px;
            box-shadow: var(--shadow-sm);
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
        }

        .toolbar-group {
            display: flex;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
        }

        .search-wrap {
            position: relative;
            flex: 1;
            min-width: 200px;
            max-width: 280px;
        }

        .search-icon {
            position: absolute;
            left: 11px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-3);
            font-size: 14px;
            pointer-events: none;
        }

        .search-input {
            width: 100%;
            border: 1.5px solid var(--border-md);
            border-radius: var(--radius-md);
            padding: 9px 12px 9px 34px;
            font-size: 13px;
            font-family: var(--font-body);
            color: var(--text-1);
            background: var(--surface-2);
            outline: none;
            transition: border-color 0.18s, background 0.18s;
        }

            .search-input:focus {
                border-color: var(--brand);
                background: var(--surface);
            }

        .filter-select {
            border: 1.5px solid var(--border-md);
            border-radius: var(--radius-md);
            padding: 9px 32px 9px 12px;
            font-size: 13px;
            font-family: var(--font-body);
            color: var(--text-1);
            background: var(--surface-2);
            outline: none;
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%239a9892' stroke-width='1.5' fill='none' stroke-linecap='round'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px center;
            transition: border-color 0.18s;
        }

            .filter-select:focus {
                border-color: var(--brand);
            }

        .toolbar-divider {
            width: 1px;
            height: 28px;
            background: var(--border);
            flex-shrink: 0;
        }

        .toolbar-right {
            margin-left: auto;
            display: flex;
            gap: 8px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            border: none;
            border-radius: var(--radius-md);
            padding: 9px 16px;
            font-size: 13px;
            font-weight: 500;
            font-family: var(--font-body);
            cursor: pointer;
            transition: all 0.18s;
            white-space: nowrap;
        }

        .btn-primary {
            background: var(--brand);
            color: #fff;
        }

            .btn-primary:hover {
                background: var(--brand-dark);
            }

        .btn-ghost {
            background: var(--surface-3);
            color: var(--text-2);
            border: 1px solid var(--border-md);
        }

            .btn-ghost:hover {
                background: var(--surface);
                color: var(--text-1);
            }

        .btn-success {
            background: var(--success);
            color: #fff;
        }

            .btn-success:hover {
                background: #15803d;
            }

        /* ── Table Card ── */
        .table-card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-sm);
            overflow: hidden;
        }

        .table-card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 22px 14px;
            border-bottom: 1px solid var(--border);
        }

        .table-card-title {
            font-family: var(--font-head);
            font-size: 1rem;
            color: var(--text-1);
        }

        .table-card-sub {
            font-size: 12px;
            color: var(--text-3);
            margin-top: 2px;
        }

        .record-count {
            background: var(--brand-soft);
            color: var(--brand-dark);
            border: 1px solid rgba(249,115,22,0.15);
            border-radius: 20px;
            padding: 4px 12px;
            font-size: 12px;
            font-weight: 600;
        }

        /* ── Scrollable Table Wrapper ── */
        .table-scroll {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

            .table-scroll::-webkit-scrollbar {
                height: 5px;
            }

            .table-scroll::-webkit-scrollbar-track {
                background: var(--surface-2);
            }

            .table-scroll::-webkit-scrollbar-thumb {
                background: var(--border-md);
                border-radius: 10px;
            }

        .data-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
            min-width: 1100px;
        }

            .data-table thead tr {
                background: var(--surface-2);
            }

            .data-table th {
                padding: 11px 14px;
                text-align: left;
                font-size: 11px;
                font-weight: 600;
                color: var(--text-3);
                text-transform: uppercase;
                letter-spacing: 0.07em;
                white-space: nowrap;
                border-bottom: 1px solid var(--border);
                position: sticky;
                top: 0;
                background: var(--surface-2);
                z-index: 2;
            }

            .data-table td {
                padding: 13px 14px;
                border-bottom: 1px solid var(--border);
                color: var(--text-1);
                vertical-align: middle;
                white-space: nowrap;
            }

            .data-table tbody tr {
                transition: background 0.12s;
            }

                .data-table tbody tr:hover td {
                    background: var(--brand-soft);
                }

                .data-table tbody tr:last-child td {
                    border-bottom: none;
                }

        /* ── Avatar ── */
        .student-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid var(--border-md);
            display: block;
            flex-shrink: 0;
        }

        .avatar-placeholder {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: var(--surface-3);
            border: 2px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 13px;
            font-weight: 600;
            color: var(--text-3);
            flex-shrink: 0;
        }

        .student-cell {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .student-name {
            font-weight: 500;
            color: var(--text-1);
        }

        .student-meta {
            font-size: 11.5px;
            color: var(--text-3);
        }

        /* ── Badges ── */
        .badge {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            border-radius: 20px;
            padding: 3px 10px;
            font-size: 11px;
            font-weight: 600;
            letter-spacing: 0.02em;
            white-space: nowrap;
        }

        .badge-dot {
            width: 5px;
            height: 5px;
            border-radius: 50%;
            flex-shrink: 0;
        }

        .badge-active {
            background: #dcfce7;
            color: #15803d;
        }

            .badge-active .badge-dot {
                background: #16a34a;
            }

        .badge-inactive {
            background: #fee2e2;
            color: #b91c1c;
        }

            .badge-inactive .badge-dot {
                background: #ef4444;
            }

        /* ── Action Buttons ── */
        .action-group {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .act-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            border-radius: var(--radius-sm);
            border: 1px solid var(--border-md);
            background: var(--surface);
            cursor: pointer;
            font-size: 14px;
            transition: all 0.15s;
            text-decoration: none;
            flex-shrink: 0;
        }

            .act-btn:hover {
                transform: scale(1.08);
            }

        .act-btn-edit {
            color: var(--info);
        }

            .act-btn-edit:hover {
                background: #eff6ff;
                border-color: rgba(37,99,235,0.3);
            }

        .act-btn-activate {
            color: var(--success);
        }

            .act-btn-activate:hover {
                background: #f0fdf4;
                border-color: rgba(22,163,74,0.3);
            }

        .act-btn-deactivate {
            color: var(--warning);
        }

            .act-btn-deactivate:hover {
                background: #fffbeb;
                border-color: rgba(217,119,6,0.3);
            }

        .act-btn-delete {
            color: var(--danger);
        }

            .act-btn-delete:hover {
                background: #fef2f2;
                border-color: rgba(239,68,68,0.3);
            }

        /* ── Pager ── */
        .pager-row td {
            padding: 14px 22px !important;
            background: var(--surface-2) !important;
            text-align: center;
            border-top: 1px solid var(--border);
        }

            .pager-row td table {
                margin: 0 auto;
            }

                .pager-row td table td {
                    border: none !important;
                    padding: 0 3px !important;
                    background: transparent !important;
                }

            .pager-row td a, .pager-row td span {
                display: inline-block;
                min-width: 32px;
                height: 32px;
                line-height: 32px;
                text-align: center;
                border-radius: var(--radius-sm);
                font-size: 13px;
                font-weight: 500;
                text-decoration: none;
                border: 1px solid var(--border-md);
                color: var(--text-2);
                transition: all 0.15s;
            }

                .pager-row td a:hover {
                    background: var(--brand-soft);
                    border-color: rgba(249,115,22,0.3);
                    color: var(--brand);
                }

            .pager-row td span {
                background: var(--brand);
                color: #fff;
                border-color: var(--brand);
            }

        /* ── Empty State ── */
        .empty-state {
            text-align: center;
            padding: 64px 24px;
        }

        .empty-state-icon {
            font-size: 40px;
            margin-bottom: 16px;
            opacity: 0.4;
        }

        .empty-state-title {
            font-family: var(--font-head);
            font-size: 1.1rem;
            color: var(--text-2);
            margin-bottom: 6px;
        }

        .empty-state-sub {
            font-size: 13px;
            color: var(--text-3);
        }

        /* ── Modal ── */
        .modal-backdrop {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(10,10,8,0.55);
            z-index: 9999;
            align-items: center;
            justify-content: center;
            backdrop-filter: blur(3px);
        }

            .modal-backdrop.open {
                display: flex;
            }

        .modal {
            background: var(--surface);
            border-radius: var(--radius-xl);
            padding: 32px 28px;
            width: 100%;
            max-width: 420px;
            box-shadow: var(--shadow-lg);
            border: 1px solid var(--border);
            animation: modal-in 0.22s ease;
        }

        @keyframes modal-in {
            from {
                opacity: 0;
                transform: scale(0.95) translateY(8px);
            }

            to {
                opacity: 1;
                transform: none;
            }
        }

        .modal-icon {
            width: 48px;
            height: 48px;
            border-radius: 14px;
            background: #fee2e2;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            margin-bottom: 16px;
        }

        .modal-title {
            font-family: var(--font-head);
            font-size: 1.1rem;
            color: var(--text-1);
            margin-bottom: 6px;
        }

        .modal-desc {
            font-size: 13px;
            color: var(--text-2);
            margin-bottom: 20px;
            line-height: 1.5;
        }

        .modal-label {
            font-size: 12px;
            font-weight: 600;
            color: var(--text-2);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin-bottom: 7px;
            display: block;
        }

        .modal-textarea {
            width: 100%;
            border: 1.5px solid var(--border-md);
            border-radius: var(--radius-md);
            padding: 10px 12px;
            font-size: 13px;
            font-family: var(--font-body);
            color: var(--text-1);
            resize: vertical;
            min-height: 90px;
            outline: none;
            transition: border-color 0.18s;
            background: var(--surface-2);
        }

            .modal-textarea:focus {
                border-color: var(--danger);
                background: var(--surface);
            }

        .modal-error {
            color: var(--danger);
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }

        .modal-actions {
            display: flex;
            gap: 10px;
            margin-top: 20px;
            justify-content: flex-end;
        }

        .modal-cancel {
            background: var(--surface-3);
            color: var(--text-2);
            border: 1px solid var(--border-md);
            border-radius: var(--radius-md);
            padding: 9px 18px;
            font-size: 13px;
            font-weight: 500;
            cursor: pointer;
            font-family: var(--font-body);
            transition: background 0.15s;
        }

            .modal-cancel:hover {
                background: var(--surface);
            }

        .modal-confirm {
            background: var(--danger);
            color: #fff;
            border: none;
            border-radius: var(--radius-md);
            padding: 9px 20px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            font-family: var(--font-body);
            transition: background 0.15s;
        }

            .modal-confirm:hover {
                background: #dc2626;
            }

        /* ── Responsive ── */
        @media (max-width: 1024px) {
            .stats-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 640px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .admin-wrap {
                padding: 16px 12px 40px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-wrap">

        <%-- ── Top Bar ── --%>
        <div class="topbar">
            <div class="topbar-brand">
                <div class="topbar-logo">S</div>
                <div>
                    <div class="topbar-title">Success24 Admin</div>
                    <div class="topbar-sub">Student Management System</div>
                </div>
            </div>
            <div class="topbar-right">
                <span class="admin-pill">⚡ Admin</span>
                <asp:LinkButton ID="btnLogout" runat="server" CssClass="btn-logout-top"
                    OnClick="btnLogout_Click">Sign out →</asp:LinkButton>
            </div>
        </div>

        <%-- ── Stats ── --%>
        <div class="stats-grid">
            <div class="stat-card" style="--c: #f97316; --ic: #fff4ec;">
                <div class="stat-icon">👥</div>
                <div class="stat-val">
                    <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label></div>
                <div class="stat-lbl">Total Students</div>
            </div>
            <div class="stat-card" style="--c: #16a34a; --ic: #f0fdf4;">
                <div class="stat-icon">✅</div>
                <div class="stat-val">
                    <asp:Label ID="lblActive" runat="server" Text="0"></asp:Label></div>
                <div class="stat-lbl">Active</div>
            </div>
            <div class="stat-card" style="--c: #ef4444; --ic: #fef2f2;">
                <div class="stat-icon">⛔</div>
                <div class="stat-val">
                    <asp:Label ID="lblInactive" runat="server" Text="0"></asp:Label></div>
                <div class="stat-lbl">Inactive</div>
            </div>
            <div class="stat-card" style="--c: #2563eb; --ic: #eff6ff;">
                <div class="stat-icon">📅</div>
                <div class="stat-val">
                    <asp:Label ID="lblThisMonth" runat="server" Text="0"></asp:Label></div>
                <div class="stat-lbl">Joined This Month</div>
            </div>
            <div class="stat-card" style="--c: #7c3aed; --ic: #f5f3ff;">
                <div class="stat-icon">🎓</div>
                <div class="stat-val">
                    <asp:Label ID="lblCourses" runat="server" Text="0"></asp:Label></div>
                <div class="stat-lbl">Courses Running</div>
            </div>
        </div>

        <%-- ── Toolbar ── --%>
        <div class="toolbar-card">
            <div class="toolbar-group">
                <div class="search-wrap">
                    <span class="search-icon">🔍</span>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input"
                        placeholder="Search name, email, mobile..."></asp:TextBox>
                </div>

                <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="filter-select">
                    <asp:ListItem Value="All">All Status</asp:ListItem>
                    <asp:ListItem Value="1">Active</asp:ListItem>
                    <asp:ListItem Value="0">Inactive</asp:ListItem>
                </asp:DropDownList>

                <asp:DropDownList ID="ddlBatchFilter" runat="server" CssClass="filter-select">
                    <asp:ListItem Value="0">All Batches</asp:ListItem>
                </asp:DropDownList>

                <asp:Button ID="btnSearch" runat="server" Text="Search"
                    CssClass="btn btn-primary" OnClick="btnSearch_Click" CausesValidation="false" />
                <asp:Button ID="btnClear" runat="server" Text="Clear"
                    CssClass="btn btn-ghost" OnClick="btnClear_Click" CausesValidation="false" />
            </div>

            <div class="toolbar-right">
                <asp:Button ID="btnExcel" runat="server" Text="↓ Export Excel"
                    CssClass="btn btn-success" OnClick="btnExcel_Click" CausesValidation="false" />
            </div>
        </div>

        <%-- ── Table Card ── --%>
        <div class="table-card">
            <div class="table-card-header">
                <div>
                    <div class="table-card-title">Student Records</div>
                    <div class="table-card-sub">Showing all registered students</div>
                </div>
                <asp:Label ID="lblRecordCount" runat="server" CssClass="record-count" Text="0 records"></asp:Label>
            </div>

            <div class="table-scroll">
                <asp:GridView ID="gvStudents" runat="server"
                    CssClass="data-table"
                    AutoGenerateColumns="false"
                    DataKeyNames="ID"
                    AllowPaging="true"
                    PageSize="10"
                    OnPageIndexChanging="gvStudents_PageIndexChanging"
                    OnRowDeleting="gvStudents_RowDeleting"
                    PagerStyle-CssClass="pager-row"
                    GridLines="None">

                    <EmptyDataTemplate>
                        <div class="empty-state">
                            <div class="empty-state-icon">📭</div>
                            <div class="empty-state-title">No records found</div>
                            <div class="empty-state-sub">Try adjusting your search or filter criteria</div>
                        </div>
                    </EmptyDataTemplate>

                    <Columns>

                        <%-- Photo + Name combined ─ first visible column --%>
                        <asp:TemplateField HeaderText="Student">
                            <ItemTemplate>
                                <div class="student-cell">
                                    <%# string.IsNullOrEmpty(Eval("PhotoPath").ToString())
                    ? "<div class='avatar-placeholder'>" + Eval("FirstName").ToString().Substring(0,1).ToUpper() + "</div>"
                    : "<img class='student-avatar' src='FormPics/" + Eval("PhotoPath") + "' alt='photo' />" %>
                                    <div>
                                        <div class="student-name"><%# Eval("FirstName") %> <%# Eval("LastName") %></div>
                                        <div class="student-meta"><%# Eval("Email1") %></div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Course" HeaderText="Course" />
                        <asp:BoundField DataField="BatchNo" HeaderText="Batch" />
                        <asp:BoundField DataField="PrimaryMobile" HeaderText="Mobile" />
                        <asp:BoundField DataField="FatherName" HeaderText="Father Name" />
                        <asp:BoundField DataField="AadharNo" HeaderText="Aadhar No" />

                        <asp:BoundField DataField="CreatedOn" HeaderText="Registered On"
                            DataFormatString="{0:dd MMM yyyy}" />

                        <%-- Status Badge --%>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class='<%# (Eval("Active") != DBNull.Value && Convert.ToBoolean(Eval("Active"))) ? "badge badge-active" : "badge badge-inactive" %>'>
                                    <span class="badge-dot"></span>
                                    <%# (Eval("Active") != DBNull.Value && Convert.ToBoolean(Eval("Active"))) ? "Active" : "Inactive" %>
              </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%-- Actions ── sticky last column --%>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div class="action-group">

                                    <%-- Edit --%>
                                    <a href='AdminEditStudent.aspx?id=<%# Eval("ID") %>' class="act-btn act-btn-edit">✏️</a>


                                    <%-- Toggle Active/Inactive --%>
                                    <asp:LinkButton ID="lbToggle" runat="server"
                                        CommandArgument='<%# Eval("ID") + "," + (Eval("Active") != DBNull.Value ? Eval("Active").ToString() : "False") %>'
                                        CssClass='<%# (Eval("Active") != DBNull.Value && Convert.ToBoolean(Eval("Active"))) ? "act-btn act-btn-deactivate" : "act-btn act-btn-activate" %>'
                                        Title='<%# (Eval("Active") != DBNull.Value && Convert.ToBoolean(Eval("Active"))) ? "Deactivate student" : "Activate student" %>'
                                        OnClick="lbToggle_Click"
                                        OnClientClick='<%# (Eval("Active") != DBNull.Value && Convert.ToBoolean(Eval("Active")))
                        ? "return confirm(\"Deactivate this student? They will be marked inactive.\");"
                        : "return confirm(\"Activate this student?\");" %>'>
                  <%# (Eval("Active") != DBNull.Value && Convert.ToBoolean(Eval("Active"))) ? "⛔" : "✅" %>
                </asp:LinkButton>

                                    <%-- Soft Delete --%>
                                    <button type="button"
                                        class="act-btn act-btn-delete" title="Delete record"
                                        onclick="openDeleteModal('<%# Eval("ID") %>', '<%# Eval("FirstName") %> <%# Eval("LastName") %>')">
                                        🗑️
               
                                    </button>

                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <%-- Hidden fields for modal --%>
        <asp:HiddenField ID="hfDeleteID" runat="server" />
        <asp:HiddenField ID="hfDeleteReason" runat="server" />
        <asp:Button ID="btnConfirmDelete" runat="server"
            Text="x"
            Style="display: none !important; visibility: hidden; position: absolute;"
            OnClick="btnConfirmDelete_Click"
            CausesValidation="false"
            UseSubmitBehavior="false" />

    </div>

    <%-- ── Delete Modal ── --%>
    <div id="deleteModal" class="modal-backdrop">
        <div class="modal">
            <div class="modal-icon">🗑️</div>
            <div class="modal-title">Delete Student Record</div>
            <div class="modal-desc" id="modalStudentName">
                This will mark the student as inactive. The record is kept for future reference — no data is permanently deleted.
   
            </div>
            <label class="modal-label">Reason for deletion <span style="color: var(--danger)">*</span></label>
            <textarea id="txtDeleteReason" class="modal-textarea"
                placeholder="e.g. Student dropped out, duplicate entry, moved institute..."></textarea>
            <div id="reasonError" class="modal-error">Please enter a reason to continue.</div>
            <div class="modal-actions">
                <button type="button" class="modal-cancel" onclick="closeDeleteModal()">Cancel</button>
                <button type="button" class="modal-confirm" onclick="confirmDelete()">Delete Record</button>
            </div>
        </div>
    </div>

    <script>
        var pendingDeleteID = '';

        function openDeleteModal(id, name) {
            pendingDeleteID = id;
            document.getElementById('modalStudentName').textContent =
                'Student: ' + name + ' — record will be kept but marked inactive.';
            document.getElementById('txtDeleteReason').value = '';
            document.getElementById('reasonError').classList.add('hidden');
            document.getElementById('deleteModal').classList.remove('hidden');
            setTimeout(function () { document.getElementById('txtDeleteReason').focus(); }, 100);
        }

        function closeDeleteModal() {
            document.getElementById('deleteModal').classList.add('hidden');
            pendingDeleteID = '';
        }

        function confirmDelete() {
            var reason = document.getElementById('txtDeleteReason').value.trim();
            if (!reason) {
                document.getElementById('reasonError').classList.remove('hidden');
                document.getElementById('txtDeleteReason').focus();
                return;
            }

            // ✅ Set hidden fields FIRST
            document.getElementById('<%= hfDeleteID.ClientID %>').value = pendingDeleteID;
        document.getElementById('<%= hfDeleteReason.ClientID %>').value = reason;

        // ✅ Hide modal AFTER setting values
        document.getElementById('deleteModal').classList.add('hidden');

        // ✅ Small delay before postback so DOM settles
        setTimeout(function () {
            document.getElementById('<%= btnConfirmDelete.ClientID %>').click();
    }, 50);
        }

        // Close on backdrop click
        document.getElementById('deleteModal').addEventListener('click', function (e) {
            if (e.target === this) closeDeleteModal();
        });

        // Close on Escape key
        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape') closeDeleteModal();
        });
    </script>
</asp:Content>
