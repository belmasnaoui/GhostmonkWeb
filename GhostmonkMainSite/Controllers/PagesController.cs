using System.Web.Mvc;

namespace GhostmonkMainSite.Controllers
{
    public class PagesController : Controller
    {
        public ActionResult Index() { return View(); }

        public ActionResult Inspiration() { return View(); }

        public ActionResult Mood() { return View(); }

        public ActionResult Features() { return View(); }

        public ActionResult About() { return View(); }

        public ActionResult Contact() { return View(); }
    }
}
