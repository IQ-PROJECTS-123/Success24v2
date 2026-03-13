<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="DevOps.aspx.cs" Inherits="Success24v2.Devops" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="relative min-h-[90vh] flex items-center justify-center overflow-hidden">
        <img src="https://success24.in/img/iq-india2.jpeg"
            class="absolute inset-0 w-full h-full object-cover object-center"
            alt="DevOps Engineering Training in _#City#_" loading="eager" />

        <div class="absolute inset-0 bg-gradient-to-b from-slate-900/60 via-slate-900/70 to-slate-900/90"></div>

        <div class="relative z-10 max-w-6xl mx-auto px-6 text-center">
            <span class="inline-block py-1.5 px-4 rounded-full bg-orange-500 text-white font-bold text-xs uppercase tracking-widest mb-6 shadow-lg">Step-by-Step Mastery 2026
            </span>

            <h1 class="text-5xl md:text-7xl lg:text-8xl font-black mb-6 text-white leading-tight drop-shadow-2xl">
                <asp:Literal ID="litH1" runat="server">Zero Investment DevOps<span class="text-orange-500">Training in </span> _#City#_</asp:Literal>
            </h1>

            <p class="text-gray-100 text-xl md:text-2xl font-medium mb-10 max-w-4xl mx-auto leading-relaxed drop-shadow-md">
                Stop chasing tools and start building systems. Our **_#City#_ training program** guides you through a structured roadmap: from **Linux fundamentals** to **Multi-Cloud Orchestration**. 
                Master the art of "Infrastructure as Code" and high-velocity delivery.
            </p>

            <div class="flex flex-col sm:flex-row gap-5 justify-center">
                <a href="tel:+919555580458" class="bg-orange-600 text-white px-10 py-4 rounded-xl font-extrabold hover:bg-orange-700 transition-all hover:scale-105 shadow-xl shadow-orange-600/40 text-lg uppercase tracking-wider">Start Learning Now
                </a>
                <a href="#roadmap" class="bg-white/10 backdrop-blur-md text-white border-2 border-white/30 px-10 py-4 rounded-xl font-extrabold hover:bg-white/20 transition-all hover:scale-105 text-lg uppercase tracking-wider">View Roadmap
                </a>
            </div>
        </div>

        <div class="absolute bottom-0 left-0 w-full h-24 bg-gradient-to-t from-black to-transparent"></div>
    </section>

    <section class="bg-gradient-to-r from-yellow-400 to-orange-400 text-center py-12 scroll-scale">
        <h2 class="font-extrabold text-3xl md:text-5xl mb-3 text-gray-900 uppercase">100% Practical & Lab-Based Learning
        </h2>
        <div class="text-3xl md:text-5xl font-bold text-white">
            <a href="tel:+919555580458" class="hover:text-gray-900 transition-colors">Call For Career Counseling
            </a>
        </div>
    </section>

    <section class="bg-black py-10 border-b border-gray-800">
        <div class="max-w-7xl mx-auto px-6 grid grid-cols-2 md:grid-cols-4 gap-8">
            <div class="text-center">
                <p class="text-3xl font-bold text-white">100%</p>
                <p class="text-gray-500 text-sm">Hands-on Labs</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">12LPA</p>
                <p class="text-gray-500 text-sm">Average Package</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">Live</p>
                <p class="text-gray-500 text-sm">Project Deployments</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">Global</p>
                <p class="text-gray-500 text-sm">Cert Prep Included</p>
            </div>
        </div>
    </section>

    <section class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-2 gap-16 items-center">
            <div>
                <h6 class="text-orange-600 font-bold uppercase tracking-wide mb-2">What is DevOps?</h6>
                <h2 class="text-4xl font-bold text-gray-900 mb-6">The Bridge Between Code and Consumption</h2>
                <p class="text-gray-600 text-lg mb-6">
                    DevOps is not just a tool; it is a culture of **Collaboration and Automation**. In our **_#City#_ Academy**, we teach you how to remove the friction between Developers (who write code) and Operations (who manage servers). You will learn to build "Self-Healing" systems that deploy themselves, scale automatically, and fix errors without human intervention.
                </p>
                <ul class="space-y-4">
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">**Phase 1:** Mastering the Command Line (Linux & Shell)</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">**Phase 2:** Automating Pipelines (CI/CD & GitOps)</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">**Phase 3:** Orchestrating Scale (Docker & Kubernetes)</span>
                    </li>
                </ul>
            </div>
            <div class="relative">
                <div class="absolute -inset-4 bg-orange-100 rounded-3xl transform rotate-3"></div>
                <img src="https://success24.in/img/data-science-img.jpg" class="relative rounded-2xl shadow-2xl w-full" alt="DevOps Step by Step Learning" />
            </div>
        </div>
    </section>

    <section id="roadmap" class="py-20 bg-slate-50">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">The 6-Step DevOps Mastery Roadmap</h2>
                <p class="text-gray-600 max-w-2xl mx-auto">We follow a proven pedagogical path. We don't just teach tools; we teach the **Engineering Workflow** used by top tech firms.</p>
            </div>

            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center text-blue-600 font-bold mb-6">01</div>
                    <h3 class="text-xl font-bold mb-3">Foundation: Linux & Git</h3>
                    <p class="text-gray-500 text-sm mb-4">Start where the pros start. You cannot master the cloud without mastering the OS that powers it.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Linux File Systems & Permissions</li>
                        <li>User Management & SSH Security</li>
                        <li>Git Version Control (Branching/Merging)</li>
                        <li>Bash Scripting for Task Automation</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-indigo-100 rounded-lg flex items-center justify-center text-indigo-600 font-bold mb-6">02</div>
                    <h3 class="text-xl font-bold mb-3">CI/CD & Artifacts</h3>
                    <p class="text-gray-500 text-sm mb-4">Learn to automate the "Build" and "Test" phases so developers can ship code faster.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Jenkins Pipelines (Groovy Syntax)</li>
                        <li>GitHub Actions & GitLab CI</li>
                        <li>SonarQube for Code Quality</li>
                        <li>Nexus/Artifactory Management</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center text-purple-600 font-bold mb-6">03</div>
                    <h3 class="text-xl font-bold mb-3">Containers (The Standard)</h3>
                    <p class="text-gray-600 text-sm mb-4">Move away from heavy Virtual Machines. Learn to package apps into lightweight containers.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Docker Images & Multi-stage Builds</li>
                        <li>Docker Compose for Local Dev</li>
                        <li>Container Networking & Storage</li>
                        <li>Scanning Images for Vulnerabilities</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center text-orange-600 font-bold mb-6">04</div>
                    <h3 class="text-xl font-bold mb-3">Kubernetes Orchestration</h3>
                    <p class="text-gray-500 text-sm mb-4">The most in-demand skill of 2026. Manage thousands of containers with ease.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Pods, Deployments, and Services</li>
                        <li>Ingress Controllers & Load Balancing</li>
                        <li>Helm Charts (The K8s Package Manager)</li>
                        <li>Managed Services: AWS EKS / Azure AKS</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-rose-100 rounded-lg flex items-center justify-center text-rose-600 font-bold mb-6">05</div>
                    <h3 class="text-xl font-bold mb-3">Infrastructure as Code</h3>
                    <p class="text-gray-500 text-sm mb-4">Stop clicking buttons in the Cloud Console. Use code to create your entire data center.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Terraform (Provisioning Resources)</li>
                        <li>Ansible (Configuration Management)</li>
                        <li>State Management & Modules</li>
                        <li>Drift Detection & Remediation</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-teal-100 rounded-lg flex items-center justify-center text-teal-600 font-bold mb-6">06</div>
                    <h3 class="text-xl font-bold mb-3">Observability & DevSecOps</h3>
                    <p class="text-gray-600 text-sm mb-4">The final step: Ensure your system is secure, monitored, and running 24/7.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Prometheus & Grafana Dashboards</li>
                        <li>ELK Stack for Centralized Logging</li>
                        <li>HashiCorp Vault for Secrets</li>
                        <li>SRE Principles (SLAs, SLOs, SLIs)</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="py-20 bg-slate-900 text-white">
        <div class="max-w-7xl mx-auto px-6">
            <div class="flex flex-col md:flex-row items-center justify-between gap-12">

                <div class="md:w-1/2">
                    <h6 class="text-orange-500 font-bold mb-2 uppercase tracking-wider">Advanced Skills</h6>
                    <h2 class="text-3xl md:text-4xl font-bold mb-6">Cloud-Native Architecture</h2>
                    <p class="text-gray-400 text-lg mb-8 leading-relaxed">
                        In our **coaching center in _#City#_**, we don't just teach you how to use a tool—we teach you how to design a system. You will build projects that survive server failures and handle massive traffic spikes automatically. 
                    </p>

                    <div class="space-y-8">
                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-orange-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">⚡</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">GitOps & ArgoCD</h4>
                                <p class="text-gray-400 text-sm mt-1">Learn the modern way of deploying to Kubernetes directly from your Git repository.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-blue-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">🤖</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">AI for Ops (AIOps)</h4>
                                <p class="text-gray-400 text-sm mt-1">Utilize AI tools to predict failures and automate incident response.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-purple-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">🔐</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Zero Trust Security</h4>
                                <p class="text-gray-400 text-sm mt-1">Build security into the pipeline from day one, not as an afterthought.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="md:w-1/2 w-full">
                    <div class="bg-slate-800/50 p-8 rounded-3xl border border-slate-700 backdrop-blur-sm">
                        <h3 class="text-xl font-bold mb-6 text-center text-white">The Career Outcome</h3>

                        <div class="grid grid-cols-2 gap-4">
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Job Role 1</h5>
                                <p class="text-gray-400 text-xs">DevOps Engineer</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Job Role 2</h5>
                                <p class="text-gray-400 text-xs">Site Reliability Engineer (SRE)</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Job Role 3</h5>
                                <p class="text-gray-400 text-xs">Cloud Architect</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Job Role 4</h5>
                                <p class="text-gray-400 text-xs">Platform Engineer</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Salary</h5>
                                <p class="text-gray-400 text-xs">8LPA - 25LPA Range</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Expertise</h5>
                                <p class="text-gray-400 text-xs">Multi-Cloud Specialist</p>
                            </div>
                        </div>

                        <div class="mt-8 text-center">
                            <p class="text-gray-500 text-xs italic">Includes Mock Interviews, Resume Building, and LinkedIn Profile Optimization.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="py-20 bg-white overflow-hidden">
        <div class="max-w-7xl mx-auto px-6 mb-10 text-center">
            <h2 class="text-3xl font-bold">Real-World Lab Infrastructure</h2>
            <p class="text-gray-500">Practice on the same environments used by tech giants at our **_#City#_ center**</p>
        </div>

        <div class="relative max-w-7xl mx-auto px-6">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <img src="https://success24.in/img/class1.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="DevOps Training Lab" loading="lazy" />
                <img src="https://success24.in/img/DS_5.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Kubernetes Cluster Setup" loading="lazy" />
                <img src="https://success24.in/img/classds.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Live Project Session" loading="lazy" />
                <img src="https://success24.in/img/class_4.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Placement Drive" loading="lazy" />
            </div>
        </div>
    </section>

    <section class="py-20 bg-gray-50">
        <div class="max-w-4xl mx-auto px-6">
            <h2 class="text-3xl font-bold text-center mb-12">Clear Your Doubts</h2>

            <div class="space-y-4">
                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Can a non-IT person learn DevOps?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Yes, but it requires a structured approach. That’s why our course starts with **Linux Fundamentals**. We don't assume you know anything about servers; we build your knowledge from the ground up.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Do I need to be a "Coder" to do DevOps?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        No. You don't need to build apps, but you need to know how to **script**. We teach you enough Python and Bash to automate tasks, which is the core responsibility of a DevOps engineer.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        How much time does it take to become job-ready?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Our program is designed to take a beginner to a professional level in **3 to 4 months**, depending on your pace and the number of lab hours you put in.
                    </p>
                </details>
            </div>
        </div>
    </section>

</asp:Content>