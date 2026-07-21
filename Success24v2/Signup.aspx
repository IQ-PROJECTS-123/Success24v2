<%@ Page Title="Student Signup" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Success24v2.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Tailwind CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        .auth-bg {
            background:
                radial-gradient(circle at top left, rgba(251, 146, 60, 0.22), transparent 28%),
                radial-gradient(circle at bottom right, rgba(249, 115, 22, 0.16), transparent 26%),
                linear-gradient(135deg, #fff7ed 0%, #ffedd5 38%, #fff 100%);
            min-height: 100vh;
        }

        .glass-card {
            background: rgba(255,255,255,0.88);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            box-shadow: 0 25px 80px rgba(124, 45, 18, 0.10);
            border: 1px solid rgba(251, 146, 60, 0.18);
        }

        .floating-orb {
            animation: floatY 6s ease-in-out infinite;
        }

        .floating-orb-delay {
            animation: floatY 8s ease-in-out infinite;
        }

        @keyframes floatY {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-14px); }
        }

        .input-box {
            width: 100%;
            height: 56px;
            border-radius: 16px;
            border: 1px solid #fed7aa;
            background: rgba(255,255,255,0.92);
            padding: 0 18px;
            font-size: 15px;
            color: #431407;
            transition: all .25s ease;
        }

        .input-box:focus {
            outline: none;
            border-color: #f97316;
            box-shadow: 0 0 0 5px rgba(249, 115, 22, 0.12);
            background: #ffffff;
        }

        .input-box::placeholder {
            color: #9a3412;
            opacity: .72;
        }

        .btn-main {
            width: 100%;
            min-height: 58px;
            border: none;
            border-radius: 16px;
            color: #fff;
            font-weight: 800;
            font-size: 16px;
            letter-spacing: .01em;
            background: linear-gradient(135deg, #fb923c 0%, #f97316 45%, #ea580c 100%);
            box-shadow: 0 18px 35px rgba(249, 115, 22, 0.28);
            transition: all .25s ease;
        }

        .btn-main:hover {
            transform: translateY(-1px);
            box-shadow: 0 22px 40px rgba(249, 115, 22, 0.34);
            opacity: .98;
        }

        .msg {
            display: block;
            margin-top: 16px;
            padding: 14px 16px;
            border-radius: 14px;
            font-size: 14px;
            font-weight: 600;
        }

        .msg-error {
            background: #fff1f2;
            color: #be123c;
            border: 1px solid #fecdd3;
        }

        .msg-success {
            background: #f0fdf4;
            color: #166534;
            border: 1px solid #bbf7d0;
        }

        .strength-box {
            border: 1px solid #fdba74;
            background: linear-gradient(135deg, #fff7ed 0%, #ffffff 100%);
        }

        .feature-chip {
            background: rgba(255,255,255,0.7);
            border: 1px solid rgba(251,146,60,.25);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="auth-bg relative overflow-hidden py-10 md:py-16">
        <!-- Decorative Orbs -->
        <div class="floating-orb absolute top-16 left-10 h-28 w-28 rounded-full bg-orange-300/30 blur-3xl"></div>
        <div class="floating-orb-delay absolute bottom-10 right-10 h-36 w-36 rounded-full bg-amber-300/30 blur-3xl"></div>
        <div class="absolute inset-0 bg-[linear-gradient(to_right,rgba(251,146,60,0.05)_1px,transparent_1px),linear-gradient(to_bottom,rgba(251,146,60,0.05)_1px,transparent_1px)] bg-[size:42px_42px]"></div>

        <div class="container relative z-10 mx-auto px-4">
            <div class="mx-auto grid max-w-7xl grid-cols-1 items-center gap-8 lg:grid-cols-2">

                <!-- Left Premium Intro Panel -->
                <div class="hidden lg:block">
                    <div class="rounded-[32px] border border-orange-200/60 bg-white/55 p-10 shadow-[0_25px_80px_rgba(124,45,18,0.08)] backdrop-blur-xl">
                        <div class="mb-6 inline-flex items-center gap-2 rounded-full border border-orange-200 bg-white/80 px-4 py-2 text-xs font-extrabold uppercase tracking-[0.22em] text-orange-600">
                            <span class="h-2 w-2 rounded-full bg-orange-500"></span>
                            Success24 Student Access
                        </div>

                        <h1 class="text-4xl font-black leading-tight text-orange-950 xl:text-5xl">
                            Build your student profile with a premium first impression.
                        </h1>

                        <p class="mt-5 max-w-xl text-base leading-8 text-orange-900/75">
                            Start your registration journey with a secure, modern, and professional signup experience.
                            Designed to feel trusted, polished, and world class from the very first step.
                        </p>

                        <div class="mt-8 grid grid-cols-1 gap-4 sm:grid-cols-2">
                            <div class="feature-chip rounded-2xl p-4 shadow-sm">
                                <div class="mb-2 text-sm font-bold text-orange-700">Secure Access</div>
                                <p class="text-sm leading-6 text-orange-900/70">
                                    Strong password-ready structure with protected account creation flow.
                                </p>
                            </div>

                            <div class="feature-chip rounded-2xl p-4 shadow-sm">
                                <div class="mb-2 text-sm font-bold text-orange-700">Step-by-Step Journey</div>
                                <p class="text-sm leading-6 text-orange-900/70">
                                    Signup now and continue smoothly into your registration process.
                                </p>
                            </div>

                            <div class="feature-chip rounded-2xl p-4 shadow-sm">
                                <div class="mb-2 text-sm font-bold text-orange-700">Student Friendly</div>
                                <p class="text-sm leading-6 text-orange-900/70">
                                    Clean layout, simple form flow, and polished UI that feels premium.
                                </p>
                            </div>

                            <div class="feature-chip rounded-2xl p-4 shadow-sm">
                                <div class="mb-2 text-sm font-bold text-orange-700">Professional Branding</div>
                                <p class="text-sm leading-6 text-orange-900/70">
                                    Matches a high-end education and admission platform experience.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Signup Card -->
                <div class="mx-auto w-full max-w-2xl">
                    <div class="glass-card rounded-[32px] p-6 sm:p-8 md:p-10">
                        <div class="mb-8">
                            <div class="inline-flex items-center gap-2 rounded-full border border-orange-200 bg-orange-50 px-4 py-2 text-[11px] font-extrabold uppercase tracking-[0.20em] text-orange-600">
                                <span class="h-2 w-2 rounded-full bg-orange-500"></span>
                                Student Signup
                            </div>
                             <div class="inline-flex items-center gap-2 rounded-full border border-orange-200 bg-orange-50 px-4 py-2 text-[11px] font-extrabold uppercase tracking-[0.20em] text-orange-600">
                                 <span class="h-2 w-2 rounded-full bg-orange-500"></span>
                                 <a href="Login.aspx">Student Login</a>
                              </div>

                            <h2 class="mt-5 text-3xl font-black leading-tight text-orange-950 sm:text-4xl">
                                Create Your Account
                            </h2>

                            <p class="mt-3 text-[15px] leading-7 text-orange-900/70">
                                Enter your details below to create your student account and continue with the registration journey.
                            </p>
                        </div>

                        <div class="space-y-5">
                            <div>
                                <label class="mb-2 block text-sm font-extrabold tracking-wide text-orange-900">
                                    Full Name
                                </label>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="input-box" placeholder="Enter your full name"></asp:TextBox>
                            </div>

                            <div>
                                <label class="mb-2 block text-sm font-extrabold tracking-wide text-orange-900">
                                    Email Address
                                </label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="Enter your email address"></asp:TextBox>
                            </div>

                            <div>
                                <label class="mb-2 block text-sm font-extrabold tracking-wide text-orange-900">
                                    Primary Mobile Number
                                </label>
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="input-box" placeholder="Enter your mobile number" MaxLength="15"></asp:TextBox>
                            </div>

                            <div class="grid grid-cols-1 gap-5 md:grid-cols-2">
                                <div>
                                    <label class="mb-2 block text-sm font-extrabold tracking-wide text-orange-900">
                                        Password
                                    </label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="Create password"></asp:TextBox>
                                </div>

                                <div>
                                    <label class="mb-2 block text-sm font-extrabold tracking-wide text-orange-900">
                                        Confirm Password
                                    </label>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="Confirm password"></asp:TextBox>
                                </div>
                            </div>

                            <div class="strength-box rounded-2xl p-4">
                                <div class="mb-2 flex items-center gap-2 text-sm font-extrabold text-orange-800">
                                    <span class="inline-flex h-6 w-6 items-center justify-center rounded-full bg-orange-100 text-orange-600">✓</span>
                                    Password Rules
                                </div>
                                <ul class="space-y-1 text-sm leading-6 text-orange-900/75">
                                    <li>• Minimum 8 characters</li>
                                    <li>• At least 1 uppercase letter</li>
                                    <li>• At least 1 lowercase letter</li>
                                    <li>• At least 1 number</li>
                                    <li>• At least 1 special character</li>
                                </ul>
                            </div>

                            <div class="pt-1">
                                <asp:Button ID="btnSignup" runat="server" Text="Create Premium Account" CssClass="btn-main" OnClick="btnSignup_Click" />
                            </div>
                            <%--<div class="pt-1">
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-secondary" OnClick="btnCancel_Click" />
                            </div>--%>

                            <asp:Label ID="lblMessage" runat="server"></asp:Label>

                            <div class="pt-2 text-center text-sm text-orange-900/75">
                                Already have an account?
                                <a href="Login.aspx" class="font-extrabold text-orange-600 transition hover:text-orange-700 hover:underline">
                                    Login here
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>