<%@ Page Title="Automation Testing Masterclass | Success24" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="Automation.aspx.cs" Inherits="Success24v2.Automotion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="relative min-h-[90vh] flex items-center justify-center overflow-hidden">
        <img src="https://success24.in/img/iq-india2.jpeg"
            class="absolute inset-0 w-full h-full object-cover object-center"
            alt="Advanced Automation Testing Excellence in _#City#_" loading="eager" />

        <div class="absolute inset-0 bg-gradient-to-b from-slate-900/70 via-slate-900/80 to-slate-900/95"></div>

        <div class="relative z-10 max-w-6xl mx-auto px-6 text-center">
            <span class="inline-block py-1.5 px-4 rounded-full bg-orange-500 text-white font-bold text-xs uppercase tracking-widest mb-6 shadow-lg">
                Exclusive SDET & QA Automation Batch | _#City#_
            </span>

            <h1 class="text-5xl md:text-7xl lg:text-8xl font-black mb-6 text-white leading-tight drop-shadow-2xl">
                <asp:Literal ID="litH1" runat="server">Master <span class="text-orange-500">Automation Testing</span> in _#City#_</asp:Literal>
            </h1>

            <p class="text-gray-100 text-xl md:text-2xl font-medium mb-10 max-w-4xl mx-auto leading-relaxed drop-shadow-md">
                Transition from Manual Testing to <span class="bg-orange-600 px-2 py-1 rounded">High-Paid SDET Roles</span>. 
                Architect industrial-grade frameworks using Selenium, Java, Cypress, and Playwright with 100% placement assistance.
            </p>

            <div class="flex flex-col sm:flex-row gap-5 justify-center">
                <a href="tel:+919555580458" class="bg-orange-600 text-white px-10 py-4 rounded-xl font-extrabold hover:bg-orange-700 transition-all hover:scale-105 shadow-xl shadow-orange-600/40 text-lg uppercase tracking-wider">
                    Claim Your Seat
                </a>
                <a href="#syllabus" class="bg-white/10 backdrop-blur-md text-white border-2 border-white/30 px-10 py-4 rounded-xl font-extrabold hover:bg-white/20 transition-all hover:scale-105 text-lg uppercase tracking-wider">
                    Explore Curriculum
                </a>
            </div>
        </div>

        <div class="absolute bottom-0 left-0 w-full h-24 bg-gradient-to-t from-black to-transparent"></div>
    </section>

    <section class="bg-gradient-to-r from-yellow-400 to-orange-400 text-center py-12 scroll-scale">
        <h2 class="font-extrabold text-3xl md:text-5xl mb-3 text-gray-900 uppercase">
            Start Your Automation Testing Journey Today
        </h2>
        <div class="text-3xl md:text-5xl font-bold text-white">
            <a href="tel:+919555580458" class="hover:text-gray-900 transition-colors">+91 95555 80458</a>
        </div>
    </section>

    <section class="bg-black py-10 border-b border-gray-800">
        <div class="max-w-7xl mx-auto px-6 grid grid-cols-2 md:grid-cols-4 gap-8">
            <div class="text-center">
                <p class="text-3xl font-bold text-white">500+</p>
                <p class="text-gray-500 text-sm">Engineers Placed</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">15 LPA</p>
                <p class="text-gray-500 text-sm">Highest Package</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">25+</p>
                <p class="text-gray-500 text-sm">Framework Tools</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">24/7</p>
                <p class="text-gray-500 text-sm">LMS & Lab Access</p>
            </div>
        </div>
    </section>

    <section class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-2 gap-16 items-center">
            <div>
                <h6 class="text-orange-600 font-bold uppercase tracking-wide mb-2">Industry-Leading Mentorship</h6>
                <h2 class="text-4xl font-bold text-gray-900 mb-6">Become a Software Development Engineer in Test (SDET)</h2>
                <p class="text-gray-600 text-lg mb-6">
                    Generic testing is a thing of the past. Our program in _#City#_ focuses on "Shift-Left" testing methodologies, teaching you how to integrate quality at every stage of the DevOps pipeline.
                </p>
                <ul class="space-y-4">
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Hybrid, Data-Driven & Keyword Framework Architecture</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">End-to-End API Automation (Rest Assured & Mockito)</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">CI/CD Integration with Jenkins, Docker, and AWS</span>
                    </li>
                </ul>
            </div>
            <div class="relative">
                <div class="absolute -inset-4 bg-orange-100 rounded-3xl transform rotate-3"></div>
                <img src="https://success24.in/img/data-science-img.jpg" class="relative rounded-2xl shadow-2xl w-full" alt="SDET Training Excellence in _#City#_" />
            </div>
        </div>
    </section>

    <section id="syllabus" class="py-20 bg-slate-50">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">The 360° Automation Roadmap</h2>
                <p class="text-gray-600 max-w-2xl mx-auto">From fundamental logic to building scalable, enterprise-grade test automation suites.</p>
            </div>

            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center text-blue-600 font-bold mb-6">01</div>
                    <h3 class="text-xl font-bold mb-3">Testing Foundations</h3>
                    <p class="text-gray-500 text-sm mb-4">Mastering the QA mindset and modernized test management.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Agile/Scrum & Kanban Flows</li>
                        <li>Test Plan & Strategy Design</li>
                        <li>Advanced Defect Life Cycle (Jira)</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-indigo-100 rounded-lg flex items-center justify-center text-indigo-600 font-bold mb-6">02</div>
                    <h3 class="text-xl font-bold mb-3">SDET Programming</h3>
                    <p class="text-gray-500 text-sm mb-4">Master Java/Python specifically for automation scripting.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>OOPs Concepts in Depth</li>
                        <li>Collections & Data Structures</li>
                        <li>Exception Handling & Log4j</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center text-purple-600 font-bold mb-6">03</div>
                    <h3 class="text-xl font-bold mb-3">Selenium & Playwright</h3>
                    <p class="text-gray-500 text-sm mb-4">UI automation across browsers and dynamic environments.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Dynamic Locators (XPath/CSS)</li>
                        <li>Page Object Model (POM)</li>
                        <li>Cross-Browser Execution</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center text-orange-600 font-bold mb-6">04</div>
                    <h3 class="text-xl font-bold mb-3">API & Database Testing</h3>
                    <p class="text-gray-500 text-sm mb-4">Automate the "Headless" layers of the application.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>REST-Assured Frameworks</li>
                        <li>JSON/XML Validation</li>
                        <li>JDBC & Database Assertions</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-rose-100 rounded-lg flex items-center justify-center text-rose-600 font-bold mb-6">05</div>
                    <h3 class="text-xl font-bold mb-3">BDD & Mobile QA</h3>
                    <p class="text-gray-500 text-sm mb-4">Testing for human readability and mobile accessibility.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Cucumber & Gherkin Language</li>
                        <li>Appium Mobile Automation</li>
                        <li>Native & Hybrid App Testing</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-teal-100 rounded-lg flex items-center justify-center text-teal-600 font-bold mb-6">06</div>
                    <h3 class="text-xl font-bold mb-3">DevOps & Cloud</h3>
                    <p class="text-gray-500 text-sm mb-4">Automate your delivery for modern tech companies.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Jenkins CI/CD Pipelines</li>
                        <li>Git/GitHub Workflow</li>
                        <li>Maven & Gradle Build Tools</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="py-20 bg-slate-900 text-white">
        <div class="max-w-7xl mx-auto px-6">
            <div class="flex flex-col md:flex-row items-center justify-between gap-12">
                <div class="md:w-1/2">
                    <h6 class="text-orange-500 font-bold mb-2 uppercase tracking-wider">Your Career, Accelerated</h6>
                    <h2 class="text-3xl md:text-4xl font-bold mb-6">Top-Tier Placements in _#City#_</h2>
                    <p class="text-gray-400 text-lg mb-8 leading-relaxed">
                        We don't just teach tools; we build careers. Our specialized Career Cell works with leading MNCs and Product-based startups to ensure you land the role you deserve.
                    </p>

                    <div class="space-y-8">
                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-orange-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">⚡</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Live Project Exposure</h4>
                                <p class="text-gray-400 text-sm mt-1">Work on production-grade automation for E-commerce and FinTech apps.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-blue-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">💡</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Mock Interview Bootcamps</h4>
                                <p class="text-gray-400 text-sm mt-1">Practice with SDET leads from Amazon, Google, and TCS.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-purple-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">🚀</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Profile Engineering</h4>
                                <p class="text-gray-400 text-sm mt-1">ATS-optimized Resumes and GitHub portfolios that get noticed.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="md:w-1/2 w-full">
                    <div class="bg-slate-800/50 p-8 rounded-3xl border border-slate-700 backdrop-blur-sm">
                        <h3 class="text-xl font-bold mb-6 text-center text-white">Tools You Will Dominate</h3>
                        <div class="grid grid-cols-2 gap-4">
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Web UI</h5>
                                <p class="text-gray-400 text-xs">Selenium, Playwright, TestNG</p>
                            </div>
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Mobile</h5>
                                <p class="text-gray-400 text-xs">Appium, BrowserStack</p>
                            </div>
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Backend</h5>
                                <p class="text-gray-400 text-xs">Rest-Assured, Postman, SQL</p>
                            </div>
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">DevOps</h5>
                                <p class="text-gray-400 text-xs">Jenkins, Git, Docker</p>
                            </div>
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Agile Tools</h5>
                                <p class="text-gray-400 text-xs">Jira, Confluence, Zephyr</p>
                            </div>
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">AI Testing</h5>
                                <p class="text-gray-400 text-xs">GitHub Copilot for QA</p>
                            </div>
                        </div>
                        <div class="mt-8 text-center">
                            <p class="text-gray-500 text-xs italic">Syllabus updated for 2026 Testing Standards.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-20 bg-white overflow-hidden">
        <div class="max-w-7xl mx-auto px-6 mb-10 text-center">
            <h2 class="text-3xl font-bold">Hands-On Innovation Center</h2>
            <p class="text-gray-500">Live script-building marathons and tech meetups in _#City_#</p>
        </div>
        <div class="relative max-w-7xl mx-auto px-6">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <img src="https://success24.in/img/class1.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Learning Environment" />
                <img src="https://success24.in/img/DS_5.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Tech Seminar" />
                <img src="https://success24.in/img/classds.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Automation Workshop" />
                <img src="https://success24.in/img/class_4.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Placement Drive" />
            </div>
        </div>
    </section>

    <section class="py-20 bg-gray-50">
        <div class="max-w-4xl mx-auto px-6">
            <h2 class="text-3xl font-bold text-center mb-12">Program Insights & FAQs</h2>
            <div class="space-y-4">
                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        I don't have a coding background. Can I learn Automation?
                        <span class="transition group-open:rotate-180"><svg fill="none" height="24" stroke="currentColor" viewBox="0 0 24 24" width="24"><path d="M6 9l6 6 6-6" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"></path></svg></span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Absolutely. Our course starts with "Java for Testers" from absolute scratch. We ensure you master programming logic before we even touch an automation tool.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Will I get practical experience on real-world projects?
                        <span class="transition group-open:rotate-180"><svg fill="none" height="24" stroke="currentColor" viewBox="0 0 24 24" width="24"><path d="M6 9l6 6 6-6" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"></path></svg></span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Yes. You will build a complete automation framework for a live E-commerce platform, including UI, API, and Database validation, which you can showcase on your GitHub.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        What is the average salary hike after this course?
                        <span class="transition group-open:rotate-180"><svg fill="none" height="24" stroke="currentColor" viewBox="0 0 24 24" width="24"><path d="M6 9l6 6 6-6" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"></path></svg></span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        On average, professionals moving from Manual to Automation Testing see a salary hike of 60% to 150%, depending on their expertise in the SDET stack.
                    </p>
                </details>
            </div>
        </div>
    </section>

</asp:Content>