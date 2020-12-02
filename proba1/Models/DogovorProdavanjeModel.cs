using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateAgency.Models
{
    public class DogovorProdavanjeModel
    {
        public string InsertDogovorZaProdavanje(dogovorProdavanje dp)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();

                db.dogovorProdavanjes.Add(dp);
                db.SaveChanges();

                return "Договорот за продавање беше внесен успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string UpdateDogovorZaProdavanje(int id, dogovorProdavanje dp)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                // Fetch object from db

                dogovorProdavanje dogpro = db.dogovorProdavanjes.Find(id);
                dogpro.dataOd = dp.dataOd;
                
                db.SaveChanges();

                return "Договорот за продавање е модифициран успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string DeleteDogovorZaProdavanje(int id)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                dogovorProdavanje dp = db.dogovorProdavanjes.Find(id);

                db.dogovorProdavanjes.Attach(dp);
                db.dogovorProdavanjes.Remove(dp);
                db.SaveChanges();

                return " Договорот за продавање е избришан успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }



    }
}