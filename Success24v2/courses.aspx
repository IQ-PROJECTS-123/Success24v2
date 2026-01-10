<%@ Page Title="All Courses" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="courses.aspx.cs" Inherits="Success24v2.courses" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .course-card {
            border: none;
            border-radius: 14px;
            overflow: hidden;
            transition: all .4s ease;
            box-shadow: 0 8px 22px rgba(0,0,0,.08);
        }

            .course-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 25px 45px rgba(0,0,0,.18);
            }

            .course-card img {
                height: 180px;
                object-fit: cover;
            }

        .course-details {
            font-size: 14px;
            color: #6c757d;
        }

        .course-link {
            text-decoration: none;
            color: inherit;
        }
    </style>

    <section class="py-5 bg-light">
        <div class="container">

            <div class="text-center mb-5">
                <h1 class="fw-bold display-6">All Professional Courses</h1>
                <p class="text-muted">Industry-focused training with real-world projects</p>
            </div>

            <!-- ================= DOTNET & MICROSOFT ================= -->
            <div class="flex justify-center items-center py-20">
                <h1 class="text-5xl md:text-7xl font-black text-center tracking-tighter uppercase italic">
                    <span class="bg-clip-text text-transparent bg-gradient-to-r from-orange-400 to-orange-600">DotNet & Microsoft
                    </span>
                </h1>
            </div>
            <div class="row g-4 mb-5">

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1581090700227-1e37b190418e">
                        <div class="card-body">
                            <h5>ASP.NET MVC Training</h5>
                            <p>Enterprise MVC apps using Razor & EF.</p>
                            <div class="course-details">
                                <div>⏱ 180 Daya</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1518770660439-4636190af475">
                        <div class="card-body">
                            <h5>DotNet Training</h5>
                            <p>C#, OOPs, WebForms & MVC.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1605379399642-870262d3d051">
                        <div class="card-body">
                            <h5>Office 365 SharePoint Development</h5>
                            <p>SP Online, Power Automate & Graph API.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days </div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1558494949-ef010cbdcc31">
                        <div class="card-body">
                            <h5>Windows Azure Development</h5>
                            <p>Azure services, DevOps & deployment.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days </div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1555949963-aa79dcee981c">
                        <div class="card-body">
                            <h5>SharePoint 2019</h5>
                            <p>Customization & development basics.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1519389950473-47ba0277781c">
                        <div class="card-body">
                            <h5>SharePoint 2019 Administration</h5>
                            <p>Farm setup, security & maintenance.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1498050108023-c5249f4df085">
                        <div class="card-body">
                            <h5>SharePoint 2019 Designer</h5>
                            <p>Workflow & business automation.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1522071820081-009f0129c71c">
                        <div class="card-body">
                            <h5>SharePoint Architect</h5>
                            <p>Enterprise architecture & governance.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- ================= PROGRAMMING ================= -->
            <div class="flex justify-center items-center py-20">
                <h1 class="text-5xl md:text-7xl font-black text-center tracking-tighter uppercase italic">
                    <span class="bg-clip-text text-transparent bg-gradient-to-r from-orange-400 to-orange-600">PROGRAMING
                    </span>
                </h1>
            </div>
            <div class="row g-4 mb-5">

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1547658719-da2b51169166">
                        <div class="card-body">
                            <h5>HTML5, CSS & JavaScript</h5>
                            <p>Responsive UI & frontend logic.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1517433456452-f9633a875f6f">
                        <div class="card-body">
                            <h5>Java Technologies</h5>
                            <p>Core Java, Advanced Java & Spring.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1526378722484-bd91ca387e72">
                        <div class="card-body">
                            <h5>Python & R Programming</h5>
                            <p>Automation & data analysis.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1515879218367-8466d910aaa4">
                        <div class="card-body">
                            <h5>PHP Technologies</h5>
                            <p>Web backend with MySQL.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1555066931-4365d14bab8c">
                        <div class="card-body">
                            <h5>Node.js Development</h5>
                            <p>REST APIs & backend services.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days </div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1531497865144-0464ef8fb9a9">
                        <div class="card-body">
                            <h5>Angular & AngularJS</h5>
                            <p>SPA development & UI frameworks.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- ================= DATA & CLOUD ================= -->
            <div class="flex justify-center items-center py-20">
                <h1 class="text-5xl md:text-7xl font-black text-center tracking-tighter uppercase italic">
                    <span class="bg-clip-text text-transparent bg-gradient-to-r from-orange-400 to-orange-600">DATA & CLOUD
                    </span>
                </h1>
            </div>
            <div class="row g-4 mb-5">

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1516321318423-f06f85e504b3">
                        <div class="card-body">
                            <h5>Database</h5>
                            <p>RDBMS concepts & tuning.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1504639725590-34d0984388bd">
                        <div class="card-body">
                            <h5>SQL / NoSQL</h5>
                            <p>Relational & non-relational DBs.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days </div>
                                <div>🎓 Advanced </div>
                                <div>📍 Offline </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1451187580459-43490279c0fa">
                        <div class="card-body">
                            <h5>Big Data Hadoop</h5>
                            <p>HDFS, Spark & analytics.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1504384308090-c894fdcc538d">
                        <div class="card-body">
                            <h5>Hadoop Administration</h5>
                            <p>Cluster setup & management.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1509228468518-180dd4864904">
                        <div class="card-body">
                            <h5>Data Science</h5>
                            <p>ML, AI & analytics.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1492724441997-5dc865305da7">
                        <div class="card-body">
                            <h5>Cloud Computing</h5>
                            <p>AWS, Azure & architecture.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- ================= OTHERS ================= -->
            <div class="flex justify-center items-center py-20">
                <h1 class="text-5xl md:text-7xl font-black text-center tracking-tighter uppercase italic">
                    <span class="bg-clip-text text-transparent bg-gradient-to-r from-orange-400 to-orange-600">OTHERS
                    </span>
                </h1>
            </div>
            <div class="row g-4">

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1518770660439-4636190af475">
                        <div class="card-body">
                            <h5>Linux Administration</h5>
                            <p>Server & shell scripting.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced </div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1517433456452-f9633a875f6f">
                        <div class="card-body">
                            <h5>Android App Development</h5>
                            <p>Kotlin & Play Store.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1498050108023-c5249f4df085">
                        <div class="card-body">
                            <h5>Hybrid Mobile Apps</h5>
                            <p>Ionic & React Native.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced </div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1553877522-43269d4ea984">
                        <div class="card-body">
                            <h5>Software Testing</h5>
                            <p>Manual testing & QA.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced </div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1531482615713-2afd69097998">
                        <div class="card-body">
                            <h5>Automation Testing</h5>
                            <p>Selenium & CI pipelines.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced </div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1556761175-5973dc0f32e7">
                        <div class="card-body">
                            <h5>Digital Marketing</h5>
                            <p>SEO, Ads & analytics.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced </div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1522199755839-a2bacb67c546">
                        <div class="card-body">
                            <h5>Graphic / Web Design</h5>
                            <p>UI/UX & design tools.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced </div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="https://images.unsplash.com/photo-1600880292089-90a7e086ee0c">
                        <div class="card-body">
                            <h5>SAP ERP+ Development</h5>
                            <p>SAP modules & enterprise apps.</p>
                            <div class="course-details">
                                <div>⏱ 180 Days</div>
                                <div>🎓 Advanced</div>
                                <div>📍 Offline</div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </section>
</asp:Content>
