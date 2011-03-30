<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<GhostmonkMainSiteModel.Article>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Model.Title %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1><%: Model.Title %></h1>
    
    <p><%: Model.PublishDate.ToString( "MMMM dd, yyyy" ) %></p>
    
    <%
        IHtmlString link = null;
        if( Model.Assets.Count > 0 )
        {
            var image = Model.Assets.First();
            link = image.FullUri != null 
                ? Html.ThumbToFullImageLink( image.EmbedUri, image.FullUri, image.AltTag ) 
                : Html.Image( image.EmbedUri, image.AltTag ?? Model.Title );
        }
    %>

    <%= link + "<br />" %>

    <%= Model.Body %>

</asp:Content>