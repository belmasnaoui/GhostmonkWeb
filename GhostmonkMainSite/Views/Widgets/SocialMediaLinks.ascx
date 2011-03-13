<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<h2>Interwebs</h2>
<ul>
    <li>
        <%: Html.SocialMediaLink( "http://www.goodreads.com/ghostmonk", "goodreads", "Good Reads" )%>
    </li>
    <li>
        <%: Html.SocialMediaLink( "http://ca.linkedin.com/in/ghostmonk", "linked-in", "LinkedIn" )%>
    </li>
    <li>
        <%: Html.SocialMediaLink( "http://github.com/ghostmonk", "github", "GIT" )%>
    </li>
    <li>
        <%: Html.SocialMediaLink( "http://www.flickr.com/ghostmonk", "flickr", "Flickr" )%>
    </li>
    <li>
        <%: Html.SocialMediaLink( "http://www.facebook.com/ghostmonk", "facebook", "facebook" )%>
    </li>
    <li>
        <%: Html.SocialMediaLink( "http://www.google.com/profiles/logossuck", "google", "google" )%>
    </li>
    <li>
        <%: Html.SocialMediaLink( "http://www.last.fm/user/monasticphantom", "lastfm", "lastfm" )%>
    </li>
    <li>
        <%: Html.SocialMediaLink( "http://twitter.com/ghostmonk", "twitter", "twitter" )%>
    </li>
</ul>