<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="DS.aspx.cs" Inherits="Success24v2.DS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="relative min-h-[90vh] flex items-center justify-center overflow-hidden">
        <img src="https://success24.in/img/iq-india2.jpeg"
            class="absolute inset-0 w-full h-full object-cover object-center"
            alt="Premier Data Science Learning Academy in _#City#_ | Pay After Placement Data Science Course | 12 LPA Career Support"
            loading="eager" />

        <div class="absolute inset-0 bg-gradient-to-b from-slate-900/60 via-slate-900/70 to-slate-900/90"></div>

        <div class="relative z-10 max-w-6xl mx-auto px-6 text-center">
            <span class="inline-block py-1.5 px-4 rounded-full bg-orange-500 text-white font-bold text-xs uppercase tracking-widest mb-6 shadow-lg">New Batch Starting Soon in _#City#_
            </span>

            <h1 class="text-5xl md:text-7xl lg:text-8xl font-black mb-6 text-white leading-tight drop-shadow-2xl">
                <asp:Literal ID="litH1" runat="server">Data Science <span class="text-orange-500">Professional Training</span> in _#City#_</asp:Literal>
            </h1>

            <p class="text-gray-100 text-xl md:text-2xl font-medium mb-10 max-w-4xl mx-auto leading-relaxed drop-shadow-md">
                Elevate your career at the most trusted coaching center in _#City#_ offering <span class="bg-orange-600 px-2 py-1 rounded">Comprehensive Placement Support</span>. 
                Master Python, Predictive Modeling, and Business Intelligence from veteran industry mentors.
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
        <h2 class="font-extrabold text-3xl md:text-5xl mb-3 text-gray-900 uppercase">Launch Your High-Growth Analytics Career
        </h2>
        <div class="text-3xl md:text-5xl font-bold text-white">
            <a href="tel:+919555580458" class="hover:text-gray-900 transition-colors">+91 95555 80458
            </a>
        </div>
    </section>

    <section class="bg-black py-10 border-b border-gray-800">
        <div class="max-w-7xl mx-auto px-6 grid grid-cols-2 md:grid-cols-4 gap-8">
            <div class="text-center">
                <p class="text-3xl font-bold text-white">1000+</p>
                <p class="text-gray-500 text-sm">Graduates Certified</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">15LPA</p>
                <p class="text-gray-500 text-sm">Top Salary Package</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">15+</p>
                <p class="text-gray-500 text-sm">Live Industry Projects</p>
            </div>
            <div class="text-center">
                <p class="text-3xl font-bold text-white">100%</p>
                <p class="text-gray-500 text-sm">Job Search Assistance</p>
            </div>
        </div>
    </section>

    <section class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-2 gap-16 items-center">
            <div>
                <h6 class="text-orange-600 font-bold uppercase tracking-wide mb-2">The Success24 Edge</h6>
                <h2 class="text-4xl font-bold text-gray-900 mb-6">A Strategic Career-Focused Training Program</h2>
                <p class="text-gray-600 text-lg mb-6 leading-relaxed">
                    Seeking the most industry-recognized certification in _#City#_? We bridge the gap between academic theory and corporate reality. Our curriculum, refined by experts from global tech giants, ensures you don't just learn tools, but master the art of data-driven decision-making.
                </p>
                <p class="text-gray-600 text-lg mb-6 leading-relaxed">
                    Our skill development institute focuses on high-demand domains including Financial Analytics, Healthcare Intelligence, and Retail Forecasting to make you versatile in the job market.
                </p>
                <ul class="space-y-4">
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Practical Python & Advanced R Programming</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Real-World Capstone Projects & Case Studies</span>
                    </li>
                    <li class="flex items-start">
                        <svg class="w-6 h-6 text-green-500 mr-3 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                        <span class="text-gray-700 font-medium">Preparation for Global Certifications (IBM, Microsoft)</span>
                    </li>
                </ul>
            </div>
            <div class="relative">
                <div class="absolute -inset-4 bg-orange-100 rounded-3xl transform rotate-3"></div>
                <img src="https://success24.in/img/data-science-img.jpg" class="relative rounded-2xl shadow-2xl w-full" alt="Professional Data Science Course in _#City#_" />
            </div>
        </div>
    </section>

    <section id="syllabus" class="py-20 bg-slate-50">
        <div class="max-w-7xl mx-auto px-6">
            <div class="text-center mb-16">
                <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">A Comprehensive 6-Month Roadmap</h2>
                <p class="text-gray-600 max-w-2xl mx-auto">Our structured learning path is designed to transform beginners into job-ready specialists through rigorous practical modules.</p>
            </div>

            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center text-blue-600 font-bold mb-6">01</div>
                    <h3 class="text-xl font-bold mb-3">Python for Data Engineering</h3>
                    <p class="text-gray-500 text-sm mb-4">Deep dive into data structures, automation, and algorithmic thinking with Python.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Object-Oriented Programming</li>
                        <li>Automated Data Scrapping</li>
                        <li>Dynamic File Handling</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-indigo-100 rounded-lg flex items-center justify-center text-indigo-600 font-bold mb-6">02</div>
                    <h3 class="text-xl font-bold mb-3">Statistical Modeling</h3>
                    <p class="text-gray-500 text-sm mb-4">The core logic behind AI. Mastering probability distributions and hypothesis testing.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>A/B Testing Methodologies</li>
                        <li>Predictive Analytics Logic</li>
                        <li>Vector Algebra for ML</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center text-purple-600 font-bold mb-6">03</div>
                    <h3 class="text-xl font-bold mb-3">Advanced Data Analysis</h3>
                    <p class="text-gray-500 text-sm mb-4">Leveraging Pandas and NumPy to transform raw data into actionable business insights.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Data Wrangling at Scale</li>
                        <li>Interactive Visualizations</li>
                        <li>Feature Engineering</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center text-orange-600 font-bold mb-6">04</div>
                    <h3 class="text-xl font-bold mb-3">Predictive ML Algorithms</h3>
                    <p class="text-gray-500 text-sm mb-4">Developing intelligent models using modern libraries and Scikit-Learn.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Supervised Learning Models</li>
                        <li>Ensemble Methods (XGBoost)</li>
                        <li>Anomaly Detection</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-rose-100 rounded-lg flex items-center justify-center text-rose-600 font-bold mb-6">05</div>
                    <h3 class="text-xl font-bold mb-3">Artificial Intelligence</h3>
                    <p class="text-gray-500 text-sm mb-4">Harnessing Neural Networks, Computer Vision, and Natural Language Processing.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>Deep Learning with Keras</li>
                        <li>NLP & Sentiment Analysis</li>
                        <li>Image Recognition Models</li>
                    </ul>
                </div>

                <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition duration-300">
                    <div class="w-12 h-12 bg-teal-100 rounded-lg flex items-center justify-center text-teal-600 font-bold mb-6">06</div>
                    <h3 class="text-xl font-bold mb-3">Cloud Deployment</h3>
                    <p class="text-gray-500 text-sm mb-4">Taking models from your local machine to production environments like AWS.</p>
                    <ul class="text-sm text-gray-600 list-disc list-inside">
                        <li>API Development (Flask)</li>
                        <li>Portfolio Optimization</li>
                        <li>Career Coaching & Mocks</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="py-20 bg-slate-900 text-white">
        <div class="max-w-7xl mx-auto px-6">
            <div class="flex flex-col md:flex-row items-center justify-between gap-12">

                <div class="md:w-1/2">
                    <h6 class="text-orange-500 font-bold mb-2 uppercase tracking-wider">Professional Career Launchpad</h6>
                    <h2 class="text-3xl md:text-4xl font-bold mb-6">Beyond Learning—We Ensure You Get Hired.</h2>
                    <p class="text-gray-400 text-lg mb-8 leading-relaxed">
                        The job market for tech professionals in _#City#_ is evolving. Our dedicated placement cell provides a 360-degree support system, focusing on technical prowess and corporate soft skills to ensure you land your dream role.
                    </p>

                    <div class="space-y-8">
                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-orange-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">
                                📝
                            </div>
                            <div>
                                <h4 class="font-bold text-xl text-white">AI-Optimized Resume Crafting</h4>
                                <p class="text-gray-400 text-sm mt-1">We refine your profile to beat Applicant Tracking Systems (ATS) used by top-tier MNCs and tech startups.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-blue-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">
                                🎤
                            </div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Intensive Interview Simulations</h4>
                                <p class="text-gray-400 text-sm mt-1">Practice with domain experts and receive granular feedback to build confidence for technical and HR rounds.</p>
                            </div>
                        </div>

                        <div class="flex gap-4">
                            <div class="w-14 h-14 bg-purple-600/20 rounded-xl flex items-center justify-center flex-shrink-0 text-2xl">
                                💼
                            </div>
                            <div>
                                <h4 class="font-bold text-xl text-white">Personal Branding & Networking</h4>
                                <p class="text-gray-400 text-sm mt-1">Optimize your LinkedIn presence to attract recruiters and learn effective networking strategies within the tech community.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="md:w-1/2 w-full">
                    <div class="bg-slate-800/50 p-8 rounded-3xl border border-slate-700 backdrop-blur-sm">
                        <h3 class="text-xl font-bold mb-6 text-center text-white">Core Industry Competencies</h3>

                        <div class="grid grid-cols-2 gap-4">
                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Data Processing</h5>
                                <p class="text-gray-400 text-xs">ETL, SQL, Advanced Pandas</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">BI & Reporting</h5>
                                <p class="text-gray-400 text-xs">PowerBI, Tableau, Storytelling</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Advanced ML</h5>
                                <p class="text-gray-400 text-xs">Clustering, Trees, Regression</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Database Mastery</h5>
                                <p class="text-gray-600 text-xs">NoSQL, SQL Server, Schema Design</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Model Ops</h5>
                                <p class="text-gray-400 text-xs">Docker, Flask, AWS Lambda</p>
                            </div>

                            <div class="p-4 rounded-xl border border-slate-700 bg-slate-900/50 hover:border-orange-500 transition duration-300">
                                <h5 class="text-orange-500 font-bold mb-1">Applied Stats</h5>
                                <p class="text-gray-400 text-xs">P-Value, Sampling, Z-Tests</p>
                            </div>
                        </div>

                        <div class="mt-8 text-center">
                            <p class="text-gray-500 text-xs italic">Training updated for 2026 industry requirements.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="py-20 bg-white overflow-hidden">
        <div class="max-w-7xl mx-auto px-6 mb-10 text-center">
            <h2 class="text-3xl font-bold">Collaborative Learning Environment</h2>
            <p class="text-gray-500">Immersive classroom training and innovation hackathons in _#City#_</p>
        </div>

        <div class="relative max-w-7xl mx-auto px-6">
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <img src="https://success24.in/img/class1.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Tech Lab in _#City#_" loading="lazy" />
                <img src="https://success24.in/img/DS_5.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Students engaged in Python coding" loading="lazy" />
                <img src="https://success24.in/img/classds.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Hands-on Project Session" loading="lazy" />
                <img src="https://success24.in/img/class_4.jpg" class="rounded-xl shadow-lg hover:scale-105 transition duration-300" alt="Job-oriented training in _#City#_" loading="lazy" />
            </div>
        </div>
    </section>

    <section class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-6">
            <div class="max-w-4xl mx-auto">
                <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-6">Top-Rated Data Science Learning Academy in _#City#_</h2>

                <p class="text-gray-600 text-lg mb-6 leading-relaxed">
                    If you are searching for a <strong>professional certification in _#City#_</strong> that yields real results, Success24 stands out as a premier destination for aspiring analysts. Our <strong>job-oriented training in _#City#_</strong> is meticulously designed to meet the demands of the modern economy, focusing on Python, AI, and predictive modeling.
                </p>

                <p class="text-gray-600 text-lg mb-10 leading-relaxed">
                    As a leading <strong>skill development institute in _#City#_</strong>, we prioritize a practical approach. Whether you are a fresh graduate or a working professional looking for <strong>weekend classes in _#City#_</strong>, our flexible curriculum is tailored for your success.
                </p>

                <h3 class="text-2xl font-bold text-gray-900 mb-4">Pay After Placement Data Science Course in _#City#_ & Surroundings</h3>

                <p class="text-gray-600 text-lg mb-6 leading-relaxed">
                    Our unique <strong>Pay After Placement model</strong> ensures that high-quality education is accessible to everyone. We believe in our training so much that we offer <strong>Zero Investment Data Science Training</strong>, allowing you to focus on learning first and paying only after you secure a position.
                </p>

                <p class="text-gray-600 text-lg mb-10 leading-relaxed">
                    This commitment to our students' success has made us one of the most trusted <strong>professional training programs in _#City#_</strong>.
                </p>

                <h3 class="text-2xl font-bold text-gray-900 mb-4">Advanced Machine Learning & AI Specialization</h3>

                <p class="text-gray-600 text-lg mb-6 leading-relaxed">
                    The <strong>Machine Learning course in _#City#_</strong> offered at Success24 is the cornerstone of our AI-driven curriculum. We provide an <strong>industry-recognized certification in _#City#_</strong> that covers:
                </p>

                <ul class="list-disc list-inside text-gray-600 text-lg mb-8 space-y-2">
                    <li>Advanced Algorithmic Modeling</li>
                    <li>Neural Network Architectures</li>
                    <li>Artificial Intelligence Integration</li>
                    <li>Case Studies from Global Markets</li>
                </ul>

                <p class="text-gray-600 text-lg mb-10 leading-relaxed">
                    For those seeking a <strong>professional course near me</strong>, our campus provides the perfect blend of theory and high-end practical application.
                </p>

                <h3 class="text-2xl font-bold text-gray-900 mb-4">Python for Data Science: Foundation to Mastery</h3>

                <p class="text-gray-600 text-lg mb-6 leading-relaxed">
                    Our <strong>Python certification training in _#City#_</strong> builds a robust foundation. You will master the libraries that power the world’s most advanced tech companies, ensuring you remain competitive in the global job market.
                </p>

                <ul class="list-disc list-inside text-gray-600 text-lg mb-8 space-y-2">
                    <li>Comprehensive Python Syntax & Logic</li>
                    <li>Scientific Computing with NumPy</li>
                    <li>Visual Analytics with Tableau & PowerBI</li>
                    <li>Big Data Integration with SQL</li>
                </ul>

                <h3 class="text-2xl font-bold text-gray-900 mb-4">12 LPA Data Science Career Opportunities</h3>

                <p class="text-gray-600 text-lg mb-6 leading-relaxed">
                    We don't just provide a course; we provide a career path. Our <strong>placement assistance in _#City#_</strong> targets roles with salaries up to 12 LPA. From <strong>classroom and online training in _#City#_</strong> to final interview prep, we are with you every step of the way.
                </p>
            </div>
        </div>
    </section>

    <section class="py-16 bg-gray-50">
        <div class="max-w-5xl mx-auto px-6">
            <h2 class="text-3xl font-bold mb-8 text-center">Frequently Asked Questions – Data Science Training in _#City#_</h2>

            <div class="space-y-6">
                <h3 class="font-semibold text-lg">1. What makes Success24 the best coaching center in _#City#_?</h3>
                <p>Our focus on practical, project-based learning combined with a robust Pay After Placement model makes us the preferred choice for students seeking a career-focused training program in _#City#_.</p>

                <h3 class="font-semibold text-lg">2. Is the Pay After Placement model available for everyone?</h3>
                <p>Yes, our Zero Investment Data Science Training is designed to support motivated learners. Candidates undergo a basic assessment to enroll in this track.</p>

                <h3 class="font-semibold text-lg">3. Do you offer classroom and online training in _#City#_?</h3>
                <p>We provide hybrid options including immersive classroom sessions and live online training to cater to both students and working professionals.</p>

                <h3 class="font-semibold text-lg">4. What is the average salary after finishing this certification?</h3>
                <p>Graduates from our learning academy typically target packages ranging from 6 LPA to 12 LPA, depending on their expertise and interview performance.</p>

                <h3 class="font-semibold text-lg">5. Are there weekend classes in _#City#_ for working professionals?</h3>
                <p>Absolutely. We offer flexible weekend batches specifically designed for professionals looking to transition into the data science domain without quitting their jobs.</p>
            </div>
        </div>
    </section>

</asp:Content>