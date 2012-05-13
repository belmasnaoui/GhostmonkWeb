using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GhostmonkMainSiteModel;

namespace GhostmonkEditor.Controllers
{
    [Authorize]
    public class JournalEditorController : Controller
    {
        private GhostmonkMainSiteModelContainer db = new GhostmonkMainSiteModelContainer();

        //
        // GET: /JournalEditor/

        public ViewResult Index()
        {
            return View(db.Journals.ToList());
        }

        //
        // GET: /JournalEditor/Details/5

        public ViewResult Details(int id)
        {
            Journal journal = db.Journals.Single(j => j.Id == id);
            return View(journal);
        }

        //
        // GET: /JournalEditor/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /JournalEditor/Create

        [HttpPost]
        public ActionResult Create(Journal journal)
        {
            if (ModelState.IsValid)
            {
                db.Journals.AddObject(journal);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(journal);
        }
        
        //
        // GET: /JournalEditor/Edit/5
 
        public ActionResult Edit(int id)
        {
            Journal journal = db.Journals.Single(j => j.Id == id);
            return View(journal);
        }

        //
        // POST: /JournalEditor/Edit/5

        [HttpPost]
        public ActionResult Edit(Journal journal)
        {
            if (ModelState.IsValid)
            {
                db.Journals.Attach(journal);
                db.ObjectStateManager.ChangeObjectState(journal, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(journal);
        }

        //
        // GET: /JournalEditor/Delete/5
 
        public ActionResult Delete(int id)
        {
            Journal journal = db.Journals.Single(j => j.Id == id);
            return View(journal);
        }

        //
        // POST: /JournalEditor/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Journal journal = db.Journals.Single(j => j.Id == id);
            db.Journals.DeleteObject(journal);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}