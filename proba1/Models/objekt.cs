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
    
    public partial class objekt
    {
        public objekt()
        {
            this.dogovors = new HashSet<dogovor>();
            this.kancelarijas = new HashSet<kancelarija>();
            this.kukjas = new HashSet<kukja>();
            this.stans = new HashSet<stan>();
        }
    
        public int idObjekt { get; set; }
        public string ulica { get; set; }
        public string grad { get; set; }
        public string sobi { get; set; }
        public string urlMapa { get; set; }
        public int kvadratura { get; set; }
        public string linkSliki { get; set; }
        public Nullable<int> idSopstvenik { get; set; }
    
        public virtual ICollection<dogovor> dogovors { get; set; }
        public virtual ICollection<kancelarija> kancelarijas { get; set; }
        public virtual ICollection<kukja> kukjas { get; set; }
        public virtual sopstvenik sopstvenik { get; set; }
        public virtual ICollection<stan> stans { get; set; }
    }
}
