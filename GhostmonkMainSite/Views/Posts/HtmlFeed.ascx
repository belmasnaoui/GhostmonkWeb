<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GhostmonkMainSiteModel.JournalEntry>>" %>

<% foreach (var entry in Model) { %>
    
    <h1><%: entry.Title %></h1>
    
    <p><%: entry.PublishDate.ToString( "MMMM dd, yyyy" ) %></p>
    
    <%: Html.Image( entry.MainImage, entry.Title ) %>

    <%= entry.Summary ?? entry.Body.Substring( 0, 200 ) %>

    <p><%: Html.ActionLink( "Read More...", "FullPost", "Posts", new { linkText = entry.LinkText }, null ) %></p>

    <hr />

<% }  %>