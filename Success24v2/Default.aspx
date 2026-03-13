<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Success24v2.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Best Training Institute in Noida | Free Training Till Placement</title>
    <style type="text/css">
        .bg-breadcrumb {
            background: linear-gradient(rgba(242, 139, 0, 0.2),
            rgba(242, 139, 0, 0.3)),
            url(https://success24.in/img/iq-india1.jpg) !important;
        }

        .counter-facts {
            background: linear-gradient(rgba(255, 255, 255, .8),
            rgba(255, 255, 255, 0.7)),
            url(https://success24.in/img/iq-india3.jpg);
        }

        .iheader img { object-fit: fill !important; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
<%--<section class="relative bg-gradient-to-r from-orange-500 via-orange-600 to-red-500 text-white py-20 overflow-hidden">
    <div class="absolute inset-0 opacity-20">
        <div class="absolute top-0 left-0 w-96 h-96 bg-white rounded-full blur-3xl animate-pulse"></div>
        <div class="absolute bottom-0 right-0 w-96 h-96 bg-pink-300 rounded-full blur-3xl animate-pulse" style="animation-delay: 1s;"></div>
    </div>
    <div class="max-w-7xl mx-auto px-6 relative z-10">
        <div class="grid md:grid-cols-2 gap-12 items-center">
            <div class="scroll-fade-left">
                <h1 class="text-5xl md:text-6xl font-bold mb-6 leading-tight">Transform Your Future With
                    <span class="block text-yellow-300">Quality Education</span>
                </h1>
                <p class="text-xl mb-8 text-white/90">Join Success24 and master the skills that matter. Expert trainers, hands-on projects, and career support await you.</p>
                <div class="flex flex-wrap gap-4">
                    <a href="/courses" class="bg-white text-orange-600 px-8 py-4 rounded-full font-semibold hover:bg-yellow-300 hover:scale-105 transition-all shadow-lg">Explore Courses
                    </a>
                    <a href="/contact" class="border-2 border-white px-8 py-4 rounded-full font-semibold hover:bg-white hover:text-orange-600 transition-all">Get Started
                    </a>
                </div>
            </div>
            <div class="scroll-fade-right">
                <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800" alt="Students Learning" class="rounded-2xl shadow-2xl hover-lift" />
            </div>
        </div>
    </div>
</section>
<div class="w-full py-24 relative overflow-hidden bg-orange-600">

    <div class="container mx-auto px-6 relative z-10">
        <div class="text-center mb-20">
            <p class="uppercase tracking-[0.4em] text-orange-100 font-bold mb-4 text-xs md:text-sm drop-shadow-sm">
                Our Achievements
            </p>

            <h2 class="text-4xl md:text-6xl font-black text-white drop-shadow-lg tracking-tight">success
    <span class="text-transparent bg-clip-text bg-gradient-to-r from-yellow-200 to-yellow-400">Numbers
    </span>
            </h2>

            <div class="w-24 h-1 bg-white/30 mx-auto mt-6 rounded-full"></div>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">

            <div class="group bg-white/10 backdrop-blur-md border border-white/20 rounded-3xl p-8 text-center transition-all duration-300 hover:bg-white/20 hover:-translate-y-2 shadow-xl">
                <h6 class="text-orange-100 text-xs uppercase font-bold tracking-[0.2em] mb-4 group-hover:text-white transition-colors">Total Success
                </h6>

                <h2 class="text-5xl md:text-6xl font-black text-white drop-shadow-md">
                    <span class="counter">
                        <asp:Literal ID="_LiteralSuccessMaster1" runat="server" />
                    </span>
                    <span class="text-3xl align-top text-yellow-300 ml-1">+</span>
                </h2>
            </div>

            <div class="group bg-white/10 backdrop-blur-md border border-white/20 rounded-3xl p-8 text-center transition-all duration-300 hover:bg-white/20 hover:-translate-y-2 shadow-xl">
                <h6 class="text-orange-100 text-xs uppercase font-bold tracking-[0.2em] mb-4 group-hover:text-white transition-colors">Best Instructor
                </h6>

                <h2 class="text-5xl md:text-6xl font-black text-white drop-shadow-md">
                    <span class="counter" data-target="10">0</span>
                    <span class="text-3xl align-top text-yellow-300 ml-1">+</span>
                </h2>
            </div>

            <div class="group bg-white/10 backdrop-blur-md border border-white/20 rounded-3xl p-8 text-center transition-all duration-300 hover:bg-white/20 hover:-translate-y-2 shadow-xl">
                <h6 class="text-orange-100 text-xs uppercase font-bold tracking-[0.2em] mb-4 group-hover:text-white transition-colors">Total Batch
                </h6>

                <h2 class="text-5xl md:text-6xl font-black text-white drop-shadow-md">
                    <span class="counter" data-target="50">0</span>
                    <span class="text-3xl align-top text-yellow-300 ml-1">+</span>
                </h2>
            </div>

            <div class="group bg-white/10 backdrop-blur-md border border-white/20 rounded-3xl p-8 text-center transition-all duration-300 hover:bg-white/20 hover:-translate-y-2 shadow-xl">
                <h6 class="text-orange-100 text-xs uppercase font-bold tracking-[0.2em] mb-4 group-hover:text-white transition-colors">Practitioners
                </h6>

                <h2 class="text-5xl md:text-6xl font-black text-white drop-shadow-md">
                    <span class="counter">
                         <asp:Literal ID="Literal1" runat="server" />
                       <asp:Literal ID="_LiteralPracMaster1" runat="server" />
                    </span>
                    <span class="text-3xl align-top text-yellow-300 ml-1">+</span>
                </h2>
            </div>

        </div>
    </div>
</div>
<!-- Featured Courses -->
<section class="py-20 bg-slate-50">
    <div class="max-w-7xl mx-auto px-6">
        <div class="text-center mb-16 scroll-reveal">
            <h2 class="text-4xl font-bold text-gray-900 mb-4">Popular Courses</h2>
            <p class="text-xl text-gray-600">Master in-demand skills with our comprehensive training programs</p>
        </div>
        <div class="grid md:grid-cols-3 gap-8">
            <!-- Course Card 1 -->
            <div class="bg-white rounded-2xl shadow-lg overflow-hidden hover-lift scroll-reveal">
                <img src="https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600" alt="Web Development" class="w-full h-48 object-cover" />
                <div class="p-6">
                    <span class="bg-orange-100 text-orange-600 px-3 py-1 rounded-full text-sm font-semibold">Development</span>
                    <h3 class="text-2xl font-bold mt-4 mb-3">Full Stack Web Development</h3>
                    <p class="text-gray-600 mb-4">Master HTML, CSS, JavaScript, React, Node.js and build real-world projects.</p>
                    <div class="flex items-center justify-between">
                        <span class="text-orange-600 font-bold text-xl">₹25,000</span>
                        <a href="/courses/web-dev" class="bg-orange-500 text-white px-6 py-2 rounded-full hover:bg-orange-600 transition-colors">Enroll Now
                        </a>
                    </div>
                </div>
            </div>

            <!-- Course Card 2 -->
            <div class="bg-white rounded-2xl shadow-lg overflow-hidden hover-lift scroll-reveal">
                <img src="https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=600" alt="Data Science" class="w-full h-48 object-cover" />
                <div class="p-6">
                    <span class="bg-blue-100 text-blue-600 px-3 py-1 rounded-full text-sm font-semibold">Data Science</span>
                    <h3 class="text-2xl font-bold mt-4 mb-3">Data Science & Analytics</h3>
                    <p class="text-gray-600 mb-4">Learn Python, Machine Learning, Data Visualization and AI fundamentals.</p>
                    <div class="flex items-center justify-between">
                        <span class="text-orange-600 font-bold text-xl">₹30,000</span>
                        <a href="/courses/data-science" class="bg-orange-500 text-white px-6 py-2 rounded-full hover:bg-orange-600 transition-colors">Enroll Now
                        </a>
                    </div>
                </div>
            </div>

            <!-- Course Card 3 -->
            <div class="bg-white rounded-2xl shadow-lg overflow-hidden hover-lift scroll-reveal">
                <img src="https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=600" alt="Digital Marketing" class="w-full h-48 object-cover" />
                <div class="p-6">
                    <span class="bg-green-100 text-green-600 px-3 py-1 rounded-full text-sm font-semibold">Marketing</span>
                    <h3 class="text-2xl font-bold mt-4 mb-3">Digital Marketing Mastery</h3>
                    <p class="text-gray-600 mb-4">Master SEO, Social Media, PPC, Content Marketing and Analytics.</p>
                    <div class="flex items-center justify-between">
                        <span class="text-orange-600 font-bold text-xl">₹20,000</span>
                        <a href="/courses/digital-marketing" class="bg-orange-500 text-white px-6 py-2 rounded-full hover:bg-orange-600 transition-colors">Enroll Now
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>--%>
    <asp:Literal runat="server" ID="_LiteralContent"></asp:Literal>
</asp:Content>
