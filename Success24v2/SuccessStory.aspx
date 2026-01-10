<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="SuccessStory.aspx.cs" Inherits="Success24v2.SuccessStory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
     .img-fluid{
         height:200px!important;
     }
     .bg-breadcrumb{
         background: linear-gradient(rgba(242, 139, 0, 0.2), rgba(242, 139, 0, 0.3)), url(img/iq-india1.jpg)!important;
     }
     .counter-facts
     {
         background: linear-gradient(rgba(255, 255, 255, .8), rgba(255, 255, 255, 0.7)), url(img/iq-india3.jpg);
     }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Banner Start -->
 <div class="container-fluid bg-secondary wow zoomInDown" data-wow-delay="0.1s">
     <div class="container">
         <div class="d-flex flex-column flex-lg-row align-items-center justify-content-center text-center p-5">
             <h1 class="me-4"><span class="fw-normal">Join us today for </span><span> your Success</span></h1>
             <a href="#" class="text-white fw-bold fs-2"> <i class="fa fa-phone me-1"></i> +91-9555580458</a>
         </div>
     </div>
 </div>
 <!-- Banner End -->
           <!-- Header Start -->
   <div class="container-fluid bg-breadcrumb">
       <div class="container text-center py-5" style="max-width: 900px;">
           <h3 class="text-primary display-3 mb-4 wow fadeInDown" data-wow-delay="0.1s">Success Stories</h3>
           <ol class="breadcrumb justify-content-center text-white mb-0 wow fadeInDown" data-wow-delay="0.3s">
               <li class="breadcrumb-item"><a href="index.html" class="text-dark">Home</a></li>
               <li class="breadcrumb-item"><a href="#" class="text-dark">Pages</a></li>
               <li class="breadcrumb-item active text-primary">Events</li>
           </ol>    
       </div>
   </div>
   <!-- Header End -->

   <!-- Banner Start -->
   <div class="container-fluid bg-secondary wow zoomInDown" data-wow-delay="0.1s">
       <div class="container">
           <div class="d-flex flex-column flex-lg-row align-items-center justify-content-center text-center p-5">
               <h1 class="me-4"><span class="fw-normal">Join us today for </span><span> your Success</span></h1>
               <a href="#" class="text-white fw-bold fs-2"> <i class="fa fa-phone me-1"></i> +91-9555580458</a>
           </div>
       </div>
   </div>
   <!-- Banner End -->
     <!-- Events Start -->
 <div class="container-fluid events py-5">
     <div class="container py-5">
         <div class="pb-5">
             <div class="row g-4 align-items-end">
                 <div class="col-xl-8">
                     <h4 class="text-secondary sub-title fw-bold wow fadeInUp" data-wow-delay="0.1s">Success</h4>
                     <h1 class="display-2 mb-0 wow fadeInUp" data-wow-delay="0.3s">Recent Stories</h1>
                 </div>
                 <div class="col-xl-4 text-xl-end pb-3 wow fadeInUp" data-wow-delay="0.3s">
                     <a class="btn btn-primary rounded-pill text-white py-3 px-5" href="#">View All Stories</a>
                 </div>
             </div>
         </div>
            <!-- Counter Facts Start -->
   <div class="container-fluid counter-facts py-5">
       <div class="container">
           <div class="row">
               <div class="col-12 col-sm-6 col-md-6 col-xl-3 wow fadeInUp" data-wow-delay="0.1s">
                   <div class="counter">
                       <div class="counter-icon w-100 d-flex align-items-center justify-content-center">
                           <h3>Total Success</h3>
                       </div>
                       <div class="counter-content d-flex align-items-center justify-content-center mt-4">
                           <span class="counter-value" data-toggle="counter-up"><asp:Literal runat="server" ID="_LiteralSuccess"></asp:Literal></span>
                           <h4 class="text-secondary mb-0" style="font-weight: 600; font-size: 25px;">+</h4>
                       </div>
                   </div>
               </div>
               <div class="col-12 col-sm-6 col-md-6 col-xl-3 wow fadeInUp" data-wow-delay="0.3s">
                   <div class="counter">
                       <div class="counter-icon w-100 d-flex align-items-center justify-content-center">
                           <h3>Best Instructor</h3>
                       </div>
                       <div class="counter-content d-flex align-items-center justify-content-center mt-4">
                           <span class="counter-value" data-toggle="counter-up">10</span>
                           <h4 class="text-secondary mb-0" style="font-weight: 600; font-size: 25px;">+</h4>
                       </div>
                   </div>
               </div>
               <div class="col-12 col-sm-6 col-md-6 col-xl-3 wow fadeInUp" data-wow-delay="0.5s">
                   <div class="counter">
                       <div class="counter-icon w-100 d-flex align-items-center justify-content-center">
                           <h3>Total Brunch</h3>
                       </div>
                       <div class="counter-content d-flex align-items-center justify-content-center mt-4">
                           <span class="counter-value" data-toggle="counter-up">15</span>
                           <h4 class="text-secondary mb-0" style="font-weight: 600; font-size: 25px;">+</h4>
                       </div>
                   </div>
               </div>
               <div class="col-12 col-sm-6 col-md-6 col-xl-3 wow fadeInUp" data-wow-delay="0.7s">
                   <div class="counter">
                       <div class="counter-icon w-100 d-flex align-items-center justify-content-center">
                           <h3>Total Practitioner</h3>
                       </div>
                       <div class="counter-content d-flex align-items-center justify-content-center mt-4">
                           <span class="counter-value" data-toggle="counter-up"><asp:Literal runat="server" ID="_LiteralPrac"></asp:Literal></span>
                           <h4 class="text-secondary mb-0" style="font-weight: 600; font-size: 25px;">+</h4>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </div>
   <!-- Counter Facts End -->
<br /><br />
         <div class="row g-4 justify-content-center">
            <%-- <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.1s">
                 <div class="event-item rounded">
                     <div class="position-relative">
                         <img src="img/service-1.jpg" class="img-fluid rounded-top w-100" alt="Image">
                         <div class="bg-primary text-white fw-bold rounded d-inline-block position-absolute p-2" style="top: 0; right: 0;">JAN 20</div>
                         <div class="d-flex justify-content-between border-start border-end bg-white px-2 py-2 w-100 position-absolute" style="bottom: 0; left: 0; opacity: 0.8;">
                             <a href="#" class="text-dark"><i class="fas fa-clock text-primary"></i> 08:00AM - 10:00PM</a>
                             <a href="#" class="text-dark"><span class="fas fa-map-marker-alt text-primary"></span> New York</a>
                         </div>
                     </div>
                     <div class="border border-top-0 rounded-bottom p-4">
                         <a href="#" class="h4 mb-3 d-block">Open House - Springs Dance</a>
                         <p class="mb-3">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Magni vero excepturi blanditiis quidem</p>
                         <a class="btn btn-primary rounded-pill text-white py-2 px-4" href="#">Watch Now</a>
                     </div>
                 </div>
             </div>
             <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.3s">
                 <div class="event-item rounded">
                     <div class="position-relative">
                         <img src="img/service-2.jpg" class="img-fluid rounded-top w-100" alt="Image">
                         <div class="bg-primary text-white rounded d-inline-block position-absolute p-2" style="top: 0; right: 0;">JUN 30</div>
                         <div class="d-flex justify-content-between border-start border-end bg-white px-2 py-2 w-100 position-absolute" style="bottom: 0; left: 0; opacity: 0.8;">
                             <a href="#" class="text-dark"><i class="fas fa-clock text-primary"></i> 08:00AM - 10:00PM</a>
                             <a href="#" class="text-dark"><span class="fas fa-map-marker-alt text-primary"></span> New York</a>
                         </div>
                     </div>
                     <div class="border rounded-bottom p-4">
                         <a href="#" class="h4 mb-3 d-block">Open House And Registration</a>
                         <p class="mb-3">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Magni vero excepturi blanditiis quidem</p>
                         <a class="btn btn-primary rounded-pill text-white py-2 px-4" href="#">Watch Now</a>
                     </div>
                 </div>
             </div>
             <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.5s">
                 <div class="event-item rounded">
                     <div class="position-relative">
                         <img src="img/service-3.jpg" class="img-fluid rounded-top w-100" alt="Image">
                         <div class="bg-primary text-white rounded d-inline-block position-absolute p-2" style="top: 0; right: 0;">MAY 15</div>
                         <div class="d-flex justify-content-between border-start border-end bg-white px-2 py-2 w-100 position-absolute" style="bottom: 0; left: 0; opacity: 0.8;">
                             <a href="#" class="text-dark"><i class="fas fa-clock text-primary"></i> 08:00AM - 10:00PM</a>
                             <a href="#" class="text-dark"><span class="fas fa-map-marker-alt text-primary"></span> New York</a>
                         </div>
                     </div>
                     <div class="border rounded-bottom p-4">
                         <a href="#" class="h4 mb-3 d-block">Open House Morris Dance</a>
                         <p class="mb-3">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Magni vero excepturi blanditiis quidem</p>
                         <a class="btn btn-primary rounded-pill text-white py-2 px-4" href="#">Watch Now</a>
                     </div>
                 </div>
             </div>
             <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.7s">
                 <div class="event-item rounded">
                     <div class="position-relative">
                         <img src="img/service-4.jpg" class="img-fluid rounded-top w-100" alt="Image">
                         <div class="bg-primary text-white rounded d-inline-block position-absolute p-2" style="top: 0; right: 0;">APR 2</div>
                         <div class="d-flex justify-content-between border-start border-end bg-white px-2 py-2 w-100 position-absolute" style="bottom: 0; left: 0; opacity: 0.8;">
                             <a href="#" class="text-dark"><i class="fas fa-clock text-primary"></i> 08:00AM - 10:00PM</a>
                             <a href="#" class="text-dark"><span class="fas fa-map-marker-alt text-primary"></span> New York</a>
                         </div>
                     </div>
                     <div class="border rounded-bottom p-4">
                         <a href="#" class="h4 mb-3 d-block">Open House Dance Studio</a>
                         <p class="mb-3">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Magni vero excepturi blanditiis quidem</p>
                         <a class="btn btn-primary rounded-pill text-white py-2 px-4" href="#">Watch Now</a>
                     </div>
                 </div>
             </div>--%>
              <asp:Literal runat="server" ID="Literal1"></asp:Literal>
         </div>
     </div>
 </div>
 <!-- Events End -->
    
</asp:Content>
