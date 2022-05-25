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
    public class Armor_infoController : Controller
    {
        private EDEN_RINGEntities db = new EDEN_RINGEntities();

        // GET: Armor_info
        public ActionResult Index()
        {
            var armor_info = db.Armor_info.Include(a => a.Equipment_Type);
            return View(armor_info.ToList());
        }

        // GET: Armor_info/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Armor_info armor_info = db.Armor_info.Find(id);
            if (armor_info == null)
            {
                return HttpNotFound();
            }
            return View(armor_info);
        }

        // GET: Armor_info/Create
        public ActionResult Create()
        {
            ViewBag.ET_ID = new SelectList(db.Equipment_Type, "ET_ID", "Type_Names");
            return View();
        }

        // POST: Armor_info/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "A_ID,A_Name,Inmunity,Robustness,Focus,Vitality,Poise,Phy_guard,Phy_slash,Phy_strike,Phy_thurst,Mag_guard,Fie_guard,Light_guard,Holy_guard,Weigth,ET_ID")] Armor_info armor_info)
        {
            if (ModelState.IsValid)
            {
                db.Armor_info.Add(armor_info);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ET_ID = new SelectList(db.Equipment_Type, "ET_ID", "Type_Names", armor_info.ET_ID);
            return View(armor_info);
        }

        // GET: Armor_info/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Armor_info armor_info = db.Armor_info.Find(id);
            if (armor_info == null)
            {
                return HttpNotFound();
            }
            ViewBag.ET_ID = new SelectList(db.Equipment_Type, "ET_ID", "Type_Names", armor_info.ET_ID);
            return View(armor_info);
        }

        // POST: Armor_info/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "A_ID,A_Name,Inmunity,Robustness,Focus,Vitality,Poise,Phy_guard,Phy_slash,Phy_strike,Phy_thurst,Mag_guard,Fie_guard,Light_guard,Holy_guard,Weigth,ET_ID")] Armor_info armor_info)
        {
            if (ModelState.IsValid)
            {
                db.Entry(armor_info).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ET_ID = new SelectList(db.Equipment_Type, "ET_ID", "Type_Names", armor_info.ET_ID);
            return View(armor_info);
        }

        // GET: Armor_info/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Armor_info armor_info = db.Armor_info.Find(id);
            if (armor_info == null)
            {
                return HttpNotFound();
            }
            return View(armor_info);
        }

        // POST: Armor_info/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Armor_info armor_info = db.Armor_info.Find(id);
            db.Armor_info.Remove(armor_info);
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
