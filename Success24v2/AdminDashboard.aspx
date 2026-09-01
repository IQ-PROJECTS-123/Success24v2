<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Success24v2.AdminPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-dashboard-shell{background:#f5f3ef;min-height:100vh;}
        .admin-wrap{max-width:1600px;margin:0 auto;padding:20px 24px 40px;}
        .panel-card{background:#ffffff;border:1px solid #e7e1d8;border-radius:26px;box-shadow:0 2px 10px rgba(15,23,42,.03);}
        .soft-chip{display:inline-flex;align-items:center;gap:.5rem;border:1px solid #eadfd0;background:#faf7f2;border-radius:999px;padding:.65rem 1rem;font-size:.92rem;font-weight:700;color:#7c4a11;}
        .soft-btn,.soft-btn:visited{min-height:2.75rem;padding:0 1rem;border-radius:14px;border:1px solid #ddd4c8;background:#f5f1ea;color:#4b3a27;font-weight:700;display:inline-flex;align-items:center;justify-content:center;text-decoration:none;transition:all .2s ease;}
        .soft-btn:hover{background:#eee7dd;color:#2f2418;text-decoration:none;}
        .btn-orange,.btn-orange:visited{min-height:2.75rem;padding:0 1.15rem;border-radius:14px;border:none;background:linear-gradient(90deg,#ff7a18 0%,#ef4444 100%);color:#fff;font-weight:800;display:inline-flex;align-items:center;justify-content:center;text-decoration:none;box-shadow:0 10px 24px rgba(249,115,22,.18);transition:all .2s ease;}
        .btn-orange:hover{transform:translateY(-1px);color:#fff;text-decoration:none;}
        .btn-green,.btn-green:visited{min-height:2.75rem;padding:0 1.15rem;border-radius:14px;border:none;background:#16a34a;color:#fff;font-weight:800;display:inline-flex;align-items:center;justify-content:center;text-decoration:none;transition:all .2s ease;}
        .btn-green:hover{background:#15803d;color:#fff;text-decoration:none;}
        .filter-input,.filter-select{width:100%;min-height:2.75rem;border:1px solid #ddd4c8;background:#fbfaf8;border-radius:14px;padding:.7rem .95rem;color:#3f3a33;outline:none;box-shadow:none;}
        .filter-input:focus,.filter-select:focus{border-color:#fb923c;box-shadow:0 0 0 4px rgba(251,146,60,.12);background:#fff;}
        .stats-grid{display:grid;grid-template-columns:repeat(5,minmax(0,1fr));gap:16px;}
        .stat-box{position:relative;overflow:hidden;border-radius:22px;border:1px solid #e7e1d8;background:#fff;min-height:158px;padding:20px 22px;box-shadow:0 2px 8px rgba(15,23,42,.03);}
        .stat-top-line{position:absolute;inset:0 0 auto 0;height:4px;border-radius:22px 22px 0 0;}
        .stat-line-orange{background:#f97316}.stat-line-green{background:#16a34a}.stat-line-red{background:#ef4444}.stat-line-blue{background:#2563eb}.stat-line-violet{background:#7c3aed}
        .stat-icon{width:40px;height:40px;border-radius:12px;display:inline-flex;align-items:center;justify-content:center;font-size:18px;margin-bottom:18px;}
        .stat-icon-orange{background:#fff1e8;color:#f97316}.stat-icon-green{background:#eaf8ef;color:#16a34a}.stat-icon-red{background:#ffedf0;color:#ef4444}.stat-icon-blue{background:#edf4ff;color:#2563eb}.stat-icon-violet{background:#f3efff;color:#7c3aed}
        .stat-number{font-size:3rem;line-height:1;font-weight:900;color:#111827;letter-spacing:-.03em;}
        .stat-label{margin-top:10px;font-size:.93rem;letter-spacing:.08em;text-transform:uppercase;color:#8b8175;}
        .toolbar-grid{display:grid;grid-template-columns:1.3fr .9fr .9fr .9fr auto auto auto;gap:12px;align-items:center;}
        .records-header{padding:20px 24px;border-bottom:1px solid #ece6dd;}
        .records-table-wrap{overflow-x:auto;}
        .records-table{width:100%;border-collapse:separate;border-spacing:0;min-width:1380px;}
        .records-table thead th{background:#f8f5f0;color:#8b8175;font-size:.82rem;font-weight:800;text-transform:uppercase;letter-spacing:.08em;padding:14px 16px;border-bottom:1px solid #ece6dd;white-space:nowrap;}
        .records-table tbody td{padding:14px 16px;border-bottom:1px solid #f0ebe3;color:#1f2937;vertical-align:middle;}
        .records-table tbody tr:hover td{background:#fcfaf7;}
        .student-cell{display:flex;align-items:center;gap:14px;min-width:260px;}
        .student-avatar{width:54px;height:54px;border-radius:999px;object-fit:cover;border:2px solid #e9dfd2;background:#fff;flex-shrink:0;}
        .student-avatar-fallback{width:54px;height:54px;border-radius:999px;display:inline-flex;align-items:center;justify-content:center;background:#eee8e1;border:2px solid #ddd2c4;color:#6d6257;font-weight:800;font-size:1.1rem;flex-shrink:0;}
        .student-name{font-size:1.02rem;font-weight:800;color:#151515;line-height:1.2;}
        .student-email{margin-top:3px;font-size:.9rem;color:#918579;}
        .status-badge{display:inline-flex;align-items:center;gap:6px;border-radius:999px;padding:.35rem .8rem;font-size:.82rem;font-weight:800;line-height:1;}
        .status-verified{background:#def7e6;color:#15803d;}
        .status-rejected{background:#fde2e2;color:#dc2626;}
        .status-pending{background:#ffedd5;color:#c2410c;}
        .status-draft{background:#fef3c7;color:#92400e;}
        .action-group{display:flex;align-items:center;gap:8px;}
        .icon-btn{width:34px;height:34px;border-radius:10px;border:1px solid #e5ddd2;background:#fff;color:#7b6d5c;display:inline-flex;align-items:center;justify-content:center;text-decoration:none!important;font-size:15px;transition:all .2s ease;cursor:pointer;}
        .icon-btn:hover{background:#faf6f1;transform:translateY(-1px);}
        .icon-btn.edit{color:#f97316}.icon-btn.verify{color:#16a34a}.icon-btn.reject{color:#ef4444}
        .count-chip{display:inline-flex;align-items:center;border-radius:999px;padding:.45rem .9rem;background:#fbefe5;color:#c2410c;font-weight:800;font-size:.9rem;border:1px solid #f3d5bd;}
        .empty-row{padding:2rem;text-align:center;color:#7d746a;font-weight:700;}
        @media (max-width:1280px){.stats-grid{grid-template-columns:repeat(2,minmax(0,1fr));}.toolbar-grid{grid-template-columns:repeat(2,minmax(0,1fr));}}
        @media (max-width:767px){.admin-wrap{padding:16px 14px 28px;}.stats-grid{grid-template-columns:1fr;}.toolbar-grid{grid-template-columns:1fr;}}
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="admin-dashboard-shell">
        <div class="admin-wrap">

            <div class="panel-card mb-6 p-6 gsap-reveal">
                <div class="flex flex-col gap-4 lg:flex-row lg:items-center lg:justify-between">
                    <div class="flex items-center gap-4">
                        <div class="h-14 w-14 rounded-2xl bg-orange-500 text-white flex items-center justify-center text-2xl font-black shadow-sm">S</div>
                        <div>
                            <h1 class="text-3xl font-black tracking-tight text-slate-900">Success24 Admin</h1>
                            <p class="mt-1 text-sm text-slate-500">Student Management System</p>
                        </div>
                    </div>

                    <div class="flex flex-wrap items-center gap-3">
                        <span class="soft-chip">⚡ Admin</span>
                         <asp:Button
                         ID="btnLogout"
                         runat="server"
                         Text="Logout"
                         CssClass="soft-btn"
                         OnClick="btnLogout_Click" />
                    </div>
                </div>
            </div>

            <div class="stats-grid mb-6">
                <div class="stat-box gsap-reveal">
                    <div class="stat-top-line stat-line-orange"></div>
                    <div class="stat-icon stat-icon-orange">👥</div>
                    <div class="stat-number"><asp:Literal ID="litTotal" runat="server"></asp:Literal></div>
                    <div class="stat-label">Total Students</div>
                </div>

                <div class="stat-box gsap-reveal">
                    <div class="stat-top-line stat-line-green"></div>
                    <div class="stat-icon stat-icon-green">☑</div>
                    <div class="stat-number"><asp:Literal ID="litActive" runat="server"></asp:Literal></div>
                    <div class="stat-label">Active</div>
                </div>

                <div class="stat-box gsap-reveal">
                    <div class="stat-top-line stat-line-red"></div>
                    <div class="stat-icon stat-icon-red">⛔</div>
                    <div class="stat-number"><asp:Literal ID="litInactive" runat="server"></asp:Literal></div>
                    <div class="stat-label">Inactive</div>
                </div>

                <div class="stat-box gsap-reveal">
                    <div class="stat-top-line stat-line-blue"></div>
                    <div class="stat-icon stat-icon-blue">📅</div>
                    <div class="stat-number"><asp:Literal ID="litJoinedThisMonth" runat="server"></asp:Literal></div>
                    <div class="stat-label">Joined This Month</div>
                </div>

                <div class="stat-box gsap-reveal">
                    <div class="stat-top-line stat-line-violet"></div>
                    <div class="stat-icon stat-icon-violet">🎓</div>
                    <div class="stat-number"><asp:Literal ID="litCoursesRunning" runat="server"></asp:Literal></div>
                    <div class="stat-label">Courses Running</div>
                </div>
            </div>

            <div class="panel-card mb-6 p-6 gsap-reveal">
                <div class="toolbar-grid">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="filter-input" placeholder="Search student name"></asp:TextBox>

                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="filter-select">
                        <asp:ListItem Value="">All Courses</asp:ListItem>
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddlBatch" runat="server" CssClass="filter-select">
                        <asp:ListItem Value="">All Batches</asp:ListItem>
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="filter-select">
                        <asp:ListItem Value="">All Status</asp:ListItem>
                        <asp:ListItem>Draft</asp:ListItem>
                        <asp:ListItem>Pending</asp:ListItem>
                        <asp:ListItem>Verified</asp:ListItem>
                        <asp:ListItem>Rejected</asp:ListItem>
                    </asp:DropDownList>

                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-orange" OnClick="btnSearch_Click" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="soft-btn" OnClick="btnClear_Click" />
                    <asp:Button ID="btnExportExcel" runat="server" Text="↓ Export Excel" CssClass="btn-green" OnClick="btnExportExcel_Click" />
                </div>
            </div>

            <div class="panel-card overflow-hidden gsap-reveal">
                <div class="records-header flex flex-col gap-3 md:flex-row md:items-center md:justify-between">
                    <div>
                        <h2 class="text-3xl font-black tracking-tight text-slate-900">Student Records</h2>
                        <p class="mt-1 text-sm text-slate-500">Showing filtered registered students</p>
                    </div>
                    <div class="count-chip"><asp:Literal ID="litRecordCount" runat="server"></asp:Literal> records</div>
                </div>

                <div class="records-table-wrap">
                    <asp:GridView ID="gvStudents"
                        runat="server"
                        AutoGenerateColumns="false"
                        CssClass="records-table"
                        GridLines="None"
                        ShowHeaderWhenEmpty="true"
                        EmptyDataText="No student records found."
                        OnRowCommand="gvStudents_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Student">
                                <ItemTemplate>
                                    <div class="student-cell">
                                        <asp:PlaceHolder ID="phPhoto" runat="server" Visible='<%# !string.IsNullOrWhiteSpace(Convert.ToString(Eval("PhotoPath"))) %>'>
                                            <img src='<%# GetPhotoUrl(Eval("PhotoPath")) %>' alt="Student Photo" class="student-avatar" />
                                        </asp:PlaceHolder>

                                        <asp:PlaceHolder ID="phFallback" runat="server" Visible='<%# string.IsNullOrWhiteSpace(Convert.ToString(Eval("PhotoPath"))) %>'>
                                            <div class="student-avatar-fallback"><%# GetInitials(Eval("FirstName"), Eval("LastName")) %></div>
                                        </asp:PlaceHolder>

                                        <div>
                                            <div class="student-name"><%# Eval("StudentName") %></div>
                                            <div class="student-email"><%# Eval("Email1") %></div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="Course" HeaderText="Course" />
                            <asp:BoundField DataField="BatchNo" HeaderText="Batch" />
                            <asp:BoundField DataField="PrimaryMobile" HeaderText="Mobile" />
                            <asp:BoundField DataField="FatherName" HeaderText="Father Name" />
                            <asp:BoundField DataField="AadharNo" HeaderText="Aadhar No" />
                            <asp:BoundField DataField="RegisteredOn" HeaderText="Registered On" />

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <%# GetStatusHtml(Convert.ToString(Eval("VerificationStatus"))) %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <div class="action-group">
                                        <asp:LinkButton ID="lnkEdit" runat="server" CssClass="icon-btn edit" ToolTip="Edit Student" CommandName="EditStudent" CommandArgument='<%# Eval("ID") %>'>✎</asp:LinkButton>
                                        <asp:LinkButton ID="lnkVerify" runat="server" CssClass="icon-btn verify" ToolTip="Quick Verify" CommandName="QuickVerify" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('Verify this student?');">✔</asp:LinkButton>
                                        <asp:LinkButton ID="lnkReject" runat="server" CssClass="icon-btn reject" ToolTip="Quick Reject" CommandName="QuickReject" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('Reject this student?');">✖</asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                        <EmptyDataRowStyle CssClass="empty-row" />
                    </asp:GridView>
                </div>
            </div>

        </div>
    </section>

    <script>
        if (window.gsap) {
            gsap.from(".gsap-reveal", {
                y: 24,
                opacity: 0,
                duration: 0.75,
                stagger: 0.08,
                ease: "power3.out"
            });
        }
    </script>
</asp:Content>