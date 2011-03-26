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
                var entries = container.Articles.Where( article => article.Category.Id == 4 ).ToList();
                entries.ForEach( entry => entry.Assets.ToList() );
                return PartialView( "HtmlFeed", entries );
            }
        }

        public ActionResult FullPost( string linkText )
        {
            using( var container = new GhostmonkMainSiteModelContainer() )
            {
                var entries = container.Articles;
                var entry = string.IsNullOrEmpty( linkText ) 
                    ? entries.First()
                    : entries.Where( article => article.LinkText == linkText ).First();

                entry = entry ?? entries.First();
                var images = entry.Assets.ToList();
                return View( entry );
            }
        }
    }
}
