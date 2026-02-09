<%@ Page Title="Event Gallery" Language="C#" MasterPageFile="~/24.Master"
    AutoEventWireup="true" CodeBehind="EventPage.aspx.cs"
    Inherits="Success24v2.EventPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        /* Lightbox Modal */
        #lightbox {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.9);
            z-index: 10000;
        }

            #lightbox.active {
                display: flex;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-gray-50 min-h-screen py-12">
        <div class="max-w-7xl mx-auto px-4">

            <h1 class="text-4xl font-black text-center mb-10 uppercase">Event Gallery
            </h1>

            <!-- GALLERY GRID -->
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
                <asp:Repeater ID="rptGallery" runat="server">
                    <ItemTemplate>

                        <img src='<%# ResolveUrl("~/" + Eval("FilePath")) %>'
                            alt='<%# Eval("Title") %>'
                            class="w-full h-72 object-cover rounded-xl shadow cursor-pointer hover:opacity-90"
                            onclick="openLightbox(<%# Container.ItemIndex %>)" />

                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>
    </div>

    <!-- LIGHTBOX -->
    <div id="lightbox" class="items-center justify-center">

        <!-- CLOSE -->
        <button type="button"
            onclick="closeLightbox()"
            class="absolute top-6 right-8 text-white text-5xl font-thin">
            &times;
        </button>

        <!-- PREVIOUS -->
        <button type="button"
            onclick="prevImage()"
            class="absolute left-6 text-white text-7xl opacity-40 hover:opacity-100">
            &lsaquo;
        </button>

        <!-- NEXT -->
        <button type="button"
            onclick="nextImage()"
            class="absolute right-6 text-white text-7xl opacity-40 hover:opacity-100">
            &rsaquo;
        </button>


        <!-- IMAGE -->
        <img id="lightboxImg"
            class="max-h-[90vh] max-w-[90vw] object-contain rounded-lg shadow-2xl" />

    </div>

    <script>
        // Collect all images
        const images = Array.from(document.querySelectorAll('.grid img'));
        let currentIndex = 0;

        function openLightbox(index) {
            currentIndex = index;
            document.getElementById('lightboxImg').src = images[index].src;
            document.getElementById('lightbox').classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function closeLightbox() {
            document.getElementById('lightbox').classList.remove('active');
            document.body.style.overflow = '';
        }

        function nextImage() {
            currentIndex = (currentIndex + 1) % images.length;
            document.getElementById('lightboxImg').src = images[currentIndex].src;
        }

        function prevImage() {
            currentIndex = (currentIndex - 1 + images.length) % images.length;
            document.getElementById('lightboxImg').src = images[currentIndex].src;
        }

        // ESC to close
        document.addEventListener('keydown', function (e) {
            if (e.key === "Escape") closeLightbox();
        });
    </script>

</asp:Content>
