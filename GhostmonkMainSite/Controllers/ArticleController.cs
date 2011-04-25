using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using GhostmonkMainSiteModel;

namespace GhostmonkMainSite.Controllers
{
    public class ArticleController : Controller
    {
        private const int POSTS_PER_PAGE = 10;

        [ChildActionOnly]
        public PartialViewResult HtmlBlogFeed( int? page )
        {
            using( var container = new GhostmonkMainSiteModelContainer() )
            {
                var query = container.Articles
                    .SelectMany( entry => entry.Categories, ( entry, cat ) => new { entry, cat } )
                    .Where( @t => @t.cat.Value == "Blog" );
                    
                int pageCount = (query.Count()  - 1) / POSTS_PER_PAGE;
                int start = ( page ?? 0 ) * POSTS_PER_PAGE;
                start = Math.Min( start, pageCount );

                var records = query.OrderByDescending( @t => @t.entry.PublishDate )
                    .Select( @t => @t.entry ).Skip( start ).Take( POSTS_PER_PAGE ).ToList();
                
                records.ForEach( article => article.Assets.ToList() );
                
                return PartialView( "HtmlBlogFeed", records );
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
