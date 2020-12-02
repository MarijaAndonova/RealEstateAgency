using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateAgency.Models
{
    public class DogovorIznajmuvanjeModel
    {

        public string InsertDogovorZaIznajmuvanje(dogovorIznajmuvanje di)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();

                db.dogovorIznajmuvanjes.Add(di);
                db.SaveChanges();

                return "Договорот за изнајмување беше внесен успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string UpdateDogovorZaIznajmuvanje(int id, dogovorIznajmuvanje di)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                // Fetch object from db

                dogovorIznajmuvanje dogIz = db.dogovorIznajmuvanjes.Find(id);
                dogIz.dataOd = di.dataOd;
                dogIz.dataDo= di.dataDo;
                db.SaveChanges();

                return "Договорот за изнајмување е модифициран успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string DeleteDogovorZaIznajmuvanje(int id)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                dogovorIznajmuvanje di = db.dogovorIznajmuvanjes.Find(id);

                db.dogovorIznajmuvanjes.Attach(di);
                db.dogovorIznajmuvanjes.Remove(di);
                db.SaveChanges();

                return " Договорот за изнајмување е избришан успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }
    }
}