<%@ Page Title="Microsoft Azure Training & Certification Course" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="AzureTraining.aspx.cs" Inherits="Success24v2.AzureTraining" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Join the leading Azure training center in __#City#__. Master cloud computing with hands-on labs, expert coaching, and 100% placement support for AZ-104 and AZ-305 certifications." />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="relative min-h-[90vh] flex items-center justify-center overflow-hidden">
        <img src="https://success24.in/img/iq-india2.jpeg"
            class="absolute inset-0 w-full h-full object-cover object-center"
            alt="Microsoft Azure Training in __#City#__" loading="eager" />

        <div class="absolute inset-0 bg-gradient-to-b from-slate-900/60 via-slate-900/70 to-slate-900/90"></div>

        <div class="relative z-10 max-w-6xl mx-auto px-6 text-center">
            <span class="inline-block py-1.5 px-4 rounded-full bg-orange-600 text-white font-bold text-xs uppercase tracking-widest mb-6 shadow-lg">Official Cloud Certification Prep in __#City#__
            </span>

            <h1 class="text-5xl md:text-7xl lg:text-8xl font-black mb-6 text-white leading-tight drop-shadow-2xl">
                <asp:Literal ID="litH1" runat="server">Microsoft Azure Cloud<span class="text-orange-500">Training Institute in __#City#__</span></asp:Literal>
            </h1>

            <p class="text-gray-100 text-xl md:text-2xl font-medium mb-10 max-w-4xl mx-auto leading-relaxed drop-shadow-md">
                Accelerate your career with our **Azure Learning Academy**. 
                Gain expertise in VM Deployment, Networking, and Security with <span class="bg-orange-600 px-2 py-1 rounded">Job Assistance</span>. 
            </p>

            <div class="flex flex-col sm:flex-row gap-5 justify-center">
                <a href="tel:+919555580458" class="bg-orange-600 text-white px-10 py-4 rounded-xl font-extrabold hover:bg-orange-700 transition-all hover:scale-105 shadow-xl shadow-orange-600/40 text-lg uppercase tracking-wider">Reserve your seat
                </a>
                <a href="#syllabus" class="bg-white/10 backdrop-blur-md text-white border-2 border-white/30 px-10 py-4 rounded-xl font-extrabold hover:bg-white/20 transition-all hover:scale-105 text-lg uppercase tracking-wider">Explore Syllabus
                </a>
            </div>
        </div>

        <div class="absolute bottom-0 left-0 w-full h-24 bg-gradient-to-t from-black to-transparent"></div>
    </section>
    <section class="bg-gradient-to-r from-yellow-400 to-orange-400 text-center py-12 scroll-scale">
        <h2 class="font-extrabold text-3xl md:text-5xl mb-3 text-gray-900 uppercase">Start Your Azure Training journy Today
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
                <p class="text-gray-500 text-sm">Cloud Professionals Mentored</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">95%</p>
                <p class="text-gray-500 text-sm">Exam Success Rate</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">10+</p>
                <p class="text-gray-500 text-sm">Real-world Cloud Projects</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">18LPA</p>
                <p class="text-gray-500 text-sm">Top Salary Package</p>
            </div>
        </div>
    </section>

    <section class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-2 gap-16 items-center">
            <div>
                <h6 class="text-orange-600 font-bold uppercase tracking-wide mb-2">Why Upskill in Azure?</h6>
                <h2 class="text-4xl font-bold text-gray-900 mb-6">Advanced Cloud Skills for Enterprise Infrastructure</h2>
                <p class="text-gray-600 text-lg mb-6">
                    As most Fortune 500 companies migrate to the cloud, the need for a premier **Azure training center in _
                    _** has never been higher. Our curriculum is 100% project-based, designed to help you navigate production-grade environments with confidence.
                </p>
                <ul class="space-y-4">
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Hands-on Lab with Azure Portal & CLI</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Identity & Governance (Microsoft Entra ID)</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Complete Prep for AZ-900, AZ-104 & AZ-305</span>
                    </li>
                </ul>
            </div>
            <div class="relative">
                <div class="absolute -inset-4 bg-orange-100 rounded-3xl transform rotate-3"></div>
                <img src="https://success24.in/img/data-science-img.jpg" class="relative rounded-2xl shadow-2xl w-full" alt="Azure Certification Course in __#City#__" />
            </div>
        </div>
    </section>

    <section id="syllabus" class="py-20 bg-slate-50">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">6-Step Cloud Mastery Roadmap</h2>
                <p class="text-gray-600 max-w-2xl mx-auto">This professional training program evolves from foundational concepts to advanced architectural design.</p>
            </div>

            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center text-blue-600 font-bold mb-6">01</div>
                    <h3 class="text-xl font-bold mb-3">Cloud Foundations</h3>
                    <p class="text-gray-500 text-sm mb-4">Understanding the IaaS, PaaS, and SaaS ecosystem.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Azure Global Infrastructure</li>
                        <li>Subscription Governance</li>
                        <li>Resource Groups & Lifecycle</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-indigo-100 rounded-lg flex items-center justify-center text-indigo-600 font-bold mb-6">02</div>
                    <h3 class="text-xl font-bold mb-3">Compute & Storage</h3>
                    <p class="text-gray-500 text-sm mb-4">Mastering Virtual Machines and Elastic Data.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Azure VM Scale Sets</li>
                        <li>Blob & File Storage Services</li>
                        <li>Managed Disk Solutions</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center text-purple-600 font-bold mb-6">03</div>
                    <h3 class="text-xl font-bold mb-3">Networking & Security</h3>
                    <p class="text-gray-500 text-sm mb-4">Configuring virtual networks and cloud perimeters.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>VNet Peering & Gateway VPNs</li>
                        <li>Network Security Groups (NSG)</li>
                        <li>Load Balancing & Firewalls</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center text-orange-600 font-bold mb-6">04</div>
                    <h3 class="text-xl font-bold mb-3">Identity & RBAC</h3>
                    <p class="text-gray-500 text-sm mb-4">Enterprise access control via Microsoft Entra ID.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Azure Policy & Governance</li>
                        <li>Entra ID (Formerly Active Directory)</li>
                        <li>Multi-Factor Authentication</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-rose-100 rounded-lg flex items-center justify-center text-rose-600 font-bold mb-6">05</div>
                    <h3 class="text-xl font-bold mb-3">DevOps & Automation</h3>
                    <p class="text-gray-500 text-sm mb-4">Streamlining deployments with infrastructure as code.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Azure Monitor & Insights</li>
                        <li>Introduction to CI/CD</li>
                        <li>ARM Templates & Bicep</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-teal-100 rounded-lg flex items-center justify-center text-teal-600 font-bold mb-6">06</div>
                    <h3 class="text-xl font-bold mb-3">Capstone & Placement</h3>
                    <p class="text-gray-500 text-sm mb-4">Final project and career transition support.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Mock Certification Tests</li>
                        <li>Live Migration Workshop</li>
                        <li>Portfolio Optimization</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="py-20 bg-slate-900 text-white">
        <div class="max-w-7xl mx-auto px-6">
            <div class="flex flex-col md:flex-row items-center justify-between gap-12">

                <div class="md:w-1/2">
                    <h6 class="text-orange-500 font-bold mb-2 uppercase tracking-wider">Cloud Career Bootcamp</h6>
                    <h2 class="text-3xl md:text-4xl font-bold mb-6">Bridge the Gap with Expert Coaching.</h2>
                    <p class="text-gray-400 text-lg mb-8 leading-relaxed">
                        Our **Azure coaching center in __#City#__** prioritizes industry readiness. Through immersive workshops, we ensure you are prepared for high-impact roles from the moment you graduate.
                    </p>

                    <div class="space-y-8">
                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-orange-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">☁️</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Migration Case Studies</h4>
                                <p class="text-gray-400 text-sm mt-1">Master the transition from on-premise hardware to scalable cloud solutions.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-blue-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">📑</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Exam Simulation Tools</h4>
                                <p class="text-gray-400 text-sm mt-1">Practice with curated questions and mock environments for guaranteed results.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-purple-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">💼</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Hiring Partner Network</h4>
                                <p class="text-gray-400 text-sm mt-1">Tap into a network of over 100 firms recruiting cloud talent in __#City#__.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="md:w-1/2 w-full">
                    <div class="bg-slate-800/50 p-8 rounded-3xl border border-slate-700 backdrop-blur-sm">
                        <h3 class="text-xl font-bold mb-6 text-center text-white">Advanced Azure Stack Mastery</h3>

                        <div class="grid grid-cols-2 gap-4">
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Compute</h5>
                                <p class="text-gray-400 text-xs">VMs, AKS, Web Apps</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Data Storage</h5>
                                <p class="text-gray-400 text-xs">SQL, Cosmos DB, Blobs</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Cloud Security</h5>
                                <p class="text-gray-400 text-xs">Defender, Key Vault</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Networking</h5>
                                <p class="text-gray-400 text-xs">ExpressRoute, Traffic Mgr</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Governance</h5>
                                <p class="text-gray-400 text-xs">Cost Mgmt, Blueprints</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">IaC</h5>
                                <p class="text-gray-400 text-xs">Bicep, Terraform, CLI</p>
                            </div>
                        </div>

                        <div class="mt-8 text-center">
                            <p class="text-gray-500 text-xs italic">Learning conducted on the latest 2026 Production Tier Portals.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="py-20 bg-white overflow-hidden">
        <div class="max-w-7xl mx-auto px-6 mb-10 text-center">
            <h2 class="text-3xl font-bold">Azure Skills Development Labs</h2>
            <p class="text-gray-500">Immersive classroom workshops and live setup sessions in __#City#__</p>
        </div>

        <div class="relative max-w-7xl mx-auto px-6">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <img src="https://success24.in/img/class1.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Azure Lab Setup" loading="lazy" />
                <img src="https://success24.in/img/DS_5.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Cloud Project Discussion" loading="lazy" />
                <img src="https://success24.in/img/classds.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Azure Learning Center" loading="lazy" />
                <img src="https://success24.in/img/class_4.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Cloud Placement Drive" loading="lazy" />
            </div>
        </div>
    </section>

    <section class="py-20 bg-gray-50">
        <div class="max-w-4xl mx-auto px-6">
            <h2 class="text-3xl font-bold text-center mb-12">Career Questions & Insights</h2>

            <div class="space-y-4">
                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Which Azure certification is right for my career?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Beginners should start with AZ-900 (Fundamentals). For those wanting to manage infrastructure, AZ-104 (Administrator) is best. Our **certification course provider** covers both paths comprehensively.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Do I need a technical background for cloud computing?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        While basic IT knowledge is helpful, our **learning academy** starts from the absolute basics, ensuring students from all backgrounds can master the cloud.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Are the Microsoft exam fees covered in the tuition?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Microsoft certification fees are paid directly to the vendor. However, our **coaching center** occasionally provides exam vouchers and discounts to high-performing candidates.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        What is the average salary for Cloud Architects in __#City#__?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Professionals who complete an **Azure training course in __#City#__** can expect salaries ranging from 6 LPA for entry-level roles to over 25 LPA for experienced architects.
                    </p>
                </details>
            </div>
        </div>
    </section>

</asp:Content>
