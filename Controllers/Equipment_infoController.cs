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
    public class Equipment_infoController : Controller
    {
        private EDEN_RINGEntities db = new EDEN_RINGEntities();

        // GET: Equipment_info
      
        static Dictionary<string, string> checkUser()
        {
            bool checkuser = true;

            Dictionary<string, string> MyDic = new Dictionary<string, string>();
      
            if (checkuser)
            {
              
                MyDic.Add("layout", "~/Views/Shared/_LayoutUser.cshtml");
                MyDic.Add("isUser", true.ToString());
                return MyDic;
            }

            else
            {
                MyDic.Add("layout", "~/Views/Shared/_LayoutAdmin.cshtml");
                MyDic.Add("isUser", false.ToString());
                return MyDic;
               
            }
        }
        public ActionResult Index()
         
        {
            ViewBag.check = checkUser()["layout"];
            ViewBag.isUser = checkUser()["isUser"];

            /*int id = null;
            ViewBag.check = checkUser()["layout"];
            ViewBag.isUser = checkUser()["isUser"];


            if (id == null)
                id = 1;
            var equipment_info = db.Equipment_info.Include(e => e.Equipment_Type).Where(a => a.ET_ID == id.ToString());

            ViewBag.typeName = db.Equipment_Type.First(i => i.ET_ID == id.ToString()).Type_Names;

            return View(equipment_info.ToList());*/
            return View(db.Equipment_info.ToList());
        }

        // GET: Equipment_info/Details/5
        public ActionResult Details(string id)
        {
            ViewBag.check = checkUser()["layout"];

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipment_info equipment_info = db.Equipment_info.Find(id);
            if (equipment_info == null)
            {
                return HttpNotFound();
            }
            return View(equipment_info);
        }

        // GET: Equipment_info/Create
        public ActionResult Create()
        {
            ViewBag.ET_ID = new SelectList(db.Equipment_Type, "ET_ID", "Type_Names");
            return View();
        }

        // POST: Equipment_info/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,Weigth,Scl_Str,Scl_Dex,Scl_Int,Scl_Fai,Scl_Arc,R_Scl_Str,R_Scl_Dex,R_Scl_Int,R_Scl_Fai,R_Scl_Arc,SKill_Cost,ET_ID")] Equipment_info equipment_info)
        {
            if (ModelState.IsValid)
            {
                db.Equipment_info.Add(equipment_info);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ET_ID = new SelectList(db.Equipment_Type, "ET_ID", "Type_Names", equipment_info.ET_ID);
            return View(equipment_info);
        }

        // GET: Equipment_info/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipment_info equipment_info = db.Equipment_info.Find(id);
            if (equipment_info == null)
            {
                return HttpNotFound();
            }
            ViewBag.ET_ID = new SelectList(db.Equipment_Type, "ET_ID", "Type_Names", equipment_info.ET_ID);
            return View(equipment_info);
        }

        // POST: Equipment_info/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "E_ID,E_Name,Phy_dame,Phy_guard,Mag_dame,Mag_guard,Fire_dame,Fire_guard,Ligh_dame,Ligh_guard,Holy_dame,Holy_guard,Critboot,Guardboot,Weigth,Scl_Str,Scl_Dex,Scl_Int,Scl_Fai,Scl_Arc,R_Scl_Str,R_Scl_Dex,R_Scl_Int,R_Scl_Fai,R_Scl_Arc,SKill_Cost,ET_ID")] Equipment_info equipment_info)
        {
            if (ModelState.IsValid)
            {
                db.Entry(equipment_info).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ET_ID = new SelectList(db.Equipment_Type, "ET_ID", "Type_Names", equipment_info.ET_ID);
            return View(equipment_info);
        }

        // GET: Equipment_info/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipment_info equipment_info = db.Equipment_info.Find(id);
            if (equipment_info == null)
            {
                return HttpNotFound();
            }
            return View(equipment_info);
        }

        // POST: Equipment_info/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Equipment_info equipment_info = db.Equipment_info.Find(id);
            db.Equipment_info.Remove(equipment_info);
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
