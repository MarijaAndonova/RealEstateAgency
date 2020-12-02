using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateAgency.Models
{
    public class DogovorModel
    {
        public string InsertDogovor(dogovor d)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();

                db.dogovors.Add(d);
                db.SaveChanges();

                return "Договорот беше внесен успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string UpdateDogovor(int id, dogovor d)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                // Fetch object from db

                dogovor dog = db.dogovors.Find(id);
                dog.idKlient= d.idKlient;
                dog.idVraboten = d.idVraboten;
                dog.idObjekt = d.idObjekt;
                dog.notar = d.notar;


                db.SaveChanges();

                return "Договорот е модифициран успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string DeleteDogovor(int id)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                dogovor d = db.dogovors.Find(id);

                db.dogovors.Attach(d);
                db.dogovors.Remove(d);
                db.SaveChanges();

                return " Договорот е избришан успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public int GetThisDogovorId(dogovor d)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                var lista = (from t in db.dogovors
                             where t.idKlient == d.idKlient
                             where t.vraboten == d.vraboten
                             where t.objekt == d.objekt
                             where t.notar == d.notar
                             select t).FirstOrDefault();
                return lista.idDogovor;
            }
            catch
            {
                return 0;
            }
        }

        public int GetTheLastElementID()
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                var lista = (from t in db.dogovors
                             orderby t.idDogovor descending
                             select t).FirstOrDefault();
                return lista.idDogovor;
            }
            catch
            {
                return 0;
            }
        }



    }
}