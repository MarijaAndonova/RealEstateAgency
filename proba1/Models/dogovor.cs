//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RealEstateAgency.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class dogovor
    {
        public dogovor()
        {
            this.dogovorIznajmuvanjes = new HashSet<dogovorIznajmuvanje>();
            this.dogovorProdavanjes = new HashSet<dogovorProdavanje>();
        }
    
        public int idDogovor { get; set; }
        public int idKlient { get; set; }
        public int idVraboten { get; set; }
        public int idObjekt { get; set; }
        public string notar { get; set; }
    
        public virtual klient klient { get; set; }
        public virtual objekt objekt { get; set; }
        public virtual vraboten vraboten { get; set; }
        public virtual ICollection<dogovorIznajmuvanje> dogovorIznajmuvanjes { get; set; }
        public virtual ICollection<dogovorProdavanje> dogovorProdavanjes { get; set; }
    }
}
