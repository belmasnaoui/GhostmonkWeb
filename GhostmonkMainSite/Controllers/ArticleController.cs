using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GhostmonkMainSiteModel;

namespace GhostmonkMainSite.Controllers
{
    public class ArticleController : Controller
    {
        [ChildActionOnly]
        public PartialViewResult HtmlBlogFeed()
        {
            using( var container = new GhostmonkMainSiteModelContainer() )
            {
                var entries = ( from entry in container.Articles
                                from cat in entry.Categories
                                where cat.Value == "Blog"
                                select entry ).ToList();
                entries.ForEach( article => article.Assets.ToList() );
                return PartialView( "HtmlBlogFeed", entries );
            }
        }

        public ActionResult FullArticle( string category, string linkText )
        {
            using( var container = new GhostmonkMainSiteModelContainer() )
            {
                var entries = ( from entry in container.Articles
                                from cat in entry.Categories
                                where cat.Value == category
                                select entry ).ToList();

                var target = string.IsNullOrEmpty( linkText )
                    ? entries.First()
                    : entries.Where( article => article.LinkText == linkText ).First();

                target = target ?? entries.First();
                target.Assets.ToList();

                return View( target );
            }
        }
    }
}
