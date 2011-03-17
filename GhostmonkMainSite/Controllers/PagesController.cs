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
                Page target = container.Pages.Where( page => page.LinkText == linkText ).First();
                return View( target );
            }
        }
    }
}
