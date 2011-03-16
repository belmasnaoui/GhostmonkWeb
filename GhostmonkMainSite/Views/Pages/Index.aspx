<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Head" ContentPlaceHolderID="TitleContent" runat="server">
    Ghostmonk Information Hub
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <% Html.RenderAction( "HtmlPostsFeed", "Posts" ); %>

</asp:Content>
