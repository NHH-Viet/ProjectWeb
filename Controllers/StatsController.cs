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
    public class StatsController : Controller
    {
        private EDEN_RINGEntities db = new EDEN_RINGEntities();

        // GET: Stats
        public ActionResult Index()
        {
            return View(db.Stats.ToList());
        }
        public ActionResult Vigor()
        {
            return View(db.Stats.ToList());
        }

        public ActionResult Mind()
        {
            return View(db.Stats.ToList());
        }

        public ActionResult Endurance()
        {
            return View(db.Stats.ToList());
        }

        public ActionResult Strength()
        {
            return View(db.Stats.ToList());
        }

        public ActionResult Dexterity()
        {
            return View(db.Stats.ToList());
        }

        public ActionResult Intelligence()
        {
            return View(db.Stats.ToList());
        }

        public ActionResult Faith()
        {
            return View(db.Stats.ToList());
        }

        public ActionResult Arcane()
        {
            return View(db.Stats.ToList());
        }

        // GET: Stats/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Stat stat = db.Stats.Find(id);
            if (stat == null)
            {
                return HttpNotFound();
            }
            return View(stat);
        }

        // GET: Stats/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Stats/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Stat_ID,HP,FP,Stamina,Eload,Phy_def,Mag_def,Holy_def,Arc_vita")] Stat stat)
        {
            if (ModelState.IsValid)
            {
                db.Stats.Add(stat);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(stat);
        }

        // GET: Stats/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Stat stat = db.Stats.Find(id);
            if (stat == null)
            {
                return HttpNotFound();
            }
            return View(stat);
        }

        // POST: Stats/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Stat_ID,HP,FP,Stamina,Eload,Phy_def,Mag_def,Holy_def,Arc_vita")] Stat stat)
        {
            if (ModelState.IsValid)
            {
                db.Entry(stat).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(stat);
        }

        // GET: Stats/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Stat stat = db.Stats.Find(id);
            if (stat == null)
            {
                return HttpNotFound();
            }
            return View(stat);
        }

        // POST: Stats/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Stat stat = db.Stats.Find(id);
            db.Stats.Remove(stat);
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
