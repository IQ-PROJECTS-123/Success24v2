<%@ Page Title="" Language="C#" MasterPageFile="~/24.Master" AutoEventWireup="true" CodeBehind="SuccessStory.aspx.cs" Inherits="Success24v2.SuccessStory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-7xl mx-auto px-6 py-8">
        <div class="flex items-center justify-between mb-6">
            <div>
                <h1 class="text-3xl font-bold text-slate-900">Success Stories</h1>
                <p class="text-sm text-gray-600">Real alumni placed across companies.</p>
            </div>
            <div class="text-right">
                <div class="text-sm text-gray-500">Total Success</div>
                <div class="text-2xl font-bold text-orange-500">
                    <asp:Literal runat="server" ID="_LiteralSuccess"></asp:Literal>
                </div>
            </div>
        </div>

        <div id="cardsGrid" class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-[22px]">
            <asp:Literal runat="server" ID="Literal1"></asp:Literal>
        </div>

        <div class="mt-8">
            <div class="text-sm text-gray-600">
                Practitioners: <span class="font-semibold text-slate-900"><asp:Literal runat="server" ID="_LiteralPrac"></asp:Literal></span>
            </div>
        </div>
    </div>
</asp:Content>