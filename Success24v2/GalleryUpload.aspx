<%@ Page Title="Upload Media" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="GalleryUpload.aspx.cs" Inherits="Success24v2.GalleryUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-4xl mx-auto py-12 px-4">
        <div class="bg-white rounded-2xl shadow-sm border border-gray-200 p-8">
            <h2 class="text-3xl font-bold text-gray-800 mb-2">Upload New Media</h2>
            <p class="text-gray-500 mb-8">Files uploaded here will be sent to the moderation queue.</p>
            
            <div class="space-y-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Image Title</label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="w-full p-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-orange-500 outline-none"></asp:TextBox>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Choose File</label>
                    <asp:FileUpload ID="fuImage" runat="server" CssClass="w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-orange-50 file:text-orange-700 hover:file:bg-orange-100" />
                </div>

                <div class="pt-4 border-t border-gray-100 flex items-center justify-between">
                    <asp:Label ID="lblMsg" runat="server" CssClass="text-sm font-medium"></asp:Label>
                    <asp:Button ID="btnUpload" runat="server" Text="Submit for Approval" OnClick="btnUpload_Click" 
                                CssClass="bg-orange-600 text-white font-bold py-3 px-8 rounded-xl hover:bg-orange-700 transition shadow-lg shadow-orange-100 cursor-pointer" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>