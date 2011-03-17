using System.Linq;
using System.Web.Mvc;
using GhostmonkMainSiteModel;

namespace GhostmonkMainSite.Controllers
{
    public class PostsController : Controller
    {
        [ChildActionOnly]
        public PartialViewResult HtmlPostsFeed()
        {
            using( var container = new GhostmonkMainSiteModelContainer() )
            {
                var entries = container.JournalEntries.ToList();
                return PartialView( "HtmlFeed", entries );       
            }
        }

        public ActionResult FullPost( string linkText )
        {
            using( var container = new GhostmonkMainSiteModelContainer() )
            {
                var entries = container.JournalEntries;
                var entry = string.IsNullOrEmpty( linkText ) 
                    ? entries.First() 
                    : entries.Where( post => post.LinkText == linkText ).First();
                return View( entry ?? entries.First() );
            }
        }
    }
}
