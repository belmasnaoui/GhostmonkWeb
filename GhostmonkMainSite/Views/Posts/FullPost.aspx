<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<GhostmonkMainSiteModel.Article>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Model.Title %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1><%: Model.Title %></h1>
    
    <p><%: Model.PublishDate.ToString( "MMMM dd, yyyy" ) %></p>
    
    <%: Html.Image( Model.Assets.First().Uri, Model.Title ) %>

    <%= Model.Body %>

</asp:Content>