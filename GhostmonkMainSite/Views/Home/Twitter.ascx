<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<LinqToTwitter.Status>" %>

<p><%= TweetParser.ParseTweet( Model.Text ) %></p>