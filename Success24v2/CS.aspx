<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true"
    CodeBehind="CS.aspx.cs" Inherits="Success24v2.CS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- HERO SECTION -->
    <section class="relative h-screen flex items-center justify-center overflow-hidden">

        <img src="https://success24.in/img/iq-india2.jpeg"
            class="absolute inset-0 w-full h-full object-cover"
            alt="Cyber Security Training" />

        <div class="absolute inset-0 bg-gradient-to-b from-slate-900/60 to-slate-900/80"></div>

        <div class="relative z-10 max-w-5xl mx-auto px-6 text-center">
            <div class="backdrop-blur-md bg-slate-900/40 p-12 rounded-3xl shadow-2xl">

                <h2 class="text-xl md:text-2xl font-bold mb-4
                       bg-gradient-to-r from-blue-500 to-yellow-400
                       bg-clip-text text-transparent">2026 Cyber Defense Program
                </h2>

                <div class="mx-auto mb-6 h-1 w-24
                        bg-gradient-to-r from-yellow-400 to-blue-500
                        shadow-lg shadow-yellow-400/50">
                </div>

                <h1 class="text-5xl md:text-7xl font-black mb-6
                       bg-gradient-to-r from-yellow-400 to-blue-500
                       bg-clip-text text-transparent">Cyber Security Training
                </h1>

                <p class="text-white text-xl md:text-2xl font-semibold">
                    Ethical Hacking, Network Security, SOC, Cloud Security & Live Labs
                </p>

            </div>
        </div>
    </section>


    <!-- CTA BANNER -->
    <section class="bg-gradient-to-r from-yellow-400 to-orange-400 text-center py-12 scroll-scale">
        <h2 class="font-extrabold text-3xl md:text-5xl mb-3 text-gray-900 uppercase">Start Your Cyber Security Career Today
        </h2>
        <div class="text-3xl md:text-5xl font-bold text-white">
            <a href="tel:+919555580458" class="hover:text-gray-900 transition-colors">+91 95555 80458
            </a>
        </div>
    </section>

    <!-- STATS SECTION -->
    <section class="bg-slate-900 border-t border-b border-slate-700">
        <div class="max-w-7xl mx-auto px-6 py-12">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-8 text-center text-white">
                <div class="scroll-scale">
                    <h3 class="text-5xl font-bold text-orange-500 mb-2 counter" data-target="150">0</h3>
                    <p class="text-sm text-gray-400">Hands-on Security Labs</p>
                </div>
                <div class="scroll-scale">
                    <h3 class="text-5xl font-bold text-orange-500 mb-2">30+</h3>
                    <p class="text-sm text-gray-400">Attack Techniques</p>
                </div>
                <div class="scroll-scale">
                    <h3 class="text-5xl font-bold text-orange-500 mb-2">Live</h3>
                    <p class="text-sm text-gray-400">Cyber Projects</p>
                </div>
                <div class="scroll-scale">
                    <h3 class="text-5xl font-bold text-orange-500 mb-2">Career</h3>
                    <p class="text-sm text-gray-400">Job-Oriented Training</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ABOUT SECTION -->
    <section class="py-16 bg-slate-50">
        <div class="max-w-7xl mx-auto px-6">
            <div class="grid md:grid-cols-2 gap-12 items-center">
                <div class="scroll-fade-left">
                    <h6 class="uppercase text-orange-500 font-bold text-sm mb-3">Cyber Security & Ethical Hacking
                    </h6>
                    <h2 class="text-4xl font-bold mb-4">Build a Career as a Cyber Security Expert
                    </h2>
                    <p class="text-gray-600 text-lg leading-relaxed">
                        Cyber Security professionals protect organizations from cyber attacks.
                        This course covers Ethical Hacking, Network Security, SOC operations,
                        Vulnerability Assessment, Penetration Testing and real-world attack simulations.
                    </p>
                </div>
                <div class="scroll-fade-right">
                    <img src="https://success24.in/img/cyber-security-training.jpg"
                        class="w-full rounded-2xl shadow-2xl hover-lift"
                        alt="Cyber Security Training" />
                </div>
            </div>
        </div>
    </section>

    <!-- SYLLABUS SECTION -->
    <section class="py-16 bg-white">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-12 scroll-reveal">
                <h6 class="uppercase text-orange-500 font-bold text-sm mb-3">Complete Curriculum
                </h6>
                <h2 class="text-4xl font-bold mb-4">Cyber Security Roadmap
                </h2>
                <p class="text-gray-600 text-lg">
                    From security basics to advanced ethical hacking.
                </p>
            </div>

            <div class="grid md:grid-cols-3 gap-8">

                <!-- Module 1 -->
                <div class="p-6 rounded-2xl border-2 border-gray-200 hover:border-orange-500 hover-lift scroll-reveal bg-white">
                    <h6 class="text-orange-500 font-bold text-sm mb-2">MODULE 01</h6>
                    <h4 class="text-2xl font-bold mb-4">Security Fundamentals</h4>
                    <ul class="text-gray-600 space-y-2">
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Cyber Security Basics</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Networking & OS</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Linux for Security</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Threat Landscape</li>
                    </ul>
                </div>

                <!-- Module 2 -->
                <div class="p-6 rounded-2xl border-2 border-gray-200 hover:border-orange-500 hover-lift scroll-reveal bg-white">
                    <h6 class="text-orange-500 font-bold text-sm mb-2">MODULE 02</h6>
                    <h4 class="text-2xl font-bold mb-4">Ethical Hacking</h4>
                    <ul class="text-gray-600 space-y-2">
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Footprinting & Scanning</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Vulnerability Assessment</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Web App Security</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Penetration Testing</li>
                    </ul>
                </div>

                <!-- Module 3 -->
                <div class="p-6 rounded-2xl border-2 border-gray-200 hover:border-orange-500 hover-lift scroll-reveal bg-white">
                    <h6 class="text-orange-500 font-bold text-sm mb-2">MODULE 03</h6>
                    <h4 class="text-2xl font-bold mb-4">SOC & Advanced Security</h4>
                    <ul class="text-gray-600 space-y-2">
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>SOC Operations</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>SIEM Tools</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Incident Response</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Live Cyber Attacks</li>
                    </ul>
                </div>

            </div>
        </div>
    </section>

    <!-- PLACEMENT SECTION -->
    <section class="py-16 bg-slate-50 border-t">
        <div class="max-w-7xl mx-auto px-6">

            <div class="text-center mb-12 scroll-reveal">
                <h6 class="uppercase font-bold text-orange-500 text-sm mb-3">Career & Placement
                </h6>
                <h2 class="text-4xl font-bold text-gray-900 mb-4">Become a Cyber Security Professional
                </h2>
                <p class="text-lg text-gray-600">
                    Industry-ready cyber security skills with placement support.
                </p>
            </div>

            <div class="grid lg:grid-cols-12 gap-8">

                <!-- Placement Includes -->
                <div class="lg:col-span-7">
                    <div class="p-8 bg-white rounded-2xl border-2 border-gray-200 shadow-lg h-full scroll-fade-left hover-lift">
                        <h4 class="text-2xl font-bold mb-6">Placement Preparation Includes</h4>

                        <div class="grid md:grid-cols-2 gap-6">

                            <div class="flex gap-3">
                                <i class="fas fa-user-shield text-2xl text-orange-500 mt-1"></i>
                                <div>
                                    <h6 class="font-bold text-lg mb-1">Live Cyber Projects</h6>
                                    <p class="text-sm text-gray-600">Real attack & defense scenarios</p>
                                </div>
                            </div>

                            <div class="flex gap-3">
                                <i class="fas fa-user-tie text-2xl text-orange-500 mt-1"></i>
                                <div>
                                    <h6 class="font-bold text-lg mb-1">Interview Preparation</h6>
                                    <p class="text-sm text-gray-600">Security analyst questions</p>
                                </div>
                            </div>

                            <div class="flex gap-3">
                                <i class="fas fa-file-alt text-2xl text-orange-500 mt-1"></i>
                                <div>
                                    <h6 class="font-bold text-lg mb-1">Resume Building</h6>
                                    <p class="text-sm text-gray-600">Cyber security profile</p>
                                </div>
                            </div>

                            <div class="flex gap-3">
                                <i class="fas fa-briefcase text-2xl text-orange-500 mt-1"></i>
                                <div>
                                    <h6 class="font-bold text-lg mb-1">Job Assistance</h6>
                                    <p class="text-sm text-gray-600">Support till placement</p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Package -->
                <div class="lg:col-span-5">
                    <div class="p-8 rounded-2xl text-center text-white shadow-2xl h-full bg-gradient-to-br from-blue-600 to-cyan-400 scroll-fade-right hover-lift">
                        <h6 class="uppercase font-bold text-sm mb-3 opacity-90">Expected Package</h6>
                        <h1 class="text-6xl font-bold mb-3">5 – 18 LPA</h1>
                        <p class="text-lg opacity-90 mb-6">Based on security expertise</p>
                        <a href="#enroll"
                            class="inline-block bg-gray-900 text-white px-8 py-4 rounded-full font-bold text-lg hover:bg-gray-800 transition-all">Apply Now
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- LIVE CLASS GALLERY -->
    <section class="relative overflow-hidden">
        <img src="https://success24.in/img/iq-india2.jpeg"
            class="w-full h-[520px] object-cover" alt="Live Classes" />

        <div class="absolute inset-0 bg-gradient-to-b from-slate-900/60 to-slate-900/80"></div>

        <div class="max-w-7xl mx-auto px-6 absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-full z-10">
            <h2 class="text-center text-3xl md:text-4xl font-bold text-orange-400 mb-10 scroll-reveal">Live Class Automation Testing
            </h2>
            <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
                <div class="scroll-scale">
                    <img src="https://success24.in/img/class1.jpg"
                        class="w-full rounded-xl shadow-2xl hover-lift" alt="Class 1" />
                </div>
                <div class="scroll-scale">
                    <img src="https://success24.in/img/DS_5.jpg"
                        class="w-full rounded-xl shadow-2xl hover-lift" alt="Class 2" />
                </div>
                <div class="scroll-scale">
                    <img src="https://success24.in/img/classds.jpg"
                        class="w-full rounded-xl shadow-2xl hover-lift" alt="Class 3" />
                </div>
                <div class="scroll-scale">
                    <img src="https://success24.in/img/class_4.jpg"
                        class="w-full rounded-xl shadow-2xl hover-lift" alt="Class 4" />
                </div>
            </div>
        </div>
    </section>

    <!-- FINAL CTA -->
    <section class="py-20 bg-gradient-to-r from-orange-500 to-red-500 text-white scroll-scale">
        <div class="max-w-4xl mx-auto px-6 text-center">
            <h2 class="text-4xl md:text-5xl font-bold mb-6">Ready to Become a Cyber Security Expert?
            </h2>
            <p class="text-xl mb-8 opacity-90">
                Join our Cyber Security training program today
            </p>
            <div class="flex justify-center gap-4 flex-wrap">
                <a href="tel:+919555580458"
                    class="bg-white text-orange-600 px-10 py-4 rounded-full font-bold text-lg hover:bg-yellow-300 transition-all">Call Now
                </a>
                <a href="#enroll"
                    class="border-2 border-white px-10 py-4 rounded-full font-bold text-lg hover:bg-white hover:text-orange-600 transition-all">Enroll Today
                </a>
            </div>
        </div>
    </section>

</asp:Content>
