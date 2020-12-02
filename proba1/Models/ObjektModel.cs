using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateAgency.Models
{
    public class ObjektModel
    {
        public string fulname { get; set; }
        public int id { get; set; }
        public string InsertObjekt(objekt o)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();

                db.objekts.Add(o);
                db.SaveChanges();

                return "Објектот беше внесен успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string UpdateObjekt(int id, objekt o)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                // Fetch object from db

                objekt obj = db.objekts.Find(id);
                obj.ulica = o.ulica;
                obj.grad = o.grad;
                obj.sobi = o.sobi;
                obj.urlMapa = o.urlMapa;
                obj.kvadratura = o.kvadratura;
                obj.linkSliki = o.linkSliki;
                obj.idSopstvenik = o.idSopstvenik;


                db.SaveChanges();

                return "Објектот е модифициран успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string DeleteObjekt(int id)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                objekt o = db.objekts.Find(id);

                db.objekts.Attach(o);
                db.objekts.Remove(o);
                db.SaveChanges();

                return " Објектот е избришан успешно";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public List<objekt> GetAllObjekti()
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                List<objekt> lista = new List<objekt>();

                lista = (from t in db.objekts
                         select t).ToList();
                return lista;
            }
            catch
            {
                return null;
            }
        }

        public int GetThisObjektId(objekt o)
        {
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();
                var lista = (from t in db.objekts
                             where t.ulica == o.ulica
                             where t.grad == o.grad
                             where t.sobi == o.sobi
                             where t.kvadratura == o.kvadratura
                             where t.linkSliki == o.linkSliki
                             where t.idSopstvenik == o.idSopstvenik
                             select t).FirstOrDefault();
                return lista.idObjekt;
            }
            catch
            {
                return 0;
            }
        }

        public List<ObjektModel> GetAllObjektiZaDropDown()
        {
            var lista = new List<ObjektModel>();
            try
            {
                AgencijaZaNEdvizniniEntities db = new AgencijaZaNEdvizniniEntities();


                var data = (from t in db.objekts
                            select t).ToList();
                //new {
                //                t.idSopstvenik,
                //                fulname = String.Format("{0} {1}", t.ime, t.prezime)};

                lista = data.Select(m => new ObjektModel
                {
                    id = m.idObjekt,
                    fulname = String.Format("{0} - {1} - {2} - {3}", m.ulica, m.grad, m.sobi, m.kvadratura)
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