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

        public ActionResult Page( int id )
        {
            using( var container = new GhostmonkMainSiteModelContainer() )
            {
                Page target = container.Pages.Where( page => page.Id == id ).First();
                return View( target );
            }
        }
    }
}
