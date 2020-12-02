using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateAgency.Models
{
    public class VrabotenModel
    {
        public string fulname { get; set; }
        public int id { get; set; }

        public string InsertVraboten(vraboten v)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();

                db.vrabotens.Add(v);
                db.SaveChanges();

                return v.ime + " " + v.prezime + " was succesfully inserted";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string UpdateVraboten(int id, vraboten v)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                // Fetch object from db

                vraboten vra = db.vrabotens.Find(id);
                vra.ime = v.ime;
                vra.prezime = v.prezime;
                vra.telefon = v.telefon;
                vra.pozicija = v.pozicija;
                vra.procentPoDogovor = v.procentPoDogovor;
                vra.dataVrabotuvanje = v.dataVrabotuvanje;
                vra.plata = v.plata;
                vra.ulica = v.ulica;
                vra.grad = v.grad;
                vra.linkSlika = v.linkSlika;
                vra.username = v.username;
                vra.password = v.password;
                vra.email = v.email;

                db.SaveChanges();

                return v.ime + " was succesfully updated";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string DeleteVraboten(int id)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                vraboten v = db.vrabotens.Find(id);

                db.vrabotens.Attach(v);
                db.vrabotens.Remove(v);
                db.SaveChanges();

                return v.ime + " was succesfully deleted";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public bool CheckIfVrabotenExists(string userN)
        {

            AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
            try
            {
                var data = (from c in db.vrabotens
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

        public List<VrabotenModel> GetAllVraboteniZaDropDown()
        {
            var lista = new List<VrabotenModel>();
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();


                var data = (from t in db.vrabotens
                            select t).ToList();
                //new {
                //                t.idSopstvenik,
                //                fulname = String.Format("{0} {1}", t.ime, t.prezime)};

                lista = data.Select(m => new VrabotenModel
                {
                    id = m.idVraboten,
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