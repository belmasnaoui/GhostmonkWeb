<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<GhostmonkMainSiteModel.Article>" %>

<asp:Content ID="Title" ContentPlaceHolderID="TitleContent" runat="server">
    Ghostmonk: <%: Model.Title %>
</asp:Content>

<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Model.Title %></h2>

    <%  if( Model.Assets.Count > 0 ) { %>
            <%= Html.Image( Model.Assets.First().Uri, Model.Title ) + "<br />" %>
    <% } %>

    <%= Server.UrlDecode( Model.Body ) %>

</asp:Content>