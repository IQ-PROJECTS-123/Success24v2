<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="CS.aspx.cs" Inherits="Success24v2.CS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="relative min-h-[90vh] flex items-center justify-center overflow-hidden">
        <img src="https://success24.in/img/iq-india2.jpeg"
            class="absolute inset-0 w-full h-full object-cover object-center"
            alt="Cyber Security Training in _#City#_" loading="eager" />

        <div class="absolute inset-0 bg-gradient-to-b from-slate-900/60 via-slate-900/70 to-slate-900/90"></div>

        <div class="relative z-10 max-w-6xl mx-auto px-6 text-center">
            <span class="inline-block py-1.5 px-4 rounded-full bg-orange-500 text-white font-bold text-xs uppercase tracking-widest mb-6 shadow-lg">Defend the Digital Frontier in _#City#_
            </span>

            <h1 class="text-5xl md:text-7xl lg:text-8xl font-black mb-6 text-white leading-tight drop-shadow-2xl">
                <asp:Literal ID="litH1" runat="server">Cyber Security Training Institute <span class="text-orange-500">in _#City#_</span></asp:Literal>
            </h1>

            <p class="text-gray-100 text-xl md:text-2xl font-medium mb-10 max-w-4xl mx-auto leading-relaxed drop-shadow-md">
                Master the art of digital defense. Learn to Think Like a Hacker to effectively defeat them. Our 
                <span class="bg-orange-600 px-2 py-1 rounded">Ethical Hacking</span> program in _#City#_ covers 
                Vulnerability Assessment, Risk Management, and Real-Time Incident Response.
            </p>

            <div class="flex flex-col sm:flex-row gap-5 justify-center">
                <a href="tel:+919555580458" class="bg-orange-600 text-white px-10 py-4 rounded-xl font-extrabold hover:bg-orange-700 transition-all hover:scale-105 shadow-xl shadow-orange-600/40 text-lg uppercase tracking-wider">Join Next Batch
                </a>
                <a href="#syllabus" class="bg-white/10 backdrop-blur-md text-white border-2 border-white/30 px-10 py-4 rounded-xl font-extrabold hover:bg-white/20 transition-all hover:scale-105 text-lg uppercase tracking-wider">View Syllabus
                </a>
            </div>
        </div>

        <div class="absolute bottom-0 left-0 w-full h-24 bg-gradient-to-t from-black to-transparent"></div>
    </section>
    <section class="bg-gradient-to-r from-yellow-400 to-orange-400 text-center py-12 scroll-scale">
        <h2 class="font-extrabold text-3xl md:text-5xl mb-3 text-gray-900 uppercase">Start Your Cyber Security journy Today
        </h2>
        <div class="text-3xl md:text-5xl font-bold text-white">
            <a href="tel:+919555580458" class="hover:text-gray-900 transition-colors">+91 95555 80458
            </a>
        </div>
    </section>

    <section class="bg-black py-10 border-b border-gray-800">
        <div class="max-w-7xl mx-auto px-6 grid grid-cols-2 md:grid-cols-4 gap-8">
            <div class="text-center">
                <p class="text-3xl font-bold text-white">3000+</p>
                <p class="text-gray-500 text-sm">Security Professionals Trained</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">100%</p>
                <p class="text-gray-500 text-sm">Live Malware Labs</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">50+</p>
                <p class="text-gray-500 text-sm">Bug Bounty Cases</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">18LPA</p>
                <p class="text-gray-500 text-sm">Top Security Package</p>
            </div>
        </div>
    </section>

    <section class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-2 gap-16 items-center">
            <div>
                <h6 class="text-orange-600 font-bold uppercase tracking-wide mb-2">Why Become a Security Expert?</h6>
                <h2 class="text-4xl font-bold text-gray-900 mb-6">Expert-Led Cyber Security Learning Academy in _#City#_</h2>
                <p class="text-gray-600 text-lg mb-6">
                    As cyber threats grow more sophisticated, organizations in _#City#_ are actively seeking certified professionals to safeguard their infrastructure. Our professional training program provides a deep-dive, hands-on approach to identifying vulnerabilities and neutralizing data breaches before they happen.
                </p>
                <p class="text-gray-600 text-lg mb-6">
                    Whether you are an aspiring IT professional or looking for a career pivot, this job-oriented course in _#City#_ equips you with the tools and mindset required to thrive in the high-stakes world of information security.
                </p>
                <ul class="space-y-4">
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Hands-on Kali Linux & Metasploit Labs</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Web Application & Network Pentesting</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">CEH v12 & CompTIA Security+ Alignment</span>
                    </li>
                </ul>
            </div>
            <div class="relative">
                <div class="absolute -inset-4 bg-orange-100 rounded-3xl transform rotate-3"></div>
                <img src="https://success24.in/img/data-science-img.jpg" class="relative rounded-2xl shadow-2xl w-full" alt="Cyber Security Lab in _#City#_" />
            </div>
        </div>
    </section>

    <section id="syllabus" class="py-20 bg-slate-50">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">Comprehensive Training Modules</h2>
                <p class="text-gray-600 max-w-2xl mx-auto">From fundamental networking concepts to advanced offensive security strategies used by industry experts.</p>
            </div>

            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center text-orange-600 font-bold mb-6">01</div>
                    <h3 class="text-xl font-bold mb-3">Network Security</h3>
                    <p class="text-gray-500 text-sm mb-4">Master the art of securing perimeters and real-time traffic monitoring.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>TCP/IP & OSI Model Defense</li>
                        <li>Firewalls, IDS, and IPS Deployment</li>
                        <li>Advanced Packet Sniffing with Wireshark</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center text-blue-600 font-bold mb-6">02</div>
                    <h3 class="text-xl font-bold mb-3">Ethical Hacking Basics</h3>
                    <p class="text-gray-500 text-sm mb-4">Learn the systematic phases of hacking and digital footprinting.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Information Gathering (OSINT)</li>
                        <li>Network Scanning & Enumeration</li>
                        <li>Gaining & Maintaining System Access</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center text-green-600 font-bold mb-6">03</div>
                    <h3 class="text-xl font-bold mb-3">Application Security</h3>
                    <p class="text-gray-500 text-sm mb-4">Proactively protecting software from OWASP Top 10 vulnerabilities.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>SQL Injection & XSS Mitigation</li>
                        <li>Fixing Broken Authentication</li>
                        <li>Secure Coding & DevSecOps Practices</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-indigo-100 rounded-lg flex items-center justify-center text-indigo-600 font-bold mb-6">04</div>
                    <h3 class="text-xl font-bold mb-3">Cloud Security</h3>
                    <p class="text-gray-500 text-sm mb-4">Specialized modules for defending cloud-native infrastructures.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>AWS/Azure Identity & Access Defense</li>
                        <li>S3 Bucket Data Leak Prevention</li>
                        <li>Cloud Shared Responsibility Model</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-rose-100 rounded-lg flex items-center justify-center text-rose-600 font-bold mb-6">05</div>
                    <h3 class="text-xl font-bold mb-3">Cyber Forensics</h3>
                    <p class="text-gray-500 text-sm mb-4">Professional techniques for investigating breaches and tracing attackers.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Memory & Disk Forensic Investigation</li>
                        <li>Digital Evidence Collection Standards</li>
                        <li>Steganography & Hidden Data Analysis</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-teal-100 rounded-lg flex items-center justify-center text-teal-600 font-bold mb-6">06</div>
                    <h3 class="text-xl font-bold mb-3">Security Operations</h3>
                    <p class="text-gray-500 text-sm mb-4">Experience real-world SOC workflows and Bug Bounty hunting.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>SIEM (Splunk/ELK) Implementation</li>
                        <li>Enterprise Vulnerability Management</li>
                        <li>Final Red Team vs Blue Team Simulation</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="py-20 bg-slate-900 text-white">
        <div class="max-w-7xl mx-auto px-6">
            <div class="flex flex-col md:flex-row items-center justify-between gap-12">

                <div class="md:w-1/2">
                    <h6 class="text-orange-500 font-bold mb-2 uppercase tracking-wider">Security Career Path</h6>
                    <h2 class="text-3xl md:text-4xl font-bold mb-6">Build a Future-Proof Career in _#City#_</h2>
                    <p class="text-gray-400 text-lg mb-8 leading-relaxed">
                        Cyber security remains one of the few truly recession-proof industries globally. In _#City#_, our graduates are successfully placed as SOC Analysts, Penetration Testers, and Information Security Officers in top-tier financial firms and tech giants. Our skill development institute focuses on making you job-ready from day one.
                    </p>

                    <div class="space-y-8">
                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-orange-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">🛡️</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Capture The Flag (CTF)</h4>
                                <p class="text-gray-400 text-sm mt-1">Hone your problem-solving skills with internal CTF competitions that simulate real-world hacking scenarios.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-blue-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">⚡</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Advanced VAPT Lab</h4>
                                <p class="text-gray-400 text-sm mt-1">Execute Vulnerability Assessment and Penetration Testing on servers designed to be vulnerable.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-purple-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">💼</div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Dedicated Placement Cell</h4>
                                <p class="text-gray-400 text-sm mt-1">Benefit from industry referrals to over 100+ Managed Security Service Providers (MSSPs) across _#City#_.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="md:w-1/2 w-full">
                    <div class="bg-slate-800/50 p-8 rounded-3xl border border-slate-700 backdrop-blur-sm">
                        <h3 class="text-xl font-bold mb-6 text-center text-white">Industry-Recognized Tool Stack</h3>

                        <div class="grid grid-cols-2 gap-4 mt-6">
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Reconnaissance</h5>
                                <p class="text-gray-400 text-xs">Nmap, Shodan, Maltego</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Exploitation</h5>
                                <p class="text-gray-400 text-xs">Metasploit, Armitage</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Web Hacking</h5>
                                <p class="text-gray-400 text-xs">Burp Suite, OWASP ZAP</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Password Cracking</h5>
                                <p class="text-gray-400 text-xs">John the Ripper, Hydra</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Analysis</h5>
                                <p class="text-gray-400 text-xs">Wireshark, Splunk</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Forensics</h5>
                                <p class="text-gray-400 text-xs">Autopsy, FTK Imager</p>
                            </div>
                        </div>

                        <div class="mt-8 text-center">
                            <p class="text-gray-500 text-xs italic">Live labs conducted in secure, isolated virtual environments.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="py-20 bg-white overflow-hidden">
        <div class="max-w-7xl mx-auto px-6 mb-10 text-center">
            <h2 class="text-3xl font-bold">Cyber Security Command Center</h2>
            <p class="text-gray-500">Immersive workshops and batch activities at our coaching center in _#City#_</p>
        </div>

        <div class="relative max-w-7xl mx-auto px-6">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <img src="https://success24.in/img/class1.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Cyber Security Lab _#City#_" loading="lazy" />
                <img src="https://success24.in/img/DS_5.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Ethical Hacking Course _#City#_" loading="lazy" />
                <img src="https://success24.in/img/classds.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Pentesting Certification _#City#_" loading="lazy" />
                <img src="https://success24.in/img/class_4.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Cyber Security Placements _#City#_" loading="lazy" />
            </div>
        </div>
    </section>

    <section class="py-20 bg-gray-50">
        <div class="max-w-4xl mx-auto px-6">
            <h2 class="text-3xl font-bold text-center mb-12">Cyber Security FAQs</h2>

            <div class="space-y-4">
                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Do I need strong coding skills for Cyber Security?
                        <span class="transition group-open:rotate-180">▼</span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        While deep software engineering knowledge isn't mandatory for every role, understanding Python and Bash scripting is a significant advantage. Our certification course provider in _#City#_ includes essential scripting basics tailored for security professionals.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Will I receive professional certification upon completion?
                        <span class="transition group-open:rotate-180">▼</span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Absolutely. You will receive an industry-recognized certification from Success24. Our curriculum is also meticulously mapped to help you clear global exams such as CEH (Certified Ethical Hacker) and CompTIA Security+.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Is Ethical Hacking a legal career path?
                        <span class="transition group-open:rotate-180">▼</span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Yes, Ethical Hacking is a legitimate and highly respected profession. It involves performing security assessments with explicit permission to identify and fix flaws. We prioritize legal frameworks and ethics in all our training sessions in _#City#_.
                    </p>
                </details>
            </div>
        </div>
    </section>

</asp:Content>
