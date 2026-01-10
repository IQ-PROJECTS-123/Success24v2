<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="Frontend.aspx.cs" Inherits="Success24v2.HTML_css_javascript" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/allcourses.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- HERO SECTION -->
    <section class="relative overflow-hidden h-screen flex items-center justify-center">
        <img src="https://success24.in/img/iq-india2.jpeg"
            class="absolute inset-0 w-full h-full object-cover" alt="Frontend Development Training" />

        <div class="hero-overlay"></div>

        <div class="relative z-10 max-w-5xl mx-auto px-6 text-center">
            <div class="hero-text-glow">
                <h2 class="font-bold text-xl md:text-2xl mb-4 scroll-fade-left">
                    <span class="gradient-blue-yellow">2026 Frontend Career Program</span>
                </h2>

                <div class="hero-line mx-auto mb-6"></div>

                <h1 class="font-black text-5xl md:text-7xl mb-6 scroll-scale">
                    <span class="gradient-yellow-blue">Frontend Development Training</span>
                </h1>

                <p class="text-white text-xl md:text-2xl font-semibold scroll-fade-right">
                    Master HTML, CSS, JavaScript, React & Modern UI Frameworks
                </p>
            </div>
        </div>
    </section>

    <!-- CTA BANNER -->
    <section class="bg-gradient-to-r from-yellow-400 to-orange-400 text-center py-12 scroll-scale">
        <h2 class="font-extrabold text-3xl md:text-5xl mb-3 text-gray-900 uppercase">Become a Professional Frontend Developer
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
                    <p class="text-sm text-gray-400">Hands-on UI Projects</p>
                </div>
                <div class="scroll-scale">
                    <h3 class="text-5xl font-bold text-orange-500 mb-2">React</h3>
                    <p class="text-sm text-gray-400">Modern Framework</p>
                </div>
                <div class="scroll-scale">
                    <h3 class="text-5xl font-bold text-orange-500 mb-2">Live</h3>
                    <p class="text-sm text-gray-400">Real Website Builds</p>
                </div>
                <div class="scroll-scale">
                    <h3 class="text-5xl font-bold text-orange-500 mb-2">100%</h3>
                    <p class="text-sm text-gray-400">Job-Oriented</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ABOUT SECTION -->
    <section class="py-16 bg-slate-50">
        <div class="max-w-7xl mx-auto px-6">
            <div class="grid md:grid-cols-2 gap-12 items-center">
                <div class="scroll-fade-left">
                    <h6 class="uppercase text-orange-500 font-bold text-sm mb-3">UI / UX & Frontend Engineering
                    </h6>
                    <h2 class="text-4xl font-bold mb-4">Design & Build Modern Web Interfaces
                    </h2>
                    <p class="text-gray-600 text-lg leading-relaxed">
                        Frontend Developers create fast, responsive and interactive
                        websites. This course covers everything from HTML & CSS
                        fundamentals to JavaScript, React, UI frameworks, performance
                        optimization and real-world frontend projects.
                    </p>
                </div>
                <div class="scroll-fade-right">
                    <img src="https://success24.in/img/frontend-training.jpg"
                        class="w-full rounded-2xl shadow-2xl hover-lift"
                        alt="Frontend Development Training" />
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
                <h2 class="text-4xl font-bold mb-4">Frontend Developer Roadmap
                </h2>
                <p class="text-gray-600 text-lg">
                    From UI basics to advanced JavaScript frameworks.
                </p>
            </div>

            <div class="grid md:grid-cols-3 gap-8">

                <!-- Module 1 -->
                <div class="p-6 rounded-2xl border-2 border-gray-200 hover:border-orange-500 hover-lift scroll-reveal bg-white">
                    <h6 class="text-orange-500 font-bold text-sm mb-2">MODULE 01</h6>
                    <h4 class="text-2xl font-bold mb-4">HTML & CSS</h4>
                    <ul class="text-gray-600 space-y-2">
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>HTML5 Structure</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>CSS3 & Flexbox</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Responsive Design</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Bootstrap & Tailwind</li>
                    </ul>
                </div>

                <!-- Module 2 -->
                <div class="p-6 rounded-2xl border-2 border-gray-200 hover:border-orange-500 hover-lift scroll-reveal bg-white">
                    <h6 class="text-orange-500 font-bold text-sm mb-2">MODULE 02</h6>
                    <h4 class="text-2xl font-bold mb-4">JavaScript</h4>
                    <ul class="text-gray-600 space-y-2">
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>ES6+ Concepts</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>DOM Manipulation</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>APIs & Fetch</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Performance Optimization</li>
                    </ul>
                </div>

                <!-- Module 3 -->
                <div class="p-6 rounded-2xl border-2 border-gray-200 hover:border-orange-500 hover-lift scroll-reveal bg-white">
                    <h6 class="text-orange-500 font-bold text-sm mb-2">MODULE 03</h6>
                    <h4 class="text-2xl font-bold mb-4">React & Projects</h4>
                    <ul class="text-gray-600 space-y-2">
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>React Fundamentals</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Components & Hooks</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>State Management</li>
                        <li class="flex gap-2"><i class="fas fa-check-circle text-orange-500 mt-1"></i>Live Frontend Projects</li>
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
                <h2 class="text-4xl font-bold text-gray-900 mb-4">Data Science Career Opportunities
                </h2>
                <p class="text-lg text-gray-600">
                    Get industry-ready with placement support.
                </p>
            </div>

            <div class="grid lg:grid-cols-12 gap-8">

                <!-- Placement Includes -->
                <div class="lg:col-span-7">
                    <div class="p-8 bg-white rounded-2xl border-2 border-gray-200 shadow-lg h-full scroll-fade-left hover-lift">
                        <h4 class="text-2xl font-bold mb-6">Placement Preparation Includes</h4>

                        <div class="grid md:grid-cols-2 gap-6">

                            <div class="flex gap-3">
                                <i class="fas fa-chart-line text-2xl text-orange-500 mt-1"></i>
                                <div>
                                    <h6 class="font-bold text-lg mb-1">Live Analytics Projects</h6>
                                    <p class="text-sm text-gray-600">Real business datasets</p>
                                </div>
                            </div>

                            <div class="flex gap-3">
                                <i class="fas fa-user-tie text-2xl text-orange-500 mt-1"></i>
                                <div>
                                    <h6 class="font-bold text-lg mb-1">Interview Preparation</h6>
                                    <p class="text-sm text-gray-600">ML & statistics questions</p>
                                </div>
                            </div>

                            <div class="flex gap-3">
                                <i class="fas fa-file-alt text-2xl text-orange-500 mt-1"></i>
                                <div>
                                    <h6 class="font-bold text-lg mb-1">Resume Building</h6>
                                    <p class="text-sm text-gray-600">Data scientist profile</p>
                                </div>
                            </div>

                            <div class="flex gap-3">
                                <i class="fas fa-briefcase text-2xl text-orange-500 mt-1"></i>
                                <div>
                                    <h6 class="font-bold text-lg mb-1">Job Assistance</h6>
                                    <p class="text-sm text-gray-600">Placement support</p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Package -->
                <div class="lg:col-span-5">
                    <div class="p-8 rounded-2xl text-center text-white shadow-2xl h-full bg-gradient-to-br from-purple-600 to-indigo-500 scroll-fade-right hover-lift">
                        <h6 class="uppercase font-bold text-sm mb-3 opacity-90">Expected Package</h6>
                        <h1 class="text-6xl font-bold mb-3">6 – 20 LPA</h1>
                        <p class="text-lg opacity-90 mb-6">Based on skills & domain</p>
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
            <h2 class="text-4xl md:text-5xl font-bold mb-6">Ready to Become a Data Scientist?
            </h2>
            <p class="text-xl mb-8 opacity-90">
                Learn Data Science with real-world projects
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
