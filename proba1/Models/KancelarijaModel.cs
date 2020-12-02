using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateAgency.Models
{
    public class KancelarijaModel
    {

        public string InsertKancelarija(kancelarija k)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();

                db.kancelarijas.Add(k);
                db.SaveChanges();

                return "Канцеларијата е внесена успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string UpdateKancelarija(int id, kancelarija k)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                // Fetch object from db

                kancelarija ka = db.kancelarijas.Find(id);
                ka.internet = k.internet;

                db.SaveChanges();

                return "Канцеларијата е модифицирана успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string DeleteKancelarija(int id)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                kancelarija k = db.kancelarijas.Find(id);

                db.kancelarijas.Attach(k);
                db.kancelarijas.Remove(k);
                db.SaveChanges();

                return " Канцеларијата е избришана успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }
    }
}