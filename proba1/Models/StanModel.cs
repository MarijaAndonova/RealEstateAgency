using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateAgency.Models
{
    public class StanModel
    {
        public string InsertStan(stan s)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();

                db.stans.Add(s);
                db.SaveChanges();

                return "Станот беше внесен успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string UpdateStan(int id, stan s)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                // Fetch object from db

                stan st = db.stans.Find(id);
                st.sprat = s.sprat;
                st.parno = s.parno;
                st.parking = s.parking;
                
                db.SaveChanges();

                return "Станот е модифициран успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string DeleteStan(int id)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                stan s = db.stans.Find(id);

                db.stans.Attach(s);
                db.stans.Remove(s);
                db.SaveChanges();

                return " Објектот е избришан успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }


    }
}