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
    public class UserEditorController : Controller
    {
        private GhostmonkMainSiteModelContainer db = new GhostmonkMainSiteModelContainer();

        //
        // GET: /UserEditor/

        public ViewResult Index()
        {
            var users = db.Users.Include("CV");
            return View(users.ToList());
        }

        //
        // GET: /UserEditor/Details/5

        public ViewResult Details(int id)
        {
            User user = db.Users.Single(u => u.Id == id);
            return View(user);
        }

        //
        // GET: /UserEditor/Create

        public ActionResult Create()
        {
            ViewBag.Id = new SelectList(db.CVs, "Id", "City");
            return View();
        } 

        //
        // POST: /UserEditor/Create

        [HttpPost]
        public ActionResult Create(User user)
        {
            if (ModelState.IsValid)
            {
                db.Users.AddObject(user);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.Id = new SelectList(db.CVs, "Id", "City", user.Id);
            return View(user);
        }
        
        //
        // GET: /UserEditor/Edit/5
 
        public ActionResult Edit(int id)
        {
            User user = db.Users.Single(u => u.Id == id);
            ViewBag.Id = new SelectList(db.CVs, "Id", "City", user.Id);
            return View(user);
        }

        //
        // POST: /UserEditor/Edit/5

        [HttpPost]
        public ActionResult Edit(User user)
        {
            if (ModelState.IsValid)
            {
                db.Users.Attach(user);
                db.ObjectStateManager.ChangeObjectState(user, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id = new SelectList(db.CVs, "Id", "City", user.Id);
            return View(user);
        }

        //
        // GET: /UserEditor/Delete/5
 
        public ActionResult Delete(int id)
        {
            User user = db.Users.Single(u => u.Id == id);
            return View(user);
        }

        //
        // POST: /UserEditor/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            User user = db.Users.Single(u => u.Id == id);
            db.Users.DeleteObject(user);
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