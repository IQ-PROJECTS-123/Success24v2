<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/24.Master"
    AutoEventWireup="true" CodeBehind="Contact.aspx.cs"
    Inherits="Success24v2.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contact Us | Success24</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #fcfcfc;
            color: #1a1a1a;
        }

        .info-card {
            background: #ffffff;
            border: 1px solid #eaeaea;
            transition: all 0.4s cubic-bezier(0.23, 1, 0.32, 1);
            position: relative;
            overflow: hidden;
        }

            .info-card:hover {
                border-color: #ff6b00;
                transform: translateY(-8px);
                box-shadow: 0 25px 50px -12px rgba(255, 107, 0, 0.15);
            }


            .info-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 4px;
                background: #ff6b00;
                transform: scaleX(0);
                transform-origin: left;
                transition: transform 0.4s ease;
            }

            .info-card:hover::before {
                transform: scaleX(1);
            }

        .map-container {
            filter: grayscale(0.2) contrast(1.1);
            transition: filter 0.5s ease;
            border: 8px solid white;
        }

            .map-container:hover {
                filter: grayscale(0);
            }

        .text-visible {
            color: #111111;
        }

        .text-muted {
            color: #555555;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-7xl mx-auto px-6 py-20">

        <div class="flex flex-col md:flex-row justify-between items-end gap-6 mb-16">
            <div class="max-w-2xl">
                <span class="text-orange-600 font-bold tracking-widest uppercase text-sm">Connect with us</span>
                <h1 class="text-5xl md:text-7xl font-extrabold text-visible tracking-tight mt-4">We're here to help
                    <br />
                    you <span class="text-orange-500">succeed.</span>
                </h1>
            </div>
            <div class="pb-2">
                <p class="text-muted text-lg max-w-xs leading-relaxed">
                    Our team is available Monday through Saturday to answer your technical and business queries.
                </p>
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

            <div class="info-card p-10 rounded-[2rem]">
                <div class="w-14 h-14 bg-orange-100 rounded-2xl flex items-center justify-center mb-8">
                    <i class="fa fa-map-marker-alt text-orange-600 text-2xl"></i>
                </div>
                <h3 class="text-2xl font-bold text-visible mb-4">Visit Our Center</h3>
                <p class="text-muted leading-relaxed mb-6">
                    D1/338, New Kondli, Delhi – 110096
                </p>
                <a href="https://www.google.com/maps/search/?api=1&query=D1/338,+New+Kondli,+Delhi+110096" target="_blank" class="text-orange-600 font-bold flex items-center gap-2 hover:gap-4 transition-all">Get Directions <i class="fa fa-arrow-right text-sm"></i>
                </a>
            </div>

            <div class="info-card p-10 rounded-[2rem]">
                <div class="w-14 h-14 bg-orange-100 rounded-2xl flex items-center justify-center mb-8">
                    <i class="fa fa-phone-alt text-orange-600 text-2xl"></i>
                </div>
                <h3 class="text-2xl font-bold text-visible mb-4">Call or Message</h3>
                <p class="text-muted leading-relaxed mb-2 font-semibold">Primary: +91-9555580458</p>
                <p class="text-muted leading-relaxed mb-8">WhatsApp: +91-9555580458</p>

                <div class="flex gap-4">
                    <a href="#" class="w-10 h-10 rounded-full bg-zinc-100 flex items-center justify-center hover:bg-orange-500 hover:text-white transition-all"><i class="fab fa-linkedin-in"></i></a>
                    <a href="#" class="w-10 h-10 rounded-full bg-zinc-100 flex items-center justify-center hover:bg-orange-500 hover:text-white transition-all"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="w-10 h-10 rounded-full bg-zinc-100 flex items-center justify-center hover:bg-orange-500 hover:text-white transition-all"><i class="fab fa-youtube"></i></a>
                </div>
            </div>

            <div class="info-card p-10 rounded-[2rem] lg:col-span-1 md:col-span-2 lg:col-span-1">
                <div class="w-14 h-14 bg-orange-100 rounded-2xl flex items-center justify-center mb-8">
                    <i class="fa fa-envelope text-orange-600 text-2xl"></i>
                </div>
                <h3 class="text-2xl font-bold text-visible mb-4">Digital Support</h3>
                <p class="text-muted leading-relaxed mb-6">
                    Drop us an email and we'll reply
                    <br />
                    within 4 working hours.
                </p>
                <div class="space-y-2">
                    <a href="mailto:info@success24.in" class="block text-xl font-bold text-visible hover:text-orange-600 transition-colors">info@success24.in</a>
                    <a href="mailto:support@success24.in" class="block text-xl font-bold text-visible hover:text-orange-600 transition-colors">support@success24.in</a>
                </div>
            </div>

        </div>

        <div class="mt-12">
            <div class="map-container rounded-[3rem] shadow-2xl overflow-hidden h-[500px]">
                <iframe
                    class="w-full h-full border-0"
                    src="https://maps.google.com/maps?q=D1/338,+New+Kondli,+Delhi+110096&t=&z=15&ie=UTF8&iwloc=&output=embed"
                    allowfullscreen=""
                    loading="lazy"></iframe>
            </div>
        </div>

        <div class="mt-16 text-center bg-orange-600 rounded-[2.5rem] p-12 text-white">
            <h2 class="text-3xl font-bold mb-4">Ready to start your journey?</h2>
            <p class="opacity-90 mb-8 max-w-xl mx-auto">Join over 5,000+ students who have transformed their careers with Success24.</p>
            <div class="flex flex-col sm:flex-row justify-center gap-4">
                <a href="courses.aspx" class="bg-white text-orange-600 px-10 py-4 rounded-2xl font-bold hover:bg-zinc-100 transition-all">Browse Courses</a>

            </div>
        </div>

    </div>
</asp:Content>
