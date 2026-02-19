<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="Angular.aspx.cs" Inherits="Success24v2.Angular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="relative min-h-[90vh] flex items-center justify-center overflow-hidden">
        <img src="https://success24.in/img/iq-india2.jpeg"
            class="absolute inset-0 w-full h-full object-cover object-center"
            alt="Angular Training Class in ___#City#___" loading="eager" />

        <div class="absolute inset-0 bg-gradient-to-b from-slate-900/60 via-slate-900/70 to-slate-900/90"></div>

        <div class="relative z-10 max-w-6xl mx-auto px-6 text-center">
            <span class="inline-block py-1.5 px-4 rounded-full bg-orange-500 text-white font-bold text-xs uppercase tracking-widest mb-6 shadow-lg">Grab your spot for the next batch in ___#City#___
            </span>

            <h1 class="text-5xl md:text-7xl lg:text-8xl font-black mb-6 text-white leading-tight drop-shadow-2xl">
                <asp:Literal ID="litH1" runat="server">Don't just code. Build with <span class="text-orange-500">Angular</span>.</asp:Literal>
            </h1>

            <p class="text-gray-100 text-xl md:text-2xl font-medium mb-10 max-w-4xl mx-auto leading-relaxed drop-shadow-md">
                Stop struggling with complex docs. We help you master modern frontend development with <span class="bg-orange-600 px-2 py-1 rounded">hands-on mentorship</span>. 
                Go from "Hello World" to Senior Dev with TypeScript, Signals, and RxJS.
            </p>

            <div class="flex flex-col sm:flex-row gap-5 justify-center">
                <a href="tel:+919555580458" class="bg-orange-600 text-white px-10 py-4 rounded-xl font-extrabold hover:bg-orange-700 transition-all hover:scale-105 shadow-xl shadow-orange-600/40 text-lg uppercase tracking-wider">Get free counseling
                </a>
                <a href="#syllabus" class="bg-white/10 backdrop-blur-md text-white border-2 border-white/30 px-10 py-4 rounded-xl font-extrabold hover:bg-white/20 transition-all hover:scale-105 text-lg uppercase tracking-wider">What you'll learn
                </a>
            </div>
        </div>

        <div class="absolute bottom-0 left-0 w-full h-24 bg-gradient-to-t from-black to-transparent"></div>
    </section>
    <section class="bg-gradient-to-r from-yellow-400 to-orange-400 text-center py-12 scroll-scale">
        <h2 class="font-extrabold text-3xl md:text-5xl mb-3 text-gray-900 uppercase">Start Your Angular development Journy Today
        </h2>
        <div class="text-3xl md:text-5xl font-bold text-white">
            <a href="tel:+919555580458" class="hover:text-gray-900 transition-colors">+91 95555 80458
            </a>
        </div>
    </section>

    <section class="bg-black py-10 border-b border-gray-800">
        <div class="max-w-7xl mx-auto px-6 grid grid-cols-2 md:grid-cols-4 gap-8">
            <div class="text-center">
                <p class="text-3xl font-bold text-white">800+</p>
                <p class="text-gray-500 text-sm">Success Stories</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">10LPA+</p>
                <p class="text-gray-500 text-sm">Our Average Salaries</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">12+</p>
                <p class="text-gray-500 text-sm">Real-World Projects</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">100%</p>
                <p class="text-gray-500 text-sm">Career Guidance</p>
            </div>
        </div>
    </section>

    <section class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-2 gap-16 items-center">
            <div>
                <h6 class="text-orange-600 font-bold uppercase tracking-wide mb-2">The Success24 Edge</h6>
                <h2 class="text-4xl font-bold text-gray-900 mb-6">Learn the "Secret Sauce" of Enterprise Apps</h2>
                <p class="text-gray-600 text-lg mb-6">
                    Tired of generic tutorials? We get it. Our Angular training in ___#City#___ focuses on how things actually work in high-stakes tech companies. We don't just teach syntax; we teach you how to think like an Architect.
                </p>
                <ul class="space-y-4">
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Master Clean Code with TypeScript</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Solve "Impossible" Problems with RxJS</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Future-Proof Skills: Signals & Standalone Components</span>
                    </li>
                </ul>
            </div>
            <div class="relative">
                <div class="absolute -inset-4 bg-orange-100 rounded-3xl transform rotate-3"></div>
                <img src="https://success24.in/img/data-science-img.jpg" class="relative rounded-2xl shadow-2xl w-full" alt="Angular Development Class in ___#City#___" />
            </div>
        </div>
    </section>

    <section id="syllabus" class="py-20 bg-slate-50">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">Your Roadmap to Mastery</h2>
                <p class="text-gray-600 max-w-2xl mx-auto">No fluff. Just a clear, 6-month path to becoming the developer companies are fighting to hire.</p>
            </div>

            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center text-blue-600 font-bold mb-6">01</div>
                    <h3 class="text-xl font-bold mb-3">Strong Foundations</h3>
                    <p class="text-gray-500 text-sm mb-4">You can't build a skyscraper on sand. We start with rock-solid TypeScript.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Modern JS to TS Bridge</li>
                        <li>Interfaces & Smart Typing</li>
                        <li>Async Logic & Generics</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-indigo-100 rounded-lg flex items-center justify-center text-indigo-600 font-bold mb-6">02</div>
                    <h3 class="text-xl font-bold mb-3">Thinking in Angular</h3>
                    <p class="text-gray-500 text-sm mb-4">Understand the "Life" of a component and how to manage data flow properly.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Smart & Dumb Components</li>
                        <li>The Lifecycle Hook Secret</li>
                        <li>DOM Manipulation properly</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center text-purple-600 font-bold mb-6">03</div>
                    <h3 class="text-xl font-bold mb-3">Reactive Power</h3>
                    <p class="text-gray-500 text-sm mb-4">The hardest part of Angular made easy. Master data streams without the headache.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>RxJS Simplified</li>
                        <li>Signals: The New Standard</li>
                        <li>State Management that Scales</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center text-orange-600 font-bold mb-6">04</div>
                    <h3 class="text-xl font-bold mb-3">The User Experience</h3>
                    <p class="text-gray-500 text-sm mb-4">Build apps that feel fast and forms that users actually enjoy filling out.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Ultra-Fast Lazy Loading</li>
                        <li>Complex Reactive Forms</li>
                        <li>Secure Route Guards</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-rose-100 rounded-lg flex items-center justify-center text-rose-600 font-bold mb-6">05</div>
                    <h3 class="text-xl font-bold mb-3">Professional Grade</h3>
                    <p class="text-gray-500 text-sm mb-4">Go beyond the basics. Learn the tools used by big players like Google and Netflix.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Interceptors & API Logic</li>
                        <li>Server Side Rendering (SSR)</li>
                        <li>Performance Optimization</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-teal-100 rounded-lg flex items-center justify-center text-teal-600 font-bold mb-6">06</div>
                    <h3 class="text-xl font-bold mb-3">Launch & Career</h3>
                    <p class="text-gray-500 text-sm mb-4">The finish line. Polishing your work and getting you through the interview door.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Testing your code like a pro</li>
                        <li>CI/CD & Cloud Deployment</li>
                        <li>Portfolio & Mock Interviews</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="py-20 bg-slate-900 text-white">
        <div class="max-w-7xl mx-auto px-6">
            <div class="flex flex-col md:flex-row items-center justify-between gap-12">

                <div class="md:w-1/2">
                    <h6 class="text-orange-500 font-bold mb-2 uppercase tracking-wider">Your Career, Upgraded</h6>
                    <h2 class="text-3xl md:text-4xl font-bold mb-6">We don't just teach. We help you get hired.</h2>
                    <p class="text-gray-400 text-lg mb-8 leading-relaxed">
                        Knowing the code is only half the battle. In ___#City#___, we focus on making you the "Complete Package" that hiring managers are actually looking for.
                    </p>

                    <div class="space-y-8">
                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-orange-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">🚀</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">A Portfolio that Pops</h4>
                                <p class="text-gray-400 text-sm mt-1">Graduate with 12+ real apps on your GitHub. Show recruiters proof, not just a certificate.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-blue-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">💬</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Crush the Interview</h4>
                                <p class="text-gray-400 text-sm mt-1">We practice the tough questions—from system design patterns to live coding rounds.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-purple-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">🤝</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Direct Connections</h4>
                                <p class="text-gray-400 text-sm mt-1">Skip the "Apply" button. We put your resume directly in front of our hiring partners in ___#City#___.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="md:w-1/2 w-full">
                    <div class="bg-slate-800/50 p-8 rounded-3xl border border-slate-700 backdrop-blur-sm">
                        <h3 class="text-xl font-bold mb-6 text-center text-white">The Tech You'll Own</h3>

                        <div class="grid grid-cols-2 gap-4">
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Modern Angular</h5>
                                <p class="text-gray-400 text-xs">Signals & Control Flow</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">TypeScript</h5>
                                <p class="text-gray-400 text-xs">Expert Level Typing</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Reactive Data</h5>
                                <p class="text-gray-400 text-xs">RxJS & Observables</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Scalability</h5>
                                <p class="text-gray-400 text-xs">NgRx & Store Logic</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Design</h5>
                                <p class="text-gray-400 text-xs">Material & Tailwind</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Confidence</h5>
                                <p class="text-gray-400 text-xs">Unit & E2E Testing</p>
                            </div>
                        </div>

                        <div class="mt-8 text-center">
                            <p class="text-gray-500 text-xs italic">Learning the standards that modern tech giants use today.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-20 bg-white overflow-hidden">
        <div class="max-w-7xl mx-auto px-6 mb-10 text-center">
            <h2 class="text-3xl font-bold">See Where the Magic Happens</h2>
            <p class="text-gray-500">Real people, real projects, real growth in ___#City#___</p>
        </div>

        <div class="relative max-w-7xl mx-auto px-6">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <img src="https://success24.in/img/class1.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Angular Lab in ___#City#___" loading="lazy" />
                <img src="https://success24.in/img/DS_5.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Students learning TypeScript" loading="lazy" />
                <img src="https://success24.in/img/classds.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Frontend Project Session" loading="lazy" />
                <img src="https://success24.in/img/class_4.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Placement Drive ___#City#___" loading="lazy" />
            </div>
        </div>
    </section>

    <section class="py-20 bg-gray-50">
        <div class="max-w-4xl mx-auto px-6">
            <h2 class="text-3xl font-bold text-center mb-12">Common Questions</h2>

            <div class="space-y-4">
                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        What if I'm not great at JavaScript yet?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        No problem! We start with a "JavaScript to TypeScript" bridge module. We make sure your base is strong before we dive into the complex Angular stuff.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Are we learning the latest version?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Absolutely. We focus on Angular v17/18 and beyond. You'll learn modern syntax like Signals and Standalone Components that many veteran devs haven't even mastered yet.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Will I actually build something useful?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Yes! You'll build a full E-commerce store, a real-time chat app, and a complex dashboard. These aren't "to-do lists"—they are resume-worthy projects.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Is the job market good for Angular devs in __
                        __?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        It’s booming. Companies need Angular for enterprise-scale apps. Freshers often start around 5 LPA, while our experienced grads in ___#City#___ are hitting 12-18 LPA packages.
                    </p>
                </details>
            </div>
        </div>
    </section>

</asp:Content>
