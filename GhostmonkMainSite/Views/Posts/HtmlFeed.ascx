<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GhostmonkMainSiteModel.JournalEntry>>" %>

<% foreach (var entry in Model)
{
    var title = entry.Title;
    var body = entry.Body;
    var date = entry.PublishDate;
    var mainImage = entry.MainImage;
       
}  %>