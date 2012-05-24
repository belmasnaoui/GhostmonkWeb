using System.Data;
using System.Linq;
using System.Web.Mvc;
using GhostmonkMainSiteModel;

namespace GhostmonkEditor.Controllers
{
    [Authorize]
    public class JournalEditorController : Controller
    {
        private readonly GhostmonkMainSiteModelContainer db = new GhostmonkMainSiteModelContainer();

        public ViewResult Index()
        {
            return View( db.Journals.ToList() );
        }

        public ViewResult Details( int id )
        {
            Journal journal = db.Journals.Single( j => j.Id == id );
            return View( journal );
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create( Journal journal )
        {
            if( ModelState.IsValid )
            {
                db.Journals.AddObject( journal );
                db.SaveChanges();
                return RedirectToAction( "Index" );
            }

            return View( journal );
        }

        public ActionResult Edit( int id )
        {
            Journal journal = db.Journals.Single( j => j.Id == id );
            return View( journal );
        }

        [HttpPost]
        public ActionResult Edit( Journal journal )
        {
            if( ModelState.IsValid )
            {
                db.Journals.Attach( journal );
                db.ObjectStateManager.ChangeObjectState( journal, EntityState.Modified );
                db.SaveChanges();
                return RedirectToAction( "Index" );
            }
            return View( journal );
        }

        public ActionResult Delete( int id )
        {
            Journal journal = db.Journals.Single( j => j.Id == id );
            return View( journal );
        }

        [HttpPost, ActionName( "Delete" )]
        public ActionResult DeleteConfirmed( int id )
        {
            Journal journal = db.Journals.Single( j => j.Id == id );
            db.Journals.DeleteObject( journal );
            db.SaveChanges();
            return RedirectToAction( "Index" );
        }

        protected override void Dispose( bool disposing )
        {
            db.Dispose();
            base.Dispose( disposing );
        }
    }
}