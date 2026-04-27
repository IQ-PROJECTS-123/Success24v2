<%@ Page Title="Admin Edit Student" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="AdminEdit.aspx.cs" Inherits="Success24v2.AdminEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-shell{background:radial-gradient(circle at top left, rgba(249,115,22,.10), transparent 28%), radial-gradient(circle at top right, rgba(251,191,36,.12), transparent 24%), linear-gradient(180deg,#fffaf5 0%,#fff7ed 38%,#ffffff 100%);}
        .glass-card{position:relative;overflow:hidden;}
        .glass-card::before{content:"";position:absolute;inset:0;background:linear-gradient(135deg, rgba(255,255,255,.82), rgba(255,255,255,.65));pointer-events:none;}
        .glass-card>*{position:relative;z-index:1;}
        .field-input,.field-select,.field-textarea{width:100%;border-radius:1rem;border:1px solid #fed7aa;background:rgba(255,255,255,.96);color:#431407;outline:none;transition:all .25s ease;box-shadow:0 1px 2px rgba(0,0,0,.03);}
        .field-input,.field-select{min-height:3.5rem;padding:.875rem 1rem;}
        .field-textarea{min-height:8rem;padding:1rem;resize:vertical;}
        .field-input:focus,.field-select:focus,.field-textarea:focus{border-color:#fb923c;box-shadow:0 0 0 4px rgba(251,146,60,.16);background:#fff;}
        .doc-box a,.doc-box .doc-link{color:#ea580c;font-weight:700;text-decoration:none;word-break:break-word;}
        .doc-box a:hover,.doc-box .doc-link:hover{color:#c2410c;text-decoration:underline;}
        .action-btn{border:none;min-height:3.35rem;border-radius:1rem;padding:.85rem 1.4rem;font-weight:800;letter-spacing:.01em;color:#fff;transition:all .25s ease;box-shadow:0 10px 25px rgba(15,23,42,.10);}
        .action-btn:hover{transform:translateY(-1px);box-shadow:0 16px 35px rgba(15,23,42,.16);}
        .btn-save{background:linear-gradient(135deg,#f97316,#ea580c);}
        .btn-verify{background:linear-gradient(135deg,#22c55e,#15803d);}
        .btn-reject{background:linear-gradient(135deg,#ef4444,#dc2626);}
        .status-pill{display:inline-flex;align-items:center;gap:.45rem;padding:.65rem 1rem;border-radius:9999px;background:linear-gradient(135deg,#fff7ed,#ffedd5);border:1px solid #fdba74;color:#c2410c;font-size:.8rem;font-weight:800;box-shadow:inset 0 1px 0 rgba(255,255,255,.65);}
        .msg{display:block;margin-top:1rem;padding:.9rem 1rem;border-radius:1rem;font-size:.925rem;font-weight:600;}
        .msg-error{background:#fff1f2;color:#be123c;border:1px solid #fecdd3;}
        .msg-success{background:#f0fdf4;color:#166534;border:1px solid #bbf7d0;}
        .profile-card{background:linear-gradient(135deg,#fff7ed,#ffffff);border:1px solid #fed7aa;border-radius:1.5rem;padding:1.25rem;height:100%;}
        .profile-photo{width:8rem;height:8rem;object-fit:cover;border-radius:1.5rem;border:1px solid #fdba74;box-shadow:0 12px 30px rgba(249,115,22,.12);background:#fff;}
        .not-uploaded{color:#9a3412;font-weight:600;}
        .upload-box{width:100%;border:1px solid #fdba74;border-radius:14px;background:#fff;padding:14px 16px;font-size:15px;}
        .helper{margin-top:6px;font-size:12px;color:#7c2d12;}
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="admin-shell min-h-screen py-10 md:py-14">
        <div class="mx-auto w-full max-w-7xl px-4 sm:px-6 lg:px-8">

            <div class="glass-card mb-6 rounded-[2rem] border border-orange-200/70 bg-white/80 p-6 shadow-[0_20px_60px_rgba(234,88,12,0.08)] backdrop-blur-xl md:p-8 gsap-reveal">
                <div class="flex flex-col gap-5 lg:flex-row lg:items-center lg:justify-between">
                    <div class="flex items-start gap-4 max-w-3xl">
                        <a href="AdminDashboard.aspx"
                            class="group inline-flex h-12 w-12 items-center justify-center rounded-2xl border border-orange-200 bg-white text-orange-600 shadow-sm transition duration-300 hover:-translate-y-0.5 hover:border-orange-300 hover:bg-orange-50 hover:text-orange-700 hover:shadow-lg"
                            title="Go back to dashboard">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 transition duration-300 group-hover:-translate-x-0.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
                            </svg>
                        </a>

                        <div>
                            <div class="mb-3 inline-flex items-center rounded-full border border-orange-200 bg-orange-50 px-4 py-1.5 text-xs font-extrabold uppercase tracking-[0.18em] text-orange-700">
                                Student Verification Panel
                            </div>

                            <h1 class="text-2xl font-black tracking-tight text-slate-900 md:text-4xl">Student Application Review</h1>

                            <p class="mt-3 max-w-2xl text-sm leading-7 text-slate-600 md:text-base">
                                Review complete student information, verify submitted documents, update application details,
                                and take secure approval actions from one premium admin workspace.
                            </p>
                        </div>
                    </div>

                    <div class="flex flex-wrap items-center gap-3">
                        <div class="status-pill">
                            <span class="h-2.5 w-2.5 rounded-full bg-orange-500"></span>
                            Current Status
                        </div>
                        <div><asp:Literal ID="litStatus" runat="server"></asp:Literal></div>
                    </div>
                </div>
            </div>

            <div class="glass-card mb-6 rounded-[2rem] border border-orange-200/70 bg-white/90 p-6 shadow-[0_20px_60px_rgba(15,23,42,0.06)] backdrop-blur-xl md:p-8 gsap-reveal">
                <div class="mb-6 flex flex-col gap-2 md:flex-row md:items-end md:justify-between">
                    <div>
                        <h2 class="text-xl font-black text-slate-900 md:text-2xl">Student Profile</h2>
                        <p class="text-sm text-slate-500">Quick visual identification of the student before document verification.</p>
                    </div>
                    <div class="text-xs font-bold uppercase tracking-[0.18em] text-orange-600">Photo Preview</div>
                </div>

                <div class="profile-card">
                    <asp:Literal ID="litPhoto" runat="server"></asp:Literal>

                    <div class="mt-5 grid grid-cols-1 gap-4 md:grid-cols-2">
                        <div>
                            <label class="mb-2 block text-sm font-bold text-slate-700">Upload / Update Student Photo</label>
                            <asp:FileUpload ID="fuAdminPhoto" runat="server" CssClass="upload-box" />
                        </div>
                        <div class="flex items-end">
                            <asp:Button ID="btnUploadPhoto" runat="server" Text="Upload Photo" CssClass="action-btn btn-save" OnClick="btnUploadPhoto_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="glass-card mb-6 rounded-[2rem] border border-orange-200/70 bg-white/90 p-6 shadow-[0_20px_60px_rgba(15,23,42,0.06)] backdrop-blur-xl md:p-8 gsap-reveal">
                <div class="mb-6 flex flex-col gap-2 md:flex-row md:items-end md:justify-between">
                    <div>
                        <h2 class="text-xl font-black text-slate-900 md:text-2xl">Student Details</h2>
                        <p class="text-sm text-slate-500">Edit applicant profile, education, contact details, address information, and assign batch.</p>
                    </div>
                    <div class="text-xs font-bold uppercase tracking-[0.18em] text-orange-600">Editable Information</div>
                </div>

                <div class="grid grid-cols-1 gap-5 md:grid-cols-2 xl:grid-cols-4">
                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">First Name</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Last Name</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Father Name</label>
                        <asp:TextBox ID="txtFatherName" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Batch Number</label>
                        <asp:TextBox ID="txtBatchNo" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Qualification</label>
                        <asp:TextBox ID="txtQualification" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Passout Year</label>
                        <asp:TextBox ID="txtPassoutYear" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">DOB</label>
                        <asp:TextBox ID="txtDOB" runat="server" CssClass="field-input" TextMode="Date"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Course</label>
                        <asp:DropDownList ID="ddlCourse" runat="server" CssClass="field-select">
                            <asp:ListItem Value="">Select Course</asp:ListItem>
                            <asp:ListItem>Web Development</asp:ListItem>
                            <asp:ListItem>Data Science</asp:ListItem>
                            <asp:ListItem>DevOps</asp:ListItem>
                            <asp:ListItem>AI & ML</asp:ListItem>
                            <asp:ListItem>Cyber Security</asp:ListItem>
                            <asp:ListItem>Quality Assurance</asp:ListItem>
                            <asp:ListItem>SharePoint 2019</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Primary Mobile</label>
                        <asp:TextBox ID="txtPrimaryMobile" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Secondary Mobile</label>
                        <asp:TextBox ID="txtSecondaryMobile" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Primary Email</label>
                        <asp:TextBox ID="txtEmail1" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Secondary Email</label>
                        <asp:TextBox ID="txtEmail2" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">WhatsApp No</label>
                        <asp:TextBox ID="txtWhatsappNo" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Parents No</label>
                        <asp:TextBox ID="txtParentNo" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Aadhar No</label>
                        <asp:TextBox ID="txtAadharNo" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">PAN No</label>
                        <asp:TextBox ID="txtPANNo" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Passport No</label>
                        <asp:TextBox ID="txtPassportNo" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Reference Name</label>
                        <asp:TextBox ID="txtReferenceName" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Verification Status</label>
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="field-select">
                            <asp:ListItem>Draft</asp:ListItem>
                            <asp:ListItem>Pending</asp:ListItem>
                            <asp:ListItem>Verified</asp:ListItem>
                            <asp:ListItem>Rejected</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Completion %</label>
                        <asp:TextBox ID="txtCompletionPercent" runat="server" CssClass="field-input"></asp:TextBox>
                    </div>

                    <div class="md:col-span-2 xl:col-span-2">
                        <label class="mb-2 block text-sm font-bold text-slate-700">Current Address</label>
                        <asp:TextBox ID="txtCurrentAddress" runat="server" CssClass="field-textarea" TextMode="MultiLine"></asp:TextBox>
                    </div>

                    <div class="md:col-span-2 xl:col-span-2">
                        <label class="mb-2 block text-sm font-bold text-slate-700">Permanent Address</label>
                        <asp:TextBox ID="txtPermanentAddress" runat="server" CssClass="field-textarea" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="glass-card mb-6 rounded-[2rem] border border-orange-200/70 bg-white/90 p-6 shadow-[0_20px_60px_rgba(15,23,42,0.06)] backdrop-blur-xl md:p-8 gsap-reveal">
                <div class="mb-6 flex flex-col gap-2 md:flex-row md:items-end md:justify-between">
                    <div>
                        <h2 class="text-xl font-black text-slate-900 md:text-2xl">Submitted Documents</h2>
                        <p class="text-sm text-slate-500">Review student identity and education proof in a clean card-based layout.</p>
                    </div>
                    <div class="text-xs font-bold uppercase tracking-[0.18em] text-orange-600">Verification Assets</div>
                </div>

                <div class="grid grid-cols-1 gap-5 md:grid-cols-2 xl:grid-cols-4">
                    <div class="doc-box rounded-3xl border border-orange-200 bg-gradient-to-br from-orange-50 to-white p-5 shadow-sm">
                        <div class="mb-3 flex items-center justify-between">
                            <h6 class="text-base font-extrabold text-slate-900">Student Photo</h6>
                            <span class="rounded-full bg-violet-100 px-3 py-1 text-[11px] font-bold uppercase tracking-wide text-violet-700">Profile</span>
                        </div>
                        <div class="text-sm leading-7 text-slate-600"><asp:Literal ID="litPhotoCard" runat="server"></asp:Literal></div>
                    </div>

                    <div class="doc-box rounded-3xl border border-orange-200 bg-gradient-to-br from-orange-50 to-white p-5 shadow-sm">
                        <div class="mb-3 flex items-center justify-between">
                            <h6 class="text-base font-extrabold text-slate-900">Aadhar Front</h6>
                            <span class="rounded-full bg-orange-100 px-3 py-1 text-[11px] font-bold uppercase tracking-wide text-orange-700">ID Proof</span>
                        </div>
                        <div class="text-sm leading-7 text-slate-600"><asp:Literal ID="litAadharFront" runat="server"></asp:Literal></div>
                        <label class="helper">Replace with file named exactly: aadharfront</label>
                        <asp:FileUpload ID="fuAadharFrontAdmin" runat="server" CssClass="upload-box" />
                        <asp:Button ID="btnUploadAadharFront" runat="server" Text="Replace Aadhar Front" CssClass="action-btn btn-save mt-3" OnClick="btnUploadAadharFront_Click" />
                    </div>

                    <div class="doc-box rounded-3xl border border-orange-200 bg-gradient-to-br from-orange-50 to-white p-5 shadow-sm">
                        <div class="mb-3 flex items-center justify-between">
                            <h6 class="text-base font-extrabold text-slate-900">Aadhar Back</h6>
                            <span class="rounded-full bg-orange-100 px-3 py-1 text-[11px] font-bold uppercase tracking-wide text-orange-700">ID Proof</span>
                        </div>
                        <div class="text-sm leading-7 text-slate-600"><asp:Literal ID="litAadharBack" runat="server"></asp:Literal></div>
                        <label class="helper">Replace with file named exactly: aadharback</label>
                        <asp:FileUpload ID="fuAadharBackAdmin" runat="server" CssClass="upload-box" />
                        <asp:Button ID="btnUploadAadharBack" runat="server" Text="Replace Aadhar Back" CssClass="action-btn btn-save mt-3" OnClick="btnUploadAadharBack_Click" />
                    </div>

                    <div class="doc-box rounded-3xl border border-orange-200 bg-gradient-to-br from-orange-50 to-white p-5 shadow-sm">
                        <div class="mb-3 flex items-center justify-between">
                            <h6 class="text-base font-extrabold text-slate-900">PAN Card</h6>
                            <span class="rounded-full bg-amber-100 px-3 py-1 text-[11px] font-bold uppercase tracking-wide text-amber-700">KYC</span>
                        </div>
                        <div class="text-sm leading-7 text-slate-600"><asp:Literal ID="litPANCard" runat="server"></asp:Literal></div>
                        <label class="helper">Replace with file named exactly: pancard</label>
                        <asp:FileUpload ID="fuPANCardAdmin" runat="server" CssClass="upload-box" />
                        <asp:Button ID="btnUploadPANCard" runat="server" Text="Replace PAN Card" CssClass="action-btn btn-save mt-3" OnClick="btnUploadPANCard_Click" />
                    </div>

                    <div class="doc-box rounded-3xl border border-orange-200 bg-gradient-to-br from-orange-50 to-white p-5 shadow-sm">
                        <div class="mb-3 flex items-center justify-between">
                            <h6 class="text-base font-extrabold text-slate-900">10th Marksheet</h6>
                            <span class="rounded-full bg-sky-100 px-3 py-1 text-[11px] font-bold uppercase tracking-wide text-sky-700">Academic</span>
                        </div>
                        <div class="text-sm leading-7 text-slate-600"><asp:Literal ID="litMarksheet10" runat="server"></asp:Literal></div>
                        <label class="helper">Replace with file named exactly: tenthmarksheet</label>
                        <asp:FileUpload ID="fuMarksheet10Admin" runat="server" CssClass="upload-box" />
                        <asp:Button ID="btnUploadMarksheet10" runat="server" Text="Replace 10th Marksheet" CssClass="action-btn btn-save mt-3" OnClick="btnUploadMarksheet10_Click" />
                    </div>

                    <div class="doc-box rounded-3xl border border-orange-200 bg-gradient-to-br from-orange-50 to-white p-5 shadow-sm">
                        <div class="mb-3 flex items-center justify-between">
                            <h6 class="text-base font-extrabold text-slate-900">12th Marksheet</h6>
                            <span class="rounded-full bg-sky-100 px-3 py-1 text-[11px] font-bold uppercase tracking-wide text-sky-700">Academic</span>
                        </div>
                        <div class="text-sm leading-7 text-slate-600"><asp:Literal ID="litMarksheet12" runat="server"></asp:Literal></div>
                        <label class="helper">Replace with file named exactly: twelfthmarksheet</label>
                        <asp:FileUpload ID="fuMarksheet12Admin" runat="server" CssClass="upload-box" />
                        <asp:Button ID="btnUploadMarksheet12" runat="server" Text="Replace 12th Marksheet" CssClass="action-btn btn-save mt-3" OnClick="btnUploadMarksheet12_Click" />
                    </div>

                    <div class="doc-box rounded-3xl border border-orange-200 bg-gradient-to-br from-orange-50 to-white p-5 shadow-sm">
                        <div class="mb-3 flex items-center justify-between">
                            <h6 class="text-base font-extrabold text-slate-900">Degree / Last Year</h6>
                            <span class="rounded-full bg-emerald-100 px-3 py-1 text-[11px] font-bold uppercase tracking-wide text-emerald-700">Higher Study</span>
                        </div>
                        <div class="text-sm leading-7 text-slate-600"><asp:Literal ID="litDegree" runat="server"></asp:Literal></div>
                        <label class="helper">Replace with file named exactly: degree</label>
                        <asp:FileUpload ID="fuDegreeAdmin" runat="server" CssClass="upload-box" />
                        <asp:Button ID="btnUploadDegree" runat="server" Text="Replace Degree File" CssClass="action-btn btn-save mt-3" OnClick="btnUploadDegree_Click" />
                    </div>
                </div>
            </div>

            <div class="glass-card rounded-[2rem] border border-orange-200/70 bg-white/90 p-6 shadow-[0_20px_60px_rgba(15,23,42,0.06)] backdrop-blur-xl md:p-8 gsap-reveal">
                <div class="mb-6 flex flex-col gap-2 md:flex-row md:items-end md:justify-between">
                    <div>
                        <h2 class="text-xl font-black text-slate-900 md:text-2xl">Admin Remarks & Actions</h2>
                        <p class="text-sm text-slate-500">Add internal notes and take the final approval decision for this student record.</p>
                    </div>
                    <div class="text-xs font-bold uppercase tracking-[0.18em] text-orange-600">Secure Decision Control</div>
                </div>

                <div class="grid grid-cols-1 gap-5">
                    <div>
                        <label class="mb-2 block text-sm font-bold text-slate-700">Verification Remarks</label>
                        <asp:TextBox ID="txtRemarks" runat="server" CssClass="field-textarea" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>

                <asp:Label ID="lblMessage" runat="server"></asp:Label>

                <div class="mt-6 flex flex-col gap-3 sm:flex-row sm:flex-wrap">
                    <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="action-btn btn-save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnVerify" runat="server" Text="Verify Student" CssClass="action-btn btn-verify" OnClick="btnVerify_Click" />
                    <asp:Button ID="btnReject" runat="server" Text="Reject Student" CssClass="action-btn btn-reject" OnClick="btnReject_Click" />
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
                stagger: 0.1,
                ease: "power3.out"
            });
        }
    </script>
</asp:Content>