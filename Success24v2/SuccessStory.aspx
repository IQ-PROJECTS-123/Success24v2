<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="SuccessStory.aspx.cs" Inherits="Success24v2.SuccessStory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --primary-orange: #fd7e14;
        }

        .text-primary {
            color: var(--primary-orange) !important;
        }

        .bg-primary {
            background-color: var(--primary-orange) !important;
        }

        .btn-primary {
            background-color: var(--primary-orange) !important;
            border-color: var(--primary-orange) !important;
        }

        .event-item {
            display: flex;
            flex-direction: column;
            height: 100%;
            transition: transform 0.3s;
        }

            .event-item:hover {
                transform: translateY(-5px);
            }

        .card-img-wrap {
            height: 260px;
            width: 100%;
            overflow: hidden;
            position: relative;
        }

            .card-img-wrap img {
                width: 100%;
                height: 100%;
                object-fit: fill;
            }

        .counter-up {
            font-variant-numeric: tabular-nums;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid bg-breadcrumb">
        <div class="container text-center py-5" style="max-width: 900px;">
            <h3 class="text-primary display-3 mb-4 wow fadeInDown" data-wow-delay="0.1s">Success Stories</h3>
            <ol class="breadcrumb justify-content-center text-white mb-0 wow fadeInDown" data-wow-delay="0.3s">
                <li class="breadcrumb-item"><a href="24.Master" class="text-dark">Home</a></li>
                <li class="breadcrumb-item"><a href="#" class="text-dark">Pages</a></li>
                <li class="breadcrumb-item active text-primary">Success</li>
            </ol>
        </div>
    </div>

    <div class="container-fluid bg-secondary wow zoomInDown" data-wow-delay="0.1s">
        <div class="container">
            <div class="d-flex flex-column flex-lg-row align-items-center justify-content-center text-center p-5">
                <h1 class="me-4 text-white"><span class="fw-normal">Join us today for </span><span>your Success</span></h1>
                <a href="#" class="text-white fw-bold fs-2"><i class="fa fa-phone me-1"></i>+91-9555580458</a>
            </div>
        </div>
    </div>

    <div class="container-fluid events pt-5">
        <div class="container pt-5">
            <div class="pb-5">
                <div class="row g-4 align-items-end">
                    <div class="col-xl-8">
                        <h4 class="text-primary sub-title fw-bold wow fadeInUp" data-wow-delay="0.1s">Success</h4>
                        <h1 class="display-2 mb-0 wow fadeInUp text-dark" data-wow-delay="0.3s">Recent Stories</h1>
                    </div>
                    <div class="col-xl-4 text-xl-end pb-3 wow fadeInUp" data-wow-delay="0.3s">
                        <a class="btn btn-primary rounded-pill text-white py-3 px-5" href="#">View All Stories</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="relative container-fluid py-24 bg-[url('https://success24.in/img/DS_5.jpg')] bg-cover bg-center bg-fixed bg-no-repeat">
        <div class="absolute inset-0 bg-black/40"></div>

        <div class="relative z-10 container mx-auto px-4">
            <div class="text-center mb-16 wow fadeInUp" data-wow-delay="0.1s">
                <p class="text-white text-sm tracking-[0.3em] font-medium mb-3 uppercase opacity-90">Our Achievements</p>
                <h2 class="text-white text-4xl md:text-5xl font-bold mb-6">Success in <span class="text-yellow-400">Numbers</span></h2>
                <div class="w-16 h-[2px] bg-white/30 mx-auto"></div>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 max-w-6xl mx-auto">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-white/10 border border-white/20 backdrop-blur-md rounded-[2.5rem] p-10 text-center transition-all hover:bg-white/20">
                        <p class="text-white text-xs tracking-widest uppercase mb-4 opacity-80">Total Success</p>
                        <div class="flex items-start justify-center text-white">
                            <div class="text-5xl font-bold counter-up">
                                <asp:Literal runat="server" ID="_LiteralSuccess" /></div>
                            <span class="text-3xl font-semibold ml-1 mt-1">+</span>
                        </div>
                    </div>
                </div>
                <div class="wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-white/10 border border-white/20 backdrop-blur-md rounded-[2.5rem] p-10 text-center transition-all hover:bg-white/20">
                        <p class="text-white text-xs tracking-widest uppercase mb-4 opacity-80">Best Instructor</p>
                        <div class="flex items-start justify-center text-white">
                            <div class="text-5xl font-bold counter-up">10</div>
                            <span class="text-3xl font-semibold ml-1 mt-1">+</span>
                        </div>
                    </div>
                </div>
                <div class="wow fadeInUp" data-wow-delay="0.5s">
                    <div class="bg-white/10 border border-white/20 backdrop-blur-md rounded-[2.5rem] p-10 text-center transition-all hover:bg-white/20">
                        <p class="text-white text-xs tracking-widest uppercase mb-4 opacity-80">Total Branches</p>
                        <div class="flex items-start justify-center text-white">
                            <div class="text-5xl font-bold counter-up">15</div>
                            <span class="text-3xl font-semibold ml-1 mt-1">+</span>
                        </div>
                    </div>
                </div>
                <div class="wow fadeInUp" data-wow-delay="0.7s">
                    <div class="bg-white/10 border border-white/20 backdrop-blur-md rounded-[2.5rem] p-10 text-center transition-all hover:bg-white/20">
                        <p class="text-white text-xs tracking-widest uppercase mb-4 opacity-80">Total Practitioner</p>
                        <div class="flex items-start justify-center text-white">
                            <div class="text-5xl font-bold counter-up">
                                <asp:Literal runat="server" ID="_LiteralPrac" /></div>
                            <span class="text-3xl font-semibold ml-1 mt-1">+</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid py-5">
        <div class="container">
            <div class="row g-4 justify-content-center">
                <asp:Literal runat="server" ID="Literal1"></asp:Literal>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const counters = document.querySelectorAll('.counter-up');

            const getSafeNumber = (text) => {
                const cleaned = (text || "").replace(/[^\d]/g, "").trim();
                const value = parseInt(cleaned, 10);
                return isNaN(value) ? 0 : value;
            };

            const runCounter = (el) => {
                const target = getSafeNumber(el.textContent);

                // If target is 0 or invalid, just show 0 and stop
                if (target <= 0) {
                    el.textContent = "0";
                    return;
                }

                let count = 0;
                const duration = 2000;
                const stepTime = 16;
                const increment = target / (duration / stepTime);

                const update = () => {
                    count += increment;

                    if (count < target) {
                        el.textContent = Math.floor(count).toString();
                        requestAnimationFrame(update);
                    } else {
                        el.textContent = target.toString();
                    }
                };

                update();
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        runCounter(entry.target);
                        observer.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.5 });

            counters.forEach(c => {
                c.textContent = getSafeNumber(c.textContent).toString();
                observer.observe(c);
            });
        });
    </script>
</asp:Content>
