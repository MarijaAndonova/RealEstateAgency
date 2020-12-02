using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateAgency.Models
{
    public class TipNaDogovorModel
    {
        public string InsertTipNaDogovor(tip_na_dogovor s)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();

                db.tip_na_dogovor.Add(s);
                db.SaveChanges();

                return s.Tip + " беше внесен успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string UpdateTipNaDogovor(int id, tip_na_dogovor s)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                // Fetch object from db

                tip_na_dogovor tipD = db.tip_na_dogovor.Find(id);
                tipD.Tip = s.Tip;

                db.SaveChanges();

                return s.Tip + " е модифициран успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string DeleteTipNaDogovor(int id)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                tip_na_dogovor s = db.tip_na_dogovor.Find(id);

                db.tip_na_dogovor.Attach(s);
                db.tip_na_dogovor.Remove(s);
                db.SaveChanges();

                return s.Tip + " е избришан успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }


    }
}