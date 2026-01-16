<%@ Page Title="Event Gallery" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="EventPage.aspx.cs" Inherits="Success24v2.EventPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Modern Lightbox Styles */
        .lightbox {
            display: none;
            position: fixed;
            inset: 0;
            z-index: 9999;
            background: rgba(0, 0, 0, 0.9);
            backdrop-filter: blur(8px);
            align-items: center;
            justify-content: center;
        }

            .lightbox:target {
                display: flex;
            }

        .gallery-img {
            transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

            .gallery-img:hover {
                transform: scale(1.05);
            }

        body:has(.lightbox:target) {
            overflow: hidden;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Main Wrapper ensures the footer is pushed down --%>
    <div class="bg-gray-50 min-h-screen flex flex-col py-12">
        <div class="max-w-7xl mx-auto px-4 w-full flex-grow">

            <header class="text-center mb-12">
                <h1 class="text-4xl font-black text-gray-900 tracking-tight uppercase">Event Gallery</h1>
                <div class="h-1 w-20 bg-orange-500 mx-auto mt-4"></div>
            </header>

            <%-- The Gallery Grid --%>
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8 mb-12">
                <asp:Repeater ID="rptGallery" runat="server">
                    <ItemTemplate>
                        <%-- Thumbnail Card --%>
                        <a href='#img_<%# Container.ItemIndex %>' class="group relative bg-white rounded-2xl shadow-md overflow-hidden block">
                            <img src='<%# ResolveUrl("~/" + Eval("FilePath")) %>'
                                alt='<%# Eval("Title") %>'
                                class="gallery-img w-full h-72 object-cover" />
                            <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-end p-6">
                                <p class="text-white font-medium text-lg"><%# Eval("Title") %></p>
                            </div>
                        </a>

                        <%-- Lightbox Overlay --%>
                        <div id='img_<%# Container.ItemIndex %>' class="lightbox p-4">
                            <%-- Close Button --%>
                            <a href="#!" class="absolute top-6 right-8 text-white/50 hover:text-white text-5xl font-thin z-[10000]">&times;</a>

                            <%-- Navigation: Previous --%>
                            <asp:PlaceHolder runat="server" Visible='<%# Container.ItemIndex > 0 %>'>
                                <a href='#img_<%# Container.ItemIndex - 1 %>' class="absolute left-4 top-1/2 -translate-y-1/2 text-white/30 hover:text-orange-500 text-7xl p-4 transition-colors z-50">&lsaquo;</a>
                            </asp:PlaceHolder>

                            <%-- Navigation: Next Arrow (Right Side) --%>
                            <a href='#img_<%# Container.ItemIndex + 1 %>' class="absolute right-4 top-1/2 -translate-y-1/2 text-white/30 hover:text-orange-500 text-7xl p-4 transition-colors z-50">&rsaquo;</a>

                            <div class="relative flex flex-col items-center max-w-5xl w-full">

                                <%-- CLICK IMAGE TO GO TO NEXT --%>
                                <a href='#img_<%# Container.ItemIndex + 1 %>' title="Click for Next Image">
                                    <img src='<%# ResolveUrl("~/" + Eval("FilePath")) %>'
                                        class="max-h-[80vh] max-w-full rounded-lg shadow-2xl border-4 border-white/10 object-contain" />
                                </a>

                                <div class="mt-8 text-center">
                                    <h3 class="text-white text-2xl font-light tracking-widest uppercase"><%# Eval("Title") %></h3>
                                    <div class="h-0.5 w-16 bg-orange-600 mx-auto mt-3"></div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
