<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GhostmonkMainSiteModel.JournalEntry>>" %>

<% foreach (var entry in Model) { %>
    
    <h1><%: entry.Title %></h1>
    
    <p><%: entry.PublishDate %></p>
    
    <%: Html.Image( entry.MainImage, entry.Title ) %>

    <% if( entry.Summary == null ) { %>
       
       <%= entry.Body.Substring( 0, 200 ) %>
        
    <% } else { %>
        
        <%= entry.Summary %>

    <% } %>

    <%: Html.ActionLink( "Read More...", "FullPost", "Posts", new { id = entry.Id }, null ) %>

    <hr />

<% }  %>