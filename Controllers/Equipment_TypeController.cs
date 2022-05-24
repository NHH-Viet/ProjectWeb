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
    public class Equipment_TypeController : Controller
    {
        private EDEN_RINGEntities db = new EDEN_RINGEntities();

        // GET: Equipment_Type
        public ActionResult Index()
        {
            bool checkuser = true;
            if (checkuser)
                return View("IndexUser",db.Equipment_Type.ToList());   
            return View(db.Equipment_Type.ToList());
        }

        // GET: Equipment_Type/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipment_Type equipment_Type = db.Equipment_Type.Find(id);
            if (equipment_Type == null)
            {
                return HttpNotFound();
            }
            return View(equipment_Type);
        }

        // GET: Equipment_Type/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Equipment_Type/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ET_ID,Type_Names")] Equipment_Type equipment_Type)
        {
            if (ModelState.IsValid)
            {
                db.Equipment_Type.Add(equipment_Type);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(equipment_Type);
        }

        // GET: Equipment_Type/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipment_Type equipment_Type = db.Equipment_Type.Find(id);
            if (equipment_Type == null)
            {
                return HttpNotFound();
            }
            return View(equipment_Type);
        }

        // POST: Equipment_Type/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ET_ID,Type_Names")] Equipment_Type equipment_Type)
        {
            if (ModelState.IsValid)
            {
                db.Entry(equipment_Type).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(equipment_Type);
        }

        // GET: Equipment_Type/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipment_Type equipment_Type = db.Equipment_Type.Find(id);
            if (equipment_Type == null)
            {
                return HttpNotFound();
            }
            return View(equipment_Type);
        }

        // POST: Equipment_Type/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Equipment_Type equipment_Type = db.Equipment_Type.Find(id);
            db.Equipment_Type.Remove(equipment_Type);
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
