<%@ Page Title="Home" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Success24v2.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="css/style.css" rel="stylesheet" />--%>
   <style type="text/css">
       .bg-breadcrumb {
           background: linear-gradient(rgba(242, 139, 0, 0.2), rgba(242, 139, 0, 0.3)), url('https://success24.in/img/iq-india1.jpg');
       }
       .counter-facts {
           background: linear-gradient(rgba(255, 255, 255, .8), rgba(255, 255, 255, 0.7)), url('https://success24.in/img/iq-india3.jpg');
           background-size: cover;
       }
       .event-item {
           display: flex;
           flex-direction: column;
           height: 100%;
           transition: 0.5s;
           border: 1px solid #eee;
       }
       .event-item:hover {
           box-shadow: 0 10px 20px rgba(0,0,0,0.1);
           transform: translateY(-5px);
       }

       .event-item img {
           height: 230px;
           object-fit: cover;
           width: 100%;
       }
       .event-content-box {
           flex-grow: 1;
           display: flex;
           flex-direction: column;
           padding: 1.5rem;
       }

       .event-content-box p {
           flex-grow: 1;
           font-size: 14px;
           color: #666;
       }
   </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="header-carousel owl-carousel">
        <div class="header-carousel-item">
            <img src="https://success24.in/img/pooja2.jpeg" class="img-fluid w-100" style="height: 600px; object-fit: cover;" alt="Success24 Banner">
            <div class="carousel-caption">
                <div class="carousel-caption-content p-3" style="max-width: 900px;">
                    <h4 class="text-secondary text-uppercase fw-bold mb-4">सफलता के लिए एक कदम</h4>
                    <h1 class="display-1 text-white mb-4">कौशल भारत कुशल भारत</h1>
                    <p class="fs-5">आपकी बड़ी सफलता के लिए एक कदम। शून्य निवेश और सफलता साझा मॉडल। औसत वेतन नौ से दस लाख।</p>
                </div>
            </div>
        </div>

        <div class="header-carousel-item">
            <img src="https://success24.in/img/iq-india3.jpg" class="img-fluid w-100" style="height: 600px; object-fit: cover;" alt="Success24 Banner">
            <div class="carousel-caption">
                <div class="carousel-caption-content p-3" style="max-width: 900px;">
                    <h4 class="text-secondary text-uppercase fw-bold mb-4">Explore Your Future</h4>
                    <h1 class="display-1 text-white mb-4">Once A Professional, Always A Success</h1>
                    <p class="fs-5">Transforming lives through quality education and industry-ready skills.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid counter-facts py-5">
        <div class="container">
            <div class="row g-4 text-center">
                <div class="col-md-3">
                    <h3 class="h5">Total Success</h3>
                    <h2 class="display-6 fw-bold"><asp:Literal runat="server" ID="_LiteralSuccess"></asp:Literal>+</h2>
                </div>
                <div class="col-md-3">
                    <h3 class="h5">Best Instructor</h3>
                    <h2 class="display-6 fw-bold">10+</h2>
                </div>
                <div class="col-md-3">
                    <h3 class="h5">Total Branches</h3>
                    <h2 class="display-6 fw-bold"><asp:Literal runat="server" ID="_LiteralBatch"></asp:Literal>+</h2>
                </div>
                <div class="col-md-3">
                    <h3 class="h5">Practitioners</h3>
                    <h2 class="display-6 fw-bold"><asp:Literal runat="server" ID="_LiteralPrac"></asp:Literal>+</h2>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row align-items-end mb-5">
                <div class="col-lg-8">
                    <h4 class="text-secondary fw-bold">Programs</h4>
                    <h1 class="display-3">Upcoming Programs</h1>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <a href="https://success24.in" class="btn btn-primary rounded-pill py-3 px-5">View All Programs</a>
                </div>
            </div>

            <div class="row g-4 justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="event-item rounded shadow-sm">
                        <div class="position-relative">
                            <img src="https://success24.in/img/ds.jpg" alt="Data Science">
                            <span class="bg-primary text-white fw-bold position-absolute top-0 end-0 p-2 m-2 rounded">JUN 28</span>
                        </div>
                        <div class="event-content-box">
                            <h4 class="mb-3">Data Science Engineering</h4>
                            <p>In-depth training in data analysis, machine learning, AI, and big-data technologies using Python, SQL, and Hadoop.</p>
                            <a class="btn btn-primary rounded-pill py-2 px-4" href="Register.aspx">Register Now</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="event-item rounded shadow-sm">
                        <div class="position-relative">
                            <img src="https://success24.in/img/devops.jpeg" alt="DevOps">
                            <span class="bg-primary text-white fw-bold position-absolute top-0 end-0 p-2 m-2 rounded">JUN 30</span>
                        </div>
                        <div class="event-content-box">
                            <h4 class="mb-3">DevOps Engineering</h4>
                            <p>Master CI/CD, Docker, Kubernetes, and cloud automation to optimize software delivery and efficiency.</p>
                            <a class="btn btn-primary rounded-pill py-2 px-4" href="Register.aspx">Register Now</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="event-item rounded shadow-sm">
                        <div class="position-relative">
                            <img src="https://success24.in/img/sp.jpg" alt="SharePoint">
                            <span class="bg-primary text-white fw-bold position-absolute top-0 end-0 p-2 m-2 rounded">MAY 15</span>
                        </div>
                        <div class="event-content-box">
                            <h4 class="mb-3">SharePoint Engineering</h4>
                            <p>SPFx development, Power Platform automation, and modern intranet solutions using C# and JavaScript.</p>
                            <a class="btn btn-primary rounded-pill py-2 px-4" href="Register.aspx">Register Now</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="event-item rounded shadow-sm">
                        <div class="position-relative">
                            <img src="https://success24.in/img/sdet.jpg" alt="SDET">
                            <span class="bg-primary text-white fw-bold position-absolute top-0 end-0 p-2 m-2 rounded">APR 2</span>
                        </div>
                        <div class="event-content-box">
                            <h4 class="mb-3">SDET Training</h4>
                            <p>Automated testing strategies, Selenium, and modern QA methodologies to ensure high-quality software delivery.</p>
                            <a class="btn btn-primary rounded-pill py-2 px-4" href="Register.aspx">Register Now</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="event-item rounded shadow-sm">
                        <div class="position-relative">
                            <img src="https://success24.in/img/DS.jpg" alt="Cyber Security">
                            <span class="bg-primary text-white fw-bold position-absolute top-0 end-0 p-2 m-2 rounded">MAY 15</span>
                        </div>
                        <div class="event-content-box">
                            <h4 class="mb-3">Cyber Security</h4>
                            <p>Expertise in ethical hacking, network defense, risk assessment, and incident response to protect digital infrastructures.</p>
                            <a class="btn btn-primary rounded-pill py-2 px-4" href="Register.aspx">Register Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
