<%@ Page Title="SQL & NoSQL Database Engineering" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="Databases.aspx.cs" Inherits="Success24v2.Databases" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="relative min-h-[90vh] flex items-center justify-center overflow-hidden">
        <img src="https://success24.in/img/iq-india2.jpeg"
            class="absolute inset-0 w-full h-full object-cover object-center"
            alt="Professional Database Certification Program in _#City#_" loading="eager" />

        <div class="absolute inset-0 bg-gradient-to-b from-slate-900/60 via-slate-900/70 to-slate-900/90"></div>

        <div class="relative z-10 max-w-6xl mx-auto px-6 text-center">
            <span class="inline-block py-1.5 px-4 rounded-full bg-orange-500 text-white font-bold text-xs uppercase tracking-widest mb-6 shadow-lg">New Batch Starting Soon in _#City#_
            </span>

            <h1 class="text-5xl md:text-7xl lg:text-8xl font-black mb-6 text-white leading-tight drop-shadow-2xl">
                <asp:Literal ID="litH1" runat="server">Database Engineering <span class="text-orange-500">_#City#_</span></asp:Literal>
            </h1>

            <p class="text-gray-100 text-xl md:text-2xl font-medium mb-10 max-w-4xl mx-auto leading-relaxed drop-shadow-md">
                Launch your career with India's most intensive Database Engineering course featuring <span class="bg-orange-600 px-2 py-1 rounded">100% Placement Support</span>. 
                Master SQL, NoSQL, Schema Design, and Cloud Architecture through real-world projects designed for the modern tech landscape.
            </p>

            <div class="flex flex-col sm:flex-row gap-5 justify-center">
                <a href="tel:+919555580458" class="bg-orange-600 text-white px-10 py-4 rounded-xl font-extrabold hover:bg-orange-700 transition-all hover:scale-105 shadow-xl shadow-orange-600/40 text-lg uppercase tracking-wider">Book Your seat
                </a>
                <a href="#syllabus" class="bg-white/10 backdrop-blur-md text-white border-2 border-white/30 px-10 py-4 rounded-xl font-extrabold hover:bg-white/20 transition-all hover:scale-105 text-lg uppercase tracking-wider">View Syllabus
                </a>
            </div>
        </div>

        <div class="absolute bottom-0 left-0 w-full h-24 bg-gradient-to-t from-black to-transparent"></div>
    </section>
    <section class="bg-gradient-to-r from-yellow-400 to-orange-400 text-center py-12 scroll-scale">
        <h2 class="font-extrabold text-3xl md:text-5xl mb-3 text-gray-900 uppercase">Start Your Database Engineering journy Today
        </h2>
        <div class="text-3xl md:text-5xl font-bold text-white">
            <a href="tel:+919555580458" class="hover:text-gray-900 transition-colors">+91 95555 80458
            </a>
        </div>
    </section>

    <section class="bg-black py-10 border-b border-gray-800">
        <div class="max-w-7xl mx-auto px-6 grid grid-cols-2 md:grid-cols-4 gap-8">
            <div class="text-center">
                <p class="text-3xl font-bold text-white">1200+</p>
                <div class="text-gray-500 text-sm">Certified DBAs Trained</div>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">12LPA</p>
                <div class="text-gray-500 text-sm">Average CTC Offered</div>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">20+</p>
                <div class="text-gray-500 text-sm">Live Capstone Projects</div>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">100%</p>
                <div class="text-gray-500 text-sm">Job Search Assistance</div>
            </div>
        </div>
    </section>

    <section class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-2 gap-16 items-center">
            <div>
                <h6 class="text-orange-600 font-bold uppercase tracking-wide mb-2">Why Choose Success24?</h6>
                <h2 class="text-4xl font-bold text-gray-900 mb-6">Premier Database Architecture Training Center</h2>
                <p class="text-gray-600 text-lg mb-6">
                    Searching for the best professional course in _#City#_ to master data management? We provide an industry-recognized curriculum that goes beyond basic queries. Our program, led by certified experts, focuses on high-availability systems, performance tuning, and the complex architectures required by top-tier tech firms.
                </p>
                <ul class="space-y-4">
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Advanced SQL, PL/SQL & T-SQL Mastery for Enterprise</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">NoSQL Ecosystem & Distributed Data Integration</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Cloud Readiness for AWS RDS, Azure SQL & DynamoDB</span>
                    </li>
                </ul>
            </div>
            <div class="relative">
                <div class="absolute -inset-4 bg-orange-100 rounded-3xl transform rotate-3"></div>
                <img src="https://success24.in/img/data-science-img.jpg" class="relative rounded-2xl shadow-2xl w-full" alt="Database skill development institute in _#City#_" />
            </div>
        </div>
    </section>

    <section id="syllabus" class="py-20 bg-slate-50">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">Comprehensive Data Engineering Learning Path</h2>
                <p class="text-gray-600 max-w-2xl mx-auto">From fundamental storage principles to advanced distributed systems, become the data expert the industry demands.</p>
            </div>

            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center text-blue-600 font-bold mb-6">01</div>
                    <h3 class="text-xl font-bold mb-3">Relational Systems (SQL)</h3>
                    <p class="text-gray-500 text-sm mb-4">Deep dive into MySQL and PostgreSQL for robust, transactional data management.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Advanced DDL/DML/DCL Operations</li>
                        <li>Complex Multi-table Joins & CTEs</li>
                        <li>Triggers, Functions & Stored Logic</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-indigo-100 rounded-lg flex items-center justify-center text-indigo-600 font-bold mb-6">02</div>
                    <h3 class="text-xl font-bold mb-3">Schema Architecture</h3>
                    <p class="text-gray-500 text-sm mb-4">Designing scalable models that ensure ACID compliance and lightning-fast retrieval.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Normalization & Denormalization</li>
                        <li>B-Tree & Hash Indexing Strategies</li>
                        <li>Database Sharding & Partitioning</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center text-purple-600 font-bold mb-6">03</div>
                    <h3 class="text-xl font-bold mb-3">NoSQL & Big Data</h3>
                    <p class="text-gray-500 text-sm mb-4">Handling high-velocity unstructured data with modern Document and Key-Value stores.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>MongoDB Atlas & Aggregation</li>
                        <li>Caching with Redis for Speed</li>
                        <li>CAP Theorem & Eventual Consistency</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center text-orange-600 font-bold mb-6">04</div>
                    <h3 class="text-xl font-bold mb-3">Security & Operations</h3>
                    <p class="text-gray-500 text-sm mb-4">Protecting the organization's most valuable asset through rigorous DB governance.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Point-in-Time Recovery (PITR)</li>
                        <li>RBAC & Data Encryption (TDE)</li>
                        <li>Audit Logging & Compliance</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-rose-100 rounded-lg flex items-center justify-center text-rose-600 font-bold mb-6">05</div>
                    <h3 class="text-xl font-bold mb-3">Cloud Infrastructure</h3>
                    <p class="text-gray-600 text-sm mb-4">Mastering Database-as-a-Service (DBaaS) on major global cloud platforms.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>AWS RDS & Serverless Aurora</li>
                        <li>Azure SQL Managed Instance</li>
                        <li>Zero-Downtime DB Migrations</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-teal-100 rounded-lg flex items-center justify-center text-teal-600 font-bold mb-6">06</div>
                    <h3 class="text-xl font-bold mb-3">Career Readiness</h3>
                    <p class="text-gray-500 text-sm mb-4">Finalizing your portfolio with real-world deployments and interview simulation.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Performance Tuning Capstone</li>
                        <li>Expert-led Technical Interviews</li>
                        <li>DBA Resume & Portfolio Review</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="py-20 bg-slate-900 text-white">
        <div class="max-w-7xl mx-auto px-6">
            <div class="flex flex-col md:flex-row items-center justify-between gap-12">

                <div class="md:w-1/2">
                    <h6 class="text-orange-500 font-bold mb-2 uppercase tracking-wider">Placement Assistance Program</h6>
                    <h2 class="text-3xl md:text-4xl font-bold mb-6">Accelerate Your Career in Modern Data Management.</h2>
                    <p class="text-gray-400 text-lg mb-8 leading-relaxed">
                        The demand for skilled Database Administrators and SQL Developers in _#City#_ is reaching record highs. Our career-focused training program ensures you transition from a learner to a high-earning professional in the local tech ecosystem.
                    </p>

                    <div class="space-y-8">
                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-orange-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">
                                📝
                            </div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Strategic Resume Engineering</h4>
                                <p class="text-gray-400 text-sm mt-1">We optimize your CV to highlight complex SQL tuning and database design skills, ensuring you pass automated recruiter screenings in _#City#_.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-blue-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">
                                🎤
                            </div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Rigorous Mock Interviews</h4>
                                <p class="text-gray-400 text-sm mt-1">Experience live whiteboarding and SQL coding challenges that simulate the hiring process of top MNCs and startups.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-purple-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">
                                💼
                            </div>
                            <div>
                                <h4 class="font-bold text-xl text-white">LinkedIn Personal Branding</h4>
                                <p class="text-gray-400 text-sm mt-1">Position yourself as a subject matter expert to attract high-paying job-oriented opportunities in _#City#_ and beyond.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="md:w-1/2 w-full">
                    <div class="bg-slate-800/50 p-8 rounded-3xl border border-slate-700 backdrop-blur-sm">
                        <h3 class="text-xl font-bold mb-6 text-center text-white">Industry-Recognized Skills Mastery</h3>

                        <div class="grid grid-cols-2 gap-4">
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">SQL Expert</h5>
                                <p class="text-gray-400 text-xs">MySQL, PostgreSQL, T-SQL</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">NoSQL Stack</h5>
                                <p class="text-gray-400 text-xs">MongoDB, Cassandra, Redis</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Architecture</h5>
                                <p class="text-gray-400 text-xs">Data Modeling, ACID, Sharding</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Cloud DB</h5>
                                <p class="text-gray-400 text-xs">AWS RDS, DynamoDB, Azure SQL</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Performance</h5>
                                <p class="text-gray-400 text-xs">Explain Plans, Query Tuning</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Governance</h5>
                                <p class="text-gray-400 text-xs">Backup, Security, TDE</p>
                            </div>
                        </div>

                        <div class="mt-8 text-center">
                            <p class="text-gray-500 text-xs italic">Our training institute in _#City#_ follows 2026 enterprise-grade standards.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="py-20 bg-white overflow-hidden">
        <div class="max-w-7xl mx-auto px-6 mb-10 text-center">
            <h2 class="text-3xl font-bold">Life at Success24 Learning Academy</h2>
            <p class="text-gray-500">Immersive classroom training and lab work at our training institute in _#City#_</p>
        </div>

        <div class="relative max-w-7xl mx-auto px-6">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <img src="https://success24.in/img/class1.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Advanced Database Lab in _#City#_" loading="lazy" />
                <img src="https://success24.in/img/DS_5.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Students mastering SQL development" loading="lazy" />
                <img src="https://success24.in/img/classds.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="DB Performance Tuning Workshop" loading="lazy" />
                <img src="https://success24.in/img/class_4.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Recruitment drive in _#City#_" loading="lazy" />
            </div>
        </div>
    </section>

    <section class="py-20 bg-gray-50">
        <div class="max-w-4xl mx-auto px-6">
            <h2 class="text-3xl font-bold text-center mb-12">Frequently Asked Questions</h2>

            <div class="space-y-4">
                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Who should enroll in this Database Engineering course?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        This program is ideal for fresh graduates, aspiring DBAs, and software developers looking to deepen their backend expertise. No prior coding background is required as we start from fundamental RDBMS principles.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        What makes this the best training institute in _#City#_ for DBAs?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Success24 provides a unique blend of theoretical depth and practical rigor. Our 100% placement assistance and network of hiring partners in _#City#_ ensure that our students secure high-paying roles in database administration and engineering.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Which database technologies are covered in the curriculum?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        You will gain hands-on proficiency in MySQL, PostgreSQL, Microsoft SQL Server, MongoDB, and Redis. Additionally, we cover cloud-native solutions like AWS RDS and DynamoDB to make you a versatile modern engineer.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        Is there a provision for weekend classes in _#City#_?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Yes, we offer both weekday and weekend classroom training in _#City#_ to accommodate working professionals. You can also opt for hybrid learning models that combine in-person lab work with online theory sessions.
                    </p>
                </details>

                <details class="group bg-white p-6 rounded-2xl shadow-sm border border-gray-200 cursor-pointer">
                    <summary class="flex justify-between items-center font-bold text-lg list-none">
                        What is the average salary scope after completion?
                        <span class="transition group-open:rotate-180">
                            <svg fill="none" height="24" shape-rendering="geometricPrecision" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                <path d="M6 9l6 6 6-6"></path></svg>
                        </span>
                    </summary>
                    <p class="text-gray-600 mt-4 group-open:animate-fadeIn">
                        Graduates of our career-focused training program often secure packages ranging from 6 LPA to 15 LPA, depending on their performance and previous experience. Database skills remain among the highest-paid specializations in the IT sector.
                    </p>
                </details>
            </div>
        </div>
    </section>

</asp:Content>
