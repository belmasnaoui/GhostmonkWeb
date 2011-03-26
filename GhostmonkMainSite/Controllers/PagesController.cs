using System.Linq;
using System.Web.Mvc;
using GhostmonkMainSiteModel;

namespace GhostmonkMainSite.Controllers
{
    public class PagesController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Page( string linkText )
        {
            using( var container = new GhostmonkMainSiteModelContainer() )
            {
                Article target = container.Articles.Where( article => article.LinkText == linkText ).First();
                var images = target.Assets.ToList();
                return View( target );
            }
        }
    }
}
