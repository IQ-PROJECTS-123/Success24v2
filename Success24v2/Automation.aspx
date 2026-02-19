<%@ Page Title="Automation Testing Masterclass | Success24" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="Automation.aspx.cs" Inherits="Success24v2.Automotion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="relative min-h-[90vh] flex items-center justify-center overflow-hidden">
        <img src="https://success24.in/img/iq-india2.jpeg"
            class="absolute inset-0 w-full h-full object-cover object-center"
            alt="Automation Testing Career Accelerator in __#City#__" loading="eager" />

        <div class="absolute inset-0 bg-gradient-to-b from-slate-900/60 via-slate-900/70 to-slate-900/90"></div>

        <div class="relative z-10 max-w-6xl mx-auto px-6 text-center">
            <span class="inline-block py-1.5 px-4 rounded-full bg-orange-500 text-white font-bold text-xs uppercase tracking-widest mb-6 shadow-lg">New SDET Batch Launching in __#City#__
            </span>

            <h1 class="text-5xl md:text-7xl lg:text-8xl font-black mb-6 text-white leading-tight drop-shadow-2xl">
                <asp:Literal ID="litH1" runat="server">Automation Testing Training in <span class="text-orange-500">__#City#__</span></asp:Literal>
            </h1>

            <p class="text-gray-100 text-xl md:text-2xl font-medium mb-10 max-w-4xl mx-auto leading-relaxed drop-shadow-md">
                Elevate your career from Manual to Automation Testing with our <span class="bg-orange-600 px-2 py-1 rounded">Job-Ready Certification</span>. 
                Gain hands-on expertise in Selenium, Java, Cucumber, and API validation.
            </p>

            <div class="flex flex-col sm:flex-row gap-5 justify-center">
                <a href="tel:+919555580458" class="bg-orange-600 text-white px-10 py-4 rounded-xl font-extrabold hover:bg-orange-700 transition-all hover:scale-105 shadow-xl shadow-orange-600/40 text-lg uppercase tracking-wider">Enroll Today
                </a>
                <a href="#syllabus" class="bg-white/10 backdrop-blur-md text-white border-2 border-white/30 px-10 py-4 rounded-xl font-extrabold hover:bg-white/20 transition-all hover:scale-105 text-lg uppercase tracking-wider">View Syllabus 
                </a>
            </div>
        </div>

        <div class="absolute bottom-0 left-0 w-full h-24 bg-gradient-to-t from-black to-transparent"></div>
    </section>
    <section class="bg-gradient-to-r from-yellow-400 to-orange-400 text-center py-12 scroll-scale">
        <h2 class="font-extrabold text-3xl md:text-5xl mb-3 text-gray-900 uppercase">Start Your Automation testing journy Today
        </h2>
        <div class="text-3xl md:text-5xl font-bold text-white">
            <a href="tel:+919555580458" class="hover:text-gray-900 transition-colors">+91 95555 80458
            </a>
        </div>
    </section>

    <section class="bg-black py-10 border-b border-gray-800">
        <div class="max-w-7xl mx-auto px-6 grid grid-cols-2 md:grid-cols-4 gap-8">
            <div class="text-center">
                <p class="text-3xl font-bold text-white">150+</p>
                <p class="text-gray-500 text-sm">QA Careers Launched</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">12LPA</p>
                <p class="text-gray-500 text-sm">Top Salary Package</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">20+</p>
                <p class="text-gray-500 text-sm">Modern Testing Tools</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">100%</p>
                <p class="text-gray-500 text-sm">Hands-on Lab Access</p>
            </div>
        </div>
    </section>

    <section class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-2 gap-16 items-center">
            <div>
                <h6 class="text-orange-600 font-bold uppercase tracking-wide mb-2">Best QA Mentorship</h6>
                <h2 class="text-4xl font-bold text-gray-900 mb-6">Master the Art of Quality Engineering</h2>
                <p class="text-gray-600 text-lg mb-6">
                    In today's fast-paced tech landscape, software agility is key. Our professional program in __#City#__ transforms you into a versatile SDET (Software Development Engineer in Test).
                </p>
                <ul class="space-y-4">
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Full-Stack Automation with Java/Python</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">RESTful API Validation (Postman & Rest Assured)</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Mobile Ecosystem Testing via Appium</span>
                    </li>
                </ul>
            </div>
            <div class="relative">
                <div class="absolute -inset-4 bg-orange-100 rounded-3xl transform rotate-3"></div>
                <img src="https://success24.in/img/data-science-img.jpg" class="relative rounded-2xl shadow-2xl w-full" alt="Advanced Testing Lab in __#City#__" />
            </div>
        </div>
    </section>

    <section id="syllabus" class="py-20 bg-slate-50">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">The Complete SDET Roadmap</h2>
                <p class="text-gray-600 max-w-2xl mx-auto">A data-driven curriculum meticulously crafted to evolve manual testers into high-end automation engineers.</p>
            </div>

            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center text-blue-600 font-bold mb-6">01</div>
                    <h3 class="text-xl font-bold mb-3">Core Quality Assurance</h3>
                    <p class="text-gray-500 text-sm mb-4">Deep dive into SDLC, STLC, and modernized Defect Management.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Agile Testing Methodology</li>
                        <li>Black Box & Risk-Based Testing</li>
                        <li>Enterprise Jira Management</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-indigo-100 rounded-lg flex items-center justify-center text-indigo-600 font-bold mb-6">02</div>
                    <h3 class="text-xl font-bold mb-3">Logic & Programming</h3>
                    <p class="text-gray-500 text-sm mb-4">Master industry-leading languages optimized for script development.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>OOPs for Automation</li>
                        <li>Data Structures & Collections</li>
                        <li>Efficient Error Handling</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center text-purple-600 font-bold mb-6">03</div>
                    <h3 class="text-xl font-bold mb-3">Web Driver Mastery</h3>
                    <p class="text-gray-500 text-sm mb-4">Dominate the web with advanced locators and modular frameworks.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Dynamic XPath Strategies</li>
                        <li>Page Object Model (POM) Design</li>
                        <li>TestNG & Build Automation</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center text-orange-600 font-bold mb-6">04</div>
                    <h3 class="text-xl font-bold mb-3">Backend & Database</h3>
                    <p class="text-gray-500 text-sm mb-4">Verify data integrity and microservices reliability.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Postman API Workflows</li>
                        <li>Rest Assured Integration</li>
                        <li>Advanced SQL for Testers</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-rose-100 rounded-lg flex items-center justify-center text-rose-600 font-bold mb-6">05</div>
                    <h3 class="text-xl font-bold mb-3">Next-Gen Frameworks</h3>
                    <p class="text-gray-500 text-sm mb-4">Adopt BDD and cross-platform mobile strategies.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Cucumber & Gherkin Syntax</li>
                        <li>Appium Mobile Frameworks</li>
                        <li>Cloud-Based Cross Browser Testing</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-teal-100 rounded-lg flex items-center justify-center text-teal-600 font-bold mb-6">06</div>
                    <h3 class="text-xl font-bold mb-3">DevOps for QA</h3>
                    <p class="text-gray-500 text-sm mb-4">Bridge the gap between testing and continuous deployment.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Jenkins Pipeline Integration</li>
                        <li>Version Control (Git/GitHub)</li>
                        <li>Technical Interview Bootcamps</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="py-20 bg-slate-900 text-white">
        <div class="max-w-7xl mx-auto px-6">
            <div class="flex flex-col md:flex-row items-center justify-between gap-12">

                <div class="md:w-1/2">
                    <h6 class="text-orange-500 font-bold mb-2 uppercase tracking-wider">Placement Excellence</h6>
                    <h2 class="text-3xl md:text-4xl font-bold mb-6">Unlocking Careers in Top Tech Firms.</h2>
                    <p class="text-gray-400 text-lg mb-8 leading-relaxed">
                        The demand for skilled SDETs in __#City#__ is at an all-time high. Our career cell focuses on refining your technical logic and professional persona to ace global interviews.
                    </p>

                    <div class="space-y-8">
                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-orange-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">📝</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Project-Based Learning</h4>
                                <p class="text-gray-400 text-sm mt-1">Simulate real-world scenarios with live Fintech and Retail applications.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-blue-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">🎤</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Coding Interview Prep</h4>
                                <p class="text-gray-400 text-sm mt-1">Master the problem-solving rounds required by industry giants like Amazon and Microsoft.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-purple-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">💼</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Professional Branding</h4>
                                <p class="text-gray-400 text-sm mt-1">Strategic LinkedIn and Resume optimization targeting high-growth QA roles.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="md:w-1/2 w-full">
                    <div class="bg-slate-800/50 p-8 rounded-3xl border border-slate-700 backdrop-blur-sm">
                        <h3 class="text-xl font-bold mb-6 text-center text-white">Your Technical Tech Stack</h3>

                        <div class="grid grid-cols-2 gap-4">
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Web Ecosystem</h5>
                                <p class="text-gray-400 text-xs">Selenium, Playwright, Cypress</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Mobile Tech</h5>
                                <p class="text-gray-400 text-xs">Appium, Android Studio, Xcode</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Backend Logic</h5>
                                <p class="text-gray-400 text-xs">Postman, Rest Assured, JDBC</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Modern DevOps</h5>
                                <p class="text-gray-400 text-xs">Jenkins, Git, Docker, Azure</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Workflow</h5>
                                <p class="text-gray-400 text-xs">Agile, Scrum, BDD (Cucumber)</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">QA Tooling</h5>
                                <p class="text-gray-400 text-xs">Jira, TestRail, Zephyr</p>
                            </div>
                        </div>

                        <div class="mt-8 text-center">
                            <p class="text-gray-500 text-xs italic">Syllabus upgraded for 2026 AI-augmented Testing trends.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="py-20 bg-white overflow-hidden">
        <div class="max-w-7xl mx-auto px-6 mb-10 text-center">
            <h2 class="text-3xl font-bold">Practical Labs & Tech Hackathons</h2>
            <p class="text-gray-500">Live script-building sessions and networking events in __#City#__</p>
        </div>

        <div class="relative max-w-7xl mx-auto px-6">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <img src="https://success24.in/img/class1.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Tech Lab" loading="lazy" />
                <img src="https://success24.in/img/DS_5.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="WebDriver Seminar" loading="lazy" />
                <img src="https://success24.in/img/classds.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="API Workshop" loading="lazy" />
                <img src="https://success24.in/img/class_4.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Corporate Hiring Drive" loading="lazy" />
            </div>
        </div>
    </section>

    <section class="py-20 bg-gray-50">
        <div class="max-w-4xl mx-auto px-6">
            <h2 class="text-3xl font-bold text-center mb-12">Expert Insights & FAQs</h2>

            <div class="space-y-4">
                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Is this program built for Manual Testing professionals?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Yes! This track is specifically engineered for Manual Testers pivoting to Automation. We cover coding fundamentals from the ground up before introducing complex frameworks.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Do students work on production-level projects?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Absolutely. You will engineer automation suites for robust environments like E-commerce platforms and Banking portals to ensure industry readiness.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Are international certifications like ISTQB included?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Yes, our foundation module is aligned with the ISTQB syllabus. We offer comprehensive prep materials and mock assessments to help you secure your certification.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        What is the projected income for SDETs in __#City#__?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Skilled Quality Engineers in __#City#__ generally command salaries ranging from 4 LPA to over 12 LPA, depending on their technical stack and problem-solving abilities.
                    </p>
                </details>
            </div>
        </div>
    </section>

</asp:Content>
