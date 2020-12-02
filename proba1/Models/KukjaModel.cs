using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateAgency.Models
{
    public class KukjaModel
    {
        public string InsertKukja(kukja k)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();

                db.kukjas.Add(k);
                db.SaveChanges();

                return "Куќата е внесена успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string UpdateKukja(int id, kukja k)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                // Fetch object from db

                kukja ku = db.kukjas.Find(id);
                ku.KVADRATURADVOR = k.KVADRATURADVOR;

                db.SaveChanges();

                return "Куќата е модифицирана успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string DeleteKukja(int id)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                kukja ku = db.kukjas.Find(id);

                db.kukjas.Attach(ku);
                db.kukjas.Remove(ku);
                db.SaveChanges();

                return " Куќата е избришана успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public int getLastObjectId()
        {
            ObjektModel om = new ObjektModel();

            return 0;
        }
    }
}