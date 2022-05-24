using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using projectE.Models;

namespace projectE.Controllers
{
    public class RingsController : Controller
    {
        private EDEN_RINGEntities db = new EDEN_RINGEntities();

        // GET: Rings
        public ActionResult Index()
        {
            return View(db.Rings.ToList());
        }

        // GET: Rings/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ring ring = db.Rings.Find(id);
            if (ring == null)
            {
                return HttpNotFound();
            }
            return View(ring);
        }

        // GET: Rings/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Rings/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Ring_ID,Ring_Name,Weigth,Effect")] Ring ring)
        {
            if (ModelState.IsValid)
            {
                db.Rings.Add(ring);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(ring);
        }

        // GET: Rings/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ring ring = db.Rings.Find(id);
            if (ring == null)
            {
                return HttpNotFound();
            }
            return View(ring);
        }

        // POST: Rings/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Ring_ID,Ring_Name,Weigth,Effect")] Ring ring)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ring).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(ring);
        }

        // GET: Rings/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ring ring = db.Rings.Find(id);
            if (ring == null)
            {
                return HttpNotFound();
            }
            return View(ring);
        }

        // POST: Rings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Ring ring = db.Rings.Find(id);
            db.Rings.Remove(ring);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
