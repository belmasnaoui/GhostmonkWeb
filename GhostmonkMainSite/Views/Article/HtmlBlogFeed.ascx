<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GhostmonkMainSiteModel.Article>>" %>

<% foreach (var entry in Model) { %>
    
    <h1><%: Html.ActionLink( entry.Title, "FullArticle", "Article", new { linkText = entry.LinkText }, null )%></h1>
    
    <p><%: entry.PublishDate.ToString( "MMMM dd, yyyy" ) %></p>
    
    <%: Html.Image( entry.Assets.First().EmbedUri, entry.Title ) %>

    <%= entry.Summary ?? entry.Body.Substring( 0, 200 ) %>

    <p><%: Html.ActionLink( "Read More...", "FullArticle", "Article", new { linkText = entry.LinkText }, null )%></p>

    <hr />

<% }  %>