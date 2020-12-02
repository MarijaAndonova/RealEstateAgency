using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateAgency.Models
{
    public class KlientModel
    {
        public string fulname { get; set; }
        public int id { get; set; }

        public string InsertKlient(klient k)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();

                db.klients.Add(k);
                db.SaveChanges();

                return k.ime + " " + k.prezime + " was succesfully inserted";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string UpdateKlient(int id, klient k)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                // Fetch object from db

                klient kli = db.klients.Find(id);
                kli.ime = k.ime;
                kli.prezime = k.prezime;
                kli.telefon = k.telefon;
                kli.email = k.email;
                kli.ulica = k.ulica;
                kli.grad = k.grad;
                kli.link_slika = k.link_slika;
                kli.username = k.username;
                kli.password = k.password;


                db.SaveChanges();

                return k.ime + " was succesfully updated";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string DeleteKlient(int id)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                klient k = db.klients.Find(id);

                db.klients.Attach(k);
                db.klients.Remove(k);
                db.SaveChanges();

                return k.ime + " was succesfully deleted";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public bool CheckIfKlientExists(string userN)
        {

            AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
            try
            {
                var data = (from c in db.klients
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


        public List<KlientModel> GetAllKlientiZaDropDown()
        {
            var lista = new List<KlientModel>();
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();


                var data = (from t in db.klients
                            select t).ToList();
                //new {
                //                t.idSopstvenik,
                //                fulname = String.Format("{0} {1}", t.ime, t.prezime)};

                lista = data.Select(m => new KlientModel
                {
                    id = m.idKlient,
                    fulname = String.Format("{0} - {1} - {2} - {3}", m.ime, m.prezime, m.grad, m.telefon)
                }).ToList();

                return lista;
            }
            catch
            {
                return null;
            }
        }

        //public bool CheckUser(string s)
        //{
        //    try
        //    {
        //        AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();

        //        var data = (from t in db.klients
        //                    where t.username == s
        //                    select t).ToList();
        //        return true;
        //    }
        //    catch (Exception e)
        //    {
        //        return false;
        //    }
        //}

    }
}