<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="Android App.aspx.cs" Inherits="Success24v2.Android_App" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/allcourses.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- HERO SECTION -->
    <section class="relative overflow-hidden h-screen flex items-center justify-center">
        <img src="https://success24.in/img/iq-india2.jpeg"
            class="absolute inset-0 w-full h-full object-cover" alt="Android App Development" />

        <div class="hero-overlay"></div>

        <div class="relative z-10 max-w-5xl mx-auto px-6 text-center">
            <div class="hero-text-glow">
                <h2 class="font-bold text-xl md:text-2xl mb-4 scroll-fade-left">
                    <span class="gradient-blue-yellow">2026 Mobile Development Program</span>
                </h2>

                <div class="hero-line mx-auto mb-6"></div>

                <h1 class="font-black text-5xl md:text-7xl mb-6 scroll-scale">
                    <span class="gradient-yellow-blue">Android App Development</span>
                </h1>

                <p class="text-white text-xl md:text-2xl font-semibold scroll-fade-right">
                    Master Java, Kotlin, Firebase & Real-Time Android Projects
                </p>
            </div>
        </div>
    </section>

    <!-- CTA BANNER -->
    <section class="bg-gradient-to-r from-yellow-400 to-orange-400 text-center py-12 scroll-scale">
        <h2 class="font-extrabold text-3xl md:text-5xl mb-3 text-gray-900 uppercase">Start Your Android Career Today
        </h2>
        <div class="text-3xl md:text-5xl font-bold text-white">
            <a href="tel:+919555580458">+91 95555 80458</a>
        </div>
    </section>

    <!-- STATS SECTION -->
    <section class="bg-slate-900 border-t border-b border-slate-700">
        <div class="max-w-7xl mx-auto px-6 py-12">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-8 text-center text-white">
                <div>
                    <h3 class="text-5xl font-bold text-orange-500 mb-2">100%</h3>
                    <p class="text-sm text-gray-400">Hands-on Coding</p>
                </div>
                <div>
                    <h3 class="text-5xl font-bold text-orange-500 mb-2">15+</h3>
                    <p class="text-sm text-gray-400">Live Android Apps</p>
                </div>
                <div>
                    <h3 class="text-5xl font-bold text-orange-500 mb-2">Live</h3>
                    <p class="text-sm text-gray-400">Project Training</p>
                </div>
                <div>
                    <h3 class="text-5xl font-bold text-orange-500 mb-2">Career</h3>
                    <p class="text-sm text-gray-400">Job-Oriented Course</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ABOUT SECTION -->
    <section class="py-16 bg-slate-50">
        <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-2 gap-12 items-center">
            <div>
                <h6 class="uppercase text-orange-500 font-bold text-sm mb-3">Android Development Technology
                </h6>
                <h2 class="text-4xl font-bold mb-4">Build Powerful Android Applications
                </h2>
                <p class="text-gray-600 text-lg">
                    Learn Android app development from scratch using Java & Kotlin.
                    Build real-world apps using Firebase, REST APIs, Material UI
                    and Google Play deployment.
                </p>
            </div>
            <div>
                <img src="https://images.unsplash.com/photo-1518770660439-4636190af475"
                    class="w-full rounded-2xl shadow-2xl" />
            </div>
        </div>
    </section>

    <!-- SYLLABUS -->
    <section class="py-16 bg-white">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-12">
                <h6 class="uppercase text-orange-500 font-bold text-sm mb-3">Complete Curriculum</h6>
                <h2 class="text-4xl font-bold">Android App Development Roadmap</h2>
            </div>

            <div class="grid md:grid-cols-3 gap-8">
                <!-- Module 1 -->
                <div class="p-6 border-2 rounded-2xl">
                    <h6 class="text-orange-500 font-bold">MODULE 01</h6>
                    <h4 class="text-2xl font-bold mb-4">Android Basics</h4>
                    <ul class="text-gray-600 space-y-2">
                        <li>Java & Kotlin Fundamentals</li>
                        <li>Android Studio Setup</li>
                        <li>Activities & Intents</li>
                        <li>Layouts & Views</li>
                    </ul>
                </div>

                <!-- Module 2 -->
                <div class="p-6 border-2 rounded-2xl">
                    <h6 class="text-orange-500 font-bold">MODULE 02</h6>
                    <h4 class="text-2xl font-bold mb-4">Advanced Android</h4>
                    <ul class="text-gray-600 space-y-2">
                        <li>RecyclerView</li>
                        <li>Fragments</li>
                        <li>REST API Integration</li>
                        <li>Firebase Database</li>
                    </ul>
                </div>

                <!-- Module 3 -->
                <div class="p-6 border-2 rounded-2xl">
                    <h6 class="text-orange-500 font-bold">MODULE 03</h6>
                    <h4 class="text-2xl font-bold mb-4">Deployment & Projects</h4>
                    <ul class="text-gray-600 space-y-2">
                        <li>Google Play Store</li>
                        <li>App Security</li>
                        <li>Live Projects</li>
                        <li>Interview Preparation</li>
                    </ul>
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
    <section class="py-20 bg-gradient-to-r from-orange-500 to-red-500 text-white text-center">
        <h2 class="text-4xl md:text-5xl font-bold mb-6">Ready to Become an Android Developer?
        </h2>
        <a href="tel:+919555580458"
            class="bg-white text-orange-600 px-10 py-4 rounded-full font-bold text-lg">Call Now
        </a>
    </section>

</asp:Content>
