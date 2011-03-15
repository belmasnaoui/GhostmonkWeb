<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GhostmonkMainSiteModel.JournalEntry>>" %>

<% foreach (var entry in Model) { %>
    
    <h1><%: entry.Title %></h1>
    
    <p><%: entry.PublishDate %></p>
    
    <%: Html.Image( entry.MainImage, entry.Title ) %>

    <%: entry.Body %>
    
    <hr />

<% }  %>