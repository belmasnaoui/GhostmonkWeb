<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<GhostmonkMainSiteModel.Page>" %>

<asp:Content ID="Title" ContentPlaceHolderID="TitleContent" runat="server">
    Ghostmonk: <%: Model.Title %>
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Model.Title %></h2>

    <%: Html.Image( Model.MainImage, Model.Title ) + "<br />" %>

    <%: Server.UrlDecode( Model.Body ) %>

</asp:Content>