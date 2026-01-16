<%@ Page Title="Manage Gallery" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="AdminGallery.aspx.cs" Inherits="Success24v2.AdminGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .image-card:hover .delete-overlay {
            opacity: 1;
        }

        .delete-overlay {
            opacity: 0;
            transition: opacity 0.3s;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-7xl mx-auto py-12 px-4">

        <div class="flex flex-col md:flex-row md:items-center justify-between mb-10 gap-4">
            <div>
                <h2 class="text-3xl font-bold text-gray-800">Gallery Management</h2>
                <p class="text-gray-500 text-sm">View, moderate, and delete images from the event library.</p>
            </div>
            <div class="flex gap-3">
                <a href="AdminGallery.aspx" class="bg-gray-100 text-gray-700 px-5 py-2.5 rounded-xl font-semibold hover:bg-gray-200 transition">Review Pending
                </a>
                <a href="GalleryUpload.aspx" class="bg-orange-600 text-white px-5 py-2.5 rounded-xl font-bold hover:bg-orange-700 transition shadow-lg shadow-orange-200">+ Upload New
                </a>
            </div>
        </div>

        <div class="bg-white border border-gray-200 rounded-2xl p-6 mb-8 flex flex-wrap gap-8">
            <div>
                <p class="text-xs font-bold text-gray-400 uppercase tracking-widest">Total Media</p>
                <p class="text-2xl font-black text-gray-800">
                    <asp:Literal ID="litTotal" runat="server">0</asp:Literal>
                </p>
            </div>
            <div class="w-px h-10 bg-gray-100 hidden md:block"></div>
            <div>
                <p class="text-xs font-bold text-gray-400 uppercase tracking-widest">Database Table</p>
                <p class="text-sm font-medium text-orange-600">EventGallery</p>
            </div>
        </div>

        <asp:Repeater ID="rptGallery" runat="server" OnItemCommand="rptGallery_ItemCommand">
            <HeaderTemplate>
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="bg-white rounded-2xl border border-gray-200 shadow-sm overflow-hidden image-card flex flex-col">

                    <div class="relative h-52 group">
                        <img src='<%# ResolveUrl("~/" + Eval("FilePath")) %>'
                            class="w-full h-full object-cover"
                            alt='<%# Eval("Title") %>' />

                        <div class="absolute top-3 left-3">
                            <span class='<%# GetStatusClass(Eval("Status").ToString()) %>'>
                                <%# Eval("Status") %>
                            </span>
                        </div>
                    </div>

                    <div class="p-5 flex-grow">
                        <h4 class="text-lg font-bold text-gray-800 truncate mb-1" title='<%# Eval("Title") %>'>
                            <%# Eval("Title") %>
                        </h4>
                        <div class="flex items-center text-gray-400 text-xs mb-4">
                            <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                            </svg>
                            <%# Eval("UploadedDate", "{0:MMM dd, yyyy}") %>
                        </div>

                        <div class="grid grid-cols-2 gap-2">
                            <%-- Approve Button: Only visible if not already Approved --%>
                            <asp:LinkButton ID="btnApprove" runat="server"
                                Visible='<%# Eval("Status").ToString() != "Approved" %>'
                                CommandName="ApproveImage"
                                CommandArgument='<%# Eval("Id") %>'
                                CssClass="flex items-center justify-center bg-green-50 text-green-600 py-2 rounded-xl font-bold hover:bg-green-600 hover:text-white transition duration-200">
                    <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                    </svg>
                    Approve
                            </asp:LinkButton>

                            <%-- Delete Button --%>
                            <asp:LinkButton ID="btnDelete" runat="server"
                                CommandName="DeleteImage"
                                CommandArgument='<%# Eval("Id") %>'
                                OnClientClick="return confirm('Delete this image permanently?');"
                                CssClass='<%# Eval("Status").ToString() != "Approved" ? "flex items-center justify-center bg-red-50 text-red-600 py-2 rounded-xl font-bold hover:bg-red-600 hover:text-white transition duration-200" : "col-span-2 flex items-center justify-center bg-red-50 text-red-600 py-2 rounded-xl font-bold hover:bg-red-600 hover:text-white transition duration-200" %>'>
                    <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                    </svg>
                    Delete
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>

        <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="text-center py-24 bg-gray-50 rounded-3xl border-2 border-dashed border-gray-200">
            <div class="flex flex-col items-center">
                <div class="bg-gray-200 p-4 rounded-full mb-4">
                    <svg class="w-12 h-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                    </svg>
                </div>
                <h3 class="text-xl font-bold text-gray-600">No images found</h3>
                <p class="text-gray-400 max-w-xs mx-auto">Upload some photos to get your event gallery started.</p>
            </div>
        </asp:Panel>

    </div>
</asp:Content>
