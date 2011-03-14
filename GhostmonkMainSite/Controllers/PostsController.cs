using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GhostmonkMainSiteModel;

namespace GhostmonkMainSite.Controllers
{
    public class PostsController : Controller
    {
        public ActionResult Index()
        {
            using( var container = new GhostmonkMainSiteModelContainer() )
            {
                ObjectSet<JournalEntry> entries = container.JournalEntries; 
                return View();
            }
        }
    }
}
