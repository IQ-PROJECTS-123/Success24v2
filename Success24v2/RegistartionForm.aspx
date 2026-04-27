<%@ Page Title="Student Registration" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="RegistartionForm.aspx.cs" Inherits="Success24v2.StudentRegistrationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="min-h-screen bg-gradient-to-b from-orange-50 via-white to-white py-10">
        <div class="mx-auto w-full max-w-6xl px-4 sm:px-6 lg:px-8">

            <!-- Top Summary Card -->
            <div class="gsap-reveal mb-6 rounded-3xl border border-orange-200 bg-white p-6 shadow-[0_20px_50px_rgba(234,88,12,0.08)] md:p-8">
                <div class="inline-flex items-center rounded-full border border-orange-200 bg-orange-50 px-4 py-2 text-xs font-extrabold uppercase tracking-[0.18em] text-orange-600">
                    Student Application Form
                </div>

                <h1 class="mt-4 text-3xl font-black tracking-tight text-orange-950 md:text-4xl">
                    Complete Your Registration
                </h1>

                <p class="mt-3 text-sm leading-7 text-orange-900/75 md:text-base">
                    Fill your information, review your saved details, and submit your profile for admin verification.
                </p>

                <div class="mt-6">
                    <div class="mb-2 flex items-center justify-between">
                        <strong class="text-sm font-bold text-orange-900">Completion Progress</strong>
                        <strong class="text-sm font-extrabold text-orange-600">
                            <asp:Literal ID="litProgressText" runat="server"></asp:Literal>%
                        </strong>
                    </div>

                    <div class="h-3 overflow-hidden rounded-full bg-orange-100">
                        <div id="divProgress" runat="server" class="h-full rounded-full bg-gradient-to-r from-orange-400 to-orange-600"></div>
                    </div>
                </div>

                <div class="mt-5 flex flex-wrap gap-2">
                    <span id="stepChip1" runat="server" class="inline-flex items-center justify-center rounded-full border border-orange-300 bg-orange-50 px-4 py-2 text-xs font-extrabold uppercase tracking-wide text-orange-700">Step 1 Personal</span>
                    <span id="stepChip2" runat="server" class="inline-flex items-center justify-center rounded-full border border-orange-300 bg-orange-50 px-4 py-2 text-xs font-extrabold uppercase tracking-wide text-orange-700">Step 2 Education</span>
                    <span id="stepChip3" runat="server" class="inline-flex items-center justify-center rounded-full border border-orange-300 bg-orange-50 px-4 py-2 text-xs font-extrabold uppercase tracking-wide text-orange-700">Step 3 Course</span>
                    <span id="stepChip4" runat="server" class="inline-flex items-center justify-center rounded-full border border-orange-300 bg-orange-50 px-4 py-2 text-xs font-extrabold uppercase tracking-wide text-orange-700">Step 4 Contacts</span>
                    <span id="stepChip5" runat="server" class="inline-flex items-center justify-center rounded-full border border-orange-300 bg-orange-50 px-4 py-2 text-xs font-extrabold uppercase tracking-wide text-orange-700">Step 5 Identity</span>
                    <span id="stepChip6" runat="server" class="inline-flex items-center justify-center rounded-full border border-orange-300 bg-orange-50 px-4 py-2 text-xs font-extrabold uppercase tracking-wide text-orange-700">Step 6 Address</span>
                    <span id="stepChip7" runat="server" class="inline-flex items-center justify-center rounded-full border border-orange-300 bg-orange-50 px-4 py-2 text-xs font-extrabold uppercase tracking-wide text-orange-700">Step 7 Documents</span>
                </div>

                <div class="mt-5">
                    <strong class="text-sm font-bold text-orange-900">Status: </strong>
                    <asp:Literal ID="litStatus" runat="server"></asp:Literal>
                </div>

                <asp:Literal ID="litRejectedAlert" runat="server"></asp:Literal>
            </div>

            <!-- Form Card -->
            <div class="gsap-reveal rounded-3xl border border-orange-200 bg-white p-6 shadow-[0_20px_50px_rgba(234,88,12,0.08)] md:p-8">
                <asp:HiddenField ID="hfCurrentStep" runat="server" Value="1" />

                <!-- STEP 1 -->
                <asp:Panel ID="pnlStep1" runat="server">
                    <div class="mb-2 text-2xl font-black text-orange-950">Step 1 - Personal Information</div>
                    <p class="mb-4 text-sm text-orange-700">Enter your basic personal details.</p>

                    <div class="mb-4 rounded-2xl border border-orange-200 bg-orange-50 px-4 py-3 text-sm font-semibold text-orange-900">
                        Fields marked with <span class="font-black text-red-500">*</span> are required.
                    </div>

                    <div class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-4">
                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">First Name <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Last Name <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Father Name <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtFatherName" runat="server" CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Parents Number <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtParentNo" runat="server" CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>
                    </div>
                </asp:Panel>

                <!-- STEP 2 -->
                <asp:Panel ID="pnlStep2" runat="server" Visible="false">
                    <div class="mb-2 text-2xl font-black text-orange-950">Step 2 - Academic Details</div>
                    <p class="mb-4 text-sm text-orange-700">Provide your latest qualification, passout year, and batch info.</p>

                    <div class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-3">
                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Qualification <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtQualification" runat="server" CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Passout Year <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtPassoutYear" runat="server" CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Batch Number</label>
                            <asp:TextBox ID="txtBatchNo" runat="server" ReadOnly="true" placeholder="Will be assigned by admin"
                                CssClass="w-full h-14 cursor-not-allowed rounded-2xl border border-orange-300 bg-orange-50 px-4 text-sm font-bold uppercase tracking-wide text-orange-900 focus:outline-none"></asp:TextBox>
                            <div class="mt-2 text-xs font-semibold text-orange-700">This field is locked. Only admin can assign or update your batch number.</div>
                        </div>
                    </div>
                </asp:Panel>

                <!-- STEP 3 -->
                <asp:Panel ID="pnlStep3" runat="server" Visible="false">
                    <div class="mb-2 text-2xl font-black text-orange-950">Step 3 - Course & DOB</div>
                    <p class="mb-4 text-sm text-orange-700">Select the course you want to apply for and enter your date of birth.</p>

                    <div class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-3">
                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Date of Birth <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtDOB" runat="server" TextMode="Date"
                                CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Course <span class="text-red-500">*</span></label>
                            <asp:DropDownList ID="ddlCourse" runat="server"
                                CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200">
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
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Secondary Mobile</label>
                            <asp:TextBox ID="txtSecondaryMobile" runat="server"
                                CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>
                    </div>
                </asp:Panel>

                <!-- STEP 4 -->
                <asp:Panel ID="pnlStep4" runat="server" Visible="false">
                    <div class="mb-2 text-2xl font-black text-orange-950">Step 4 - Contact Details</div>
                    <p class="mb-4 text-sm text-orange-700">Add your email and additional contact numbers.</p>

                    <div class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-3">
                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Primary Email <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtEmail1" runat="server"
                                CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Secondary Email</label>
                            <asp:TextBox ID="txtEmail2" runat="server"
                                CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">WhatsApp Number <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtWhatsappNo" runat="server"
                                CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>
                    </div>
                </asp:Panel>

                <!-- STEP 5 -->
                <asp:Panel ID="pnlStep5" runat="server" Visible="false">
                    <div class="mb-2 text-2xl font-black text-orange-950">Step 5 - Identity Details</div>
                    <p class="mb-4 text-sm text-orange-700">Add your important identity information carefully.</p>

                    <div class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-4">
                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Aadhar Number <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtAadharNo" runat="server"
                                CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">PAN Number <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtPANNo" runat="server"
                                CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Passport Number</label>
                            <asp:TextBox ID="txtPassportNo" runat="server"
                                CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Reference Name <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtReferenceName" runat="server"
                                CssClass="input-box w-full h-14 rounded-2xl border border-orange-300 bg-white px-4 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>
                    </div>
                </asp:Panel>

                <!-- STEP 6 -->
                <asp:Panel ID="pnlStep6" runat="server" Visible="false">
                    <div class="mb-2 text-2xl font-black text-orange-950">Step 6 - Address Details</div>
                    <p class="mb-4 text-sm text-orange-700">Enter your current and permanent address.</p>

                    <div class="grid grid-cols-1 gap-4 md:grid-cols-2">
                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Current Address <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtCurrentAddress" runat="server" TextMode="MultiLine"
                                CssClass="textarea-box w-full min-h-[130px] rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Permanent Address <span class="text-red-500">*</span></label>
                            <asp:TextBox ID="txtPermanentAddress" runat="server" TextMode="MultiLine"
                                CssClass="textarea-box w-full min-h-[130px] rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-bold uppercase tracking-wide text-orange-950 focus:border-orange-500 focus:outline-none focus:ring-4 focus:ring-orange-200"></asp:TextBox>
                        </div>
                    </div>
                </asp:Panel>

                <!-- STEP 7 -->
                <asp:Panel ID="pnlStep7" runat="server" Visible="false">
                    <div class="mb-2 text-2xl font-black text-orange-950">Step 7 - Upload Documents</div>
                    <p class="mb-4 text-sm text-orange-700">Upload your profile photo and all mandatory student documents for verification.</p>

                    <div class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-3">
                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Upload Your Photo <span class="text-red-500">*</span></label>
                            <asp:FileUpload ID="fuPhoto" runat="server"
                                CssClass="upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none" />
                            <div class="mt-2 text-xs font-semibold text-orange-700">Allowed types: jpg, jpeg, png, webp</div>
                            <asp:Literal ID="litPhoto" runat="server"></asp:Literal>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Aadhar Front <span class="text-red-500">*</span></label>
                            <asp:FileUpload ID="fuAadharFront" runat="server"
                                CssClass="upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none" />
                            <div class="mt-2 text-xs font-semibold text-orange-700">Upload file named exactly: <b>AADHARFRONT</b></div>
                            <asp:Literal ID="litAadharFront" runat="server"></asp:Literal>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Aadhar Back <span class="text-red-500">*</span></label>
                            <asp:FileUpload ID="fuAadharBack" runat="server"
                                CssClass="upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none" />
                            <div class="mt-2 text-xs font-semibold text-orange-700">Upload file named exactly: <b>AADHARBACK</b></div>
                            <asp:Literal ID="litAadharBack" runat="server"></asp:Literal>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">PAN Card <span class="text-red-500">*</span></label>
                            <asp:FileUpload ID="fuPANCard" runat="server"
                                CssClass="upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none" />
                            <div class="mt-2 text-xs font-semibold text-orange-700">Upload file named exactly: <b>PANCARD</b></div>
                            <asp:Literal ID="litPANCard" runat="server"></asp:Literal>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">10th Marksheet <span class="text-red-500">*</span></label>
                            <asp:FileUpload ID="fuMarksheet10" runat="server"
                                CssClass="upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none" />
                            <div class="mt-2 text-xs font-semibold text-orange-700">Upload file named exactly: <b>TENTHMARKSHEET</b></div>
                            <asp:Literal ID="litMarksheet10" runat="server"></asp:Literal>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">12th Marksheet <span class="text-red-500">*</span></label>
                            <asp:FileUpload ID="fuMarksheet12" runat="server"
                                CssClass="upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none" />
                            <div class="mt-2 text-xs font-semibold text-orange-700">Upload file named exactly: <b>TWELFTHMARKSHEET</b></div>
                            <asp:Literal ID="litMarksheet12" runat="server"></asp:Literal>
                        </div>

                        <div>
                            <label class="mb-2 block text-sm font-extrabold text-orange-950">Degree / Last Year Marksheet <span class="text-red-500">*</span></label>
                            <asp:FileUpload ID="fuDegree" runat="server"
                                CssClass="upload-box w-full rounded-2xl border border-orange-300 bg-white px-4 py-3 text-sm font-semibold text-orange-950 focus:outline-none" />
                            <div class="mt-2 text-xs font-semibold text-orange-700">Upload file named exactly: <b>DEGREE</b></div>
                            <asp:Literal ID="litDegree" runat="server"></asp:Literal>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Label ID="lblMessage" runat="server"></asp:Label>

                <div class="mt-6 flex flex-wrap items-center justify-between gap-3">
                    <asp:Button ID="btnPrevious" runat="server" Text="Previous"
                        CssClass="rounded-2xl border border-orange-300 bg-orange-50 px-6 py-3 text-sm font-extrabold text-orange-800 transition hover:bg-orange-100"
                        OnClick="btnPrevious_Click" />

                    <div class="flex flex-wrap gap-3">
                        <asp:Button ID="btnSaveStep" runat="server" Text="Save Step"
                            CssClass="rounded-2xl bg-gradient-to-r from-orange-400 to-orange-600 px-6 py-3 text-sm font-extrabold text-white shadow-lg transition hover:opacity-95"
                            OnClick="btnSaveStep_Click" CausesValidation="false" />

                        <asp:Button ID="btnNext" runat="server" Text="Next Step"
                            CssClass="rounded-2xl bg-gradient-to-r from-orange-400 to-orange-600 px-6 py-3 text-sm font-extrabold text-white shadow-lg transition hover:opacity-95"
                            OnClick="btnNext_Click" CausesValidation="false" />

                        <asp:Button ID="btnSendForVerification" runat="server" Text="Send for Verification"
                            CssClass="rounded-2xl bg-gradient-to-r from-green-600 to-green-700 px-6 py-3 text-sm font-extrabold text-white shadow-lg transition hover:opacity-95"
                            Visible="false" OnClick="btnSendForVerification_Click" CausesValidation="false" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        if (window.gsap) {
            gsap.from(".gsap-reveal", {
                y: 22,
                opacity: 0,
                duration: 0.8,
                stagger: 0.12,
                ease: "power3.out"
            });
        }

        document.addEventListener("input", function (e) {
            const target = e.target;
            if (!target) return;

            const tag = target.tagName;
            if (tag === "INPUT" || tag === "TEXTAREA") {
                const type = (target.type || "").toLowerCase();

                if (type !== "date" && type !== "file" && type !== "email") {
                    target.value = target.value.toUpperCase();
                }
            }
        });
    </script>
</asp:Content>