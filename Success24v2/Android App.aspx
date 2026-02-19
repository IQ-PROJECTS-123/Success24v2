<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="Android App.aspx.cs" Inherits="Success24v2.Android_App" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="relative min-h-[90vh] flex items-center justify-center overflow-hidden">
        <img src="https://success24.in/img/iq-india2.jpeg"
            class="absolute inset-0 w-full h-full object-cover object-center"
            alt="Android App Development Class in _#City#_" loading="eager" />

        <div class="absolute inset-0 bg-gradient-to-b from-slate-900/60 via-slate-900/70 to-slate-900/90"></div>

        <div class="relative z-10 max-w-6xl mx-auto px-6 text-center">
            <span class="inline-block py-1.5 px-4 rounded-full bg-orange-500 text-white font-bold text-xs uppercase tracking-widest mb-6 shadow-lg">New Batch: Master Kotlin in _#City#_
            </span>

            <h1 class="text-5xl md:text-7xl lg:text-8xl font-black mb-6 text-white leading-tight drop-shadow-2xl">
                <asp:Literal ID="litH1" runat="server">Build Real Apps in <span class="text-orange-500">_#City#_</span></asp:Literal>
            </h1>

            <p class="text-gray-100 text-xl md:text-2xl font-medium mb-10 max-w-4xl mx-auto leading-relaxed drop-shadow-md">
                Stop watching tutorials. Start building. Learn **Android 14** using Kotlin & Jetpack Compose, and let's actually <span class="bg-orange-600 px-2 py-1 rounded">get your first app live</span> on the Play Store.
            </p>

            <div class="flex flex-col sm:flex-row gap-5 justify-center">
                <a href="tel:+919555580458" class="bg-orange-600 text-white px-10 py-4 rounded-xl font-extrabold hover:bg-orange-700 transition-all hover:scale-105 shadow-xl shadow-orange-600/40 text-lg uppercase tracking-wider">Start Your Journey
                </a>
                <a href="#syllabus" class="bg-white/10 backdrop-blur-md text-white border-2 border-white/30 px-10 py-4 rounded-xl font-extrabold hover:bg-white/20 transition-all hover:scale-105 text-lg uppercase tracking-wider">View Syllabus!
                </a>
            </div>
        </div>

        <div class="absolute bottom-0 left-0 w-full h-24 bg-gradient-to-t from-black to-transparent"></div>
    </section>
     <section class="bg-gradient-to-r from-yellow-400 to-orange-400 text-center py-12 scroll-scale">
     <h2 class="font-extrabold text-3xl md:text-5xl mb-3 text-gray-900 uppercase">Start Your Android Development Career Now!
     </h2>
     <div class="text-3xl md:text-5xl font-bold text-white">
         <a href="tel:+919555580458" class="hover:text-gray-900 transition-colors">+91 95555 80458
         </a>
     </div>
 </section>

    <section class="bg-black py-10 border-b border-gray-800">
        <div class="max-w-7xl mx-auto px-6 grid grid-cols-2 md:grid-cols-4 gap-8">
            <div class="text-center">
                <p class="text-3xl font-bold text-white">500+</p>
                <p class="text-gray-500 text-sm">Success Stories</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">12LPA</p>
                <p class="text-gray-500 text-sm">Top Salary Package</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">10+</p>
                <p class="text-gray-500 text-sm">Hands-on Projects</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">100%</p>
                <p class="text-gray-500 text-sm">Job Hunt Support</p>
            </div>
        </div>
    </section>

    <section class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-2 gap-16 items-center">
            <div>
                <h6 class="text-orange-600 font-bold uppercase tracking-wide mb-2">The Success24 Edge</h6>
                <h2 class="text-4xl font-bold text-gray-900 mb-6">Learn the tools that modern tech teams actually use</h2>
                <p class="text-gray-600 text-lg mb-6">
                    If you're looking for Android training in _#City#_, don't get stuck learning outdated tech. We skipped the old Java & XML "death march." Instead, we focus on **Kotlin and Jetpack Compose**—the modern standard Google uses for their own apps.
                </p>
                <ul class="space-y-4">
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Step-by-step Play Store deployment (Your app, your account)</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Real-world Clean Architecture (MVVM) used in industry</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Prepare for Google's Associate Android Developer exam</span>
                    </li>
                </ul>
            </div>
            <div class="relative">
                <div class="absolute -inset-4 bg-orange-100 rounded-3xl transform rotate-3"></div>
                <img src="https://success24.in/img/data-science-img.jpg" class="relative rounded-2xl shadow-2xl w-full" alt="Android Development Class in _#City#_" />
            </div>
        </div>
    </section>

    <section id="syllabus" class="py-20 bg-slate-50">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">Your Roadmap to Becoming a Pro</h2>
                <p class="text-gray-600 max-w-2xl mx-auto">A 6-month journey designed to take you from writing your first line of code to launching a full-scale app.</p>
            </div>

            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center text-blue-600 font-bold mb-6">01</div>
                    <h3 class="text-xl font-bold mb-3">Thinking in Kotlin</h3>
                    <p class="text-gray-500 text-sm mb-4">Mastering the language that makes Android development fun and concise.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Logic, Loops & Collections</li>
                        <li>Modern OOPs Concepts</li>
                        <li>Lambdas & Functional Magic</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-indigo-100 rounded-lg flex items-center justify-center text-indigo-600 font-bold mb-6">02</div>
                    <h3 class="text-xl font-bold mb-3">The Android Ecosystem</h3>
                    <p class="text-gray-500 text-sm mb-4">Deep dive into Android Studio and how apps actually "live" on a phone.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Studio Setup & Gradle Management</li>
                        <li>Mastering Activity Lifecycles</li>
                        <li>Intents & Deep Linking</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center text-purple-600 font-bold mb-6">03</div>
                    <h3 class="text-xl font-bold mb-3">Modern UI with Compose</h3>
                    <p class="text-gray-500 text-sm mb-4">The modern way. Build beautiful, reactive interfaces with pure code.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Declarative UI & Modifiers</li>
                        <li>State: The Heart of Compose</li>
                        <li>Material Design 3 Styling</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center text-orange-600 font-bold mb-6">04</div>
                    <h3 class="text-xl font-bold mb-3">Data & Networking</h3>
                    <p class="text-gray-500 text-sm mb-4">Connecting your app to the world via APIs and high-performance threading.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Clean Architecture (MVVM)</li>
                        <li>Retrofit & API Integration</li>
                        <li>Coroutines for Smooth UX</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-rose-100 rounded-lg flex items-center justify-center text-rose-600 font-bold mb-6">05</div>
                    <h3 class="text-xl font-bold mb-3">Persistence & Cloud</h3>
                    <p class="text-gray-500 text-sm mb-4">Handling user data locally and syncing with Firebase in real-time.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Room DB (Offline First Apps)</li>
                        <li>Firebase Auth & Realtime Data</li>
                        <li>Engagement via Notifications</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-teal-100 rounded-lg flex items-center justify-center text-teal-600 font-bold mb-6">06</div>
                    <h3 class="text-xl font-bold mb-3">Launch Day Prep</h3>
                    <p class="text-gray-500 text-sm mb-4">Packaging your hard work and putting it in front of millions of users.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>App Bundles & Optimization</li>
                        <li>Play Console Management</li>
                        <li>AdMob & In-App Purchases</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="py-20 bg-slate-900 text-white">
        <div class="max-w-7xl mx-auto px-6">
            <div class="flex flex-col md:flex-row items-center justify-between gap-12">

                <div class="md:w-1/2">
                    <h6 class="text-orange-500 font-bold mb-2 uppercase tracking-wider">Career Readiness</h6>
                    <h2 class="text-3xl md:text-4xl font-bold mb-6">Show, Don't Just Tell.</h2>
                    <p class="text-gray-400 text-lg mb-8 leading-relaxed">
                        In the tech world, your GitHub and Play Store profile matter more than a piece of paper. In our _#City#_ labs, we focus on building a portfolio that forces recruiters to notice you.
                    </p>

                    <div class="space-y-8">
                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-orange-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">
                                📱
                            </div>
                            <div>
                                <h4 class="font-bold text-xl text-white">The Play Store Portfolio</h4>
                                <p class="text-gray-400 text-sm mt-1">Don't just code "hello world." We help you publish 2 major projects—like an E-commerce or Social app—to your own account.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-blue-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">
                                🤝
                            </div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Earn While You Learn</h4>
                                <p class="text-gray-400 text-sm mt-1">We’ll show you how to set up your Upwork profile and bid on Android projects before the course even ends.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-purple-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">
                                💻
                            </div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Interview "War" Room</h4>
                                <p class="text-gray-400 text-sm mt-1">Get comfortable with live machine coding rounds. We practice until you can build a UI from scratch in 30 minutes.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="md:w-1/2 w-full">
                    <div class="bg-slate-800/50 p-8 rounded-3xl border border-slate-700 backdrop-blur-sm">
                        <h3 class="text-xl font-bold mb-6 text-center text-white">Your Developer Toolkit</h3>

                        <div class="grid grid-cols-2 gap-4">
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Android Studio</h5>
                                <p class="text-gray-400 text-xs">Debugging & Profiling</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Kotlin</h5>
                                <p class="text-gray-400 text-xs">Clean & Modern Code</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Firebase</h5>
                                <p class="text-gray-400 text-xs">Auth & Cloud Power</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Git & GitHub</h5>
                                <p class="text-gray-400 text-xs">Team Collaboration</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Postman</h5>
                                <p class="text-gray-400 text-xs">API Stress Testing</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Figma</h5>
                                <p class="text-gray-400 text-xs">Design-to-Code Mastery</p>
                            </div>
                        </div>

                        <div class="mt-8 text-center">
                            <p class="text-gray-500 text-xs italic">Updated for 2026 Android App Quality Standards.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="py-20 bg-white overflow-hidden">
        <div class="max-w-7xl mx-auto px-6 mb-10 text-center">
            <h2 class="text-3xl font-bold">Inside the Classroom</h2>
            <p class="text-gray-500">Hackathons, late-night coding sessions, and app launches in _#City#_</p>
        </div>

        <div class="relative max-w-7xl mx-auto px-6">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <img src="https://success24.in/img/class1.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Android Lab in _#City#_" loading="lazy" />
                <img src="https://success24.in/img/DS_5.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Students learning Kotlin" loading="lazy" />
                <img src="https://success24.in/img/classds.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Live App Demo" loading="lazy" />
                <img src="https://success24.in/img/class_4.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Placement Drive _#City#_" loading="lazy" />
            </div>
        </div>
    </section>

    <section class="py-20 bg-gray-50">
        <div class="max-w-4xl mx-auto px-6">
            <h2 class="text-3xl font-bold text-center mb-12">Things You Might Be Wondering</h2>

            <div class="space-y-4">
                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Do I need a high-end laptop to start?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Android Studio likes RAM. We recommend at least 8GB (though 16GB is the sweet spot) and an SSD. If your current machine can't handle it, don't worry—you can use our high-spec lab computers here in _#City#_ anytime.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Java or Kotlin? Which one is better to learn?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        We go all-in on **Kotlin**. Google made it the official language for Android years ago. While Java is great for legacy apps, Kotlin is what top companies are using to build new apps today. It's faster, safer, and much easier to read.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Can I build for iPhone after this course?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        This is a native Android course, but we’ve included a bonus module on **Kotlin Multiplatform (KMP)**. This is the future of mobile—it allows you to use your Kotlin skills to share logic and build for iOS as well.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Will you help me get my app on the Play Store?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Absolutely. We don't consider the project finished until it’s live. We’ll walk you through the entire process of setting up a developer account, passing Google's review, and getting that live link you can share.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        How do I pay for the course?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        We try to keep it flexible. You can pay in installments, and we offer EMI options to make it easier. Give us a call at +91 95555 80458 and we can figure out a plan that works for you.
                    </p>
                </details>
            </div>
        </div>
    </section>
</asp:Content>