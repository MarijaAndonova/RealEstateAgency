using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateAgency.Models
{
    public class SopstvenikModel
    {
        public string fulname { get; set; }
        public int id { get; set; }
        

        public string InsertSopstvenik(sopstvenik s)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();

                db.sopstveniks.Add(s);
                db.SaveChanges();

                return s.ime +" "+s.prezime+ " was succesfully inserted";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string UpdateSopstvenik(int id, sopstvenik s)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                // Fetch object from db

                sopstvenik sop = db.sopstveniks.Find(id);
                sop.ime = s.ime;
                sop.prezime= s.prezime;
                sop.telefon = s.telefon;
                sop.ulica = s.ulica;
                sop.grad= s.grad;
                sop.linkSlika = s.linkSlika;
                sop.username = s.username;
                sop.password = s.password;
                sop.email = s.email;

                db.SaveChanges();

                return s.ime+ " was succesfully updated";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string DeleteSopstvenik(int id)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                sopstvenik s= db.sopstveniks.Find(id);

                db.sopstveniks.Attach(s);
                db.sopstveniks.Remove(s);
                db.SaveChanges();

                return s.ime+ " was succesfully deleted";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public bool CheckIfSopstvenikExists(string userN)
        {

            AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
            try
            {
                var data = (from c in db.sopstveniks
                            where c.username == userN
                            select c).FirstOrDefault();
                if (data != null)
                    return true;

            }
            catch
            {
                return false;
            }

            return false;
        }

        public List<SopstvenikModel> GetAllSopstveniciZaDropDown()
        {
            var lista = new List<SopstvenikModel>();
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();


                var data = (from t in db.sopstveniks
                           select t).ToList();
                //new {
                //                t.idSopstvenik,
                //                fulname = String.Format("{0} {1}", t.ime, t.prezime)};

                lista = data.Select(m => new SopstvenikModel
                {
                    id = m.idSopstvenik,
                    fulname = String.Format("{0} - {1} - {2} - {3}", m.ime, m.prezime, m.grad, m.telefon)
                }).ToList();

                return lista;
            }
            catch
            {
                return null;
            }
        }


    }
}