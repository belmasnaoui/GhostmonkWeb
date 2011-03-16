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

        public ActionResult FullPost( int id )
        {
            using( var container = new GhostmonkMainSiteModelContainer() )
            {
                return View( container.JournalEntries.Where( post => post.Id == id ).First() );
            }
        }
    }
}
