using System.Data;
using System.Linq;
using System.Web.Mvc;
using GhostmonkMainSiteModel;
using Microsoft.Security.Application;

namespace GhostmonkEditor.Controllers
{
    [Authorize]
    public class ArticleEditorController : Controller
    {
        private readonly GhostmonkMainSiteModelContainer db = new GhostmonkMainSiteModelContainer();

        public ViewResult Index()
        {
            return View( db.Articles.ToList() );
        }

        public ViewResult Details( int id )
        {
            Article article = db.Articles.Single( a => a.Id == id );
            return View( article );
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create( Article article )
        {
            if( ModelState.IsValid )
            {
                article.Body = Sanitizer.GetSafeHtml( article.Body );
                db.Articles.AddObject( article );
                db.SaveChanges();
                return RedirectToAction( "Index" );
            }

            return View( article );
        }

        public ActionResult Edit( int id )
        {
            Article article = db.Articles.Single( a => a.Id == id );
            return View( article );
        }

        [HttpPost]
        public ActionResult Edit( Article article )
        {
            if( ModelState.IsValid )
            {
                article.Body = Sanitizer.GetSafeHtml( article.Body );
                db.Articles.Attach( article );
                db.ObjectStateManager.ChangeObjectState( article, EntityState.Modified );
                db.SaveChanges();
                return RedirectToAction( "Index" );
            }
            return View( article );
        }

        public ActionResult Delete( int id )
        {
            Article article = db.Articles.Single( a => a.Id == id );
            return View( article );
        }

        [HttpPost, ActionName( "Delete" )]
        public ActionResult DeleteConfirmed( int id )
        {
            Article article = db.Articles.Single( a => a.Id == id );
            db.Articles.DeleteObject( article );
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