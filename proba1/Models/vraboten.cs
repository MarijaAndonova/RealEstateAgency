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
    
    public partial class vraboten
    {
        public vraboten()
        {
            this.dogovors = new HashSet<dogovor>();
        }
    
        public int idVraboten { get; set; }
        public string ime { get; set; }
        public string prezime { get; set; }
        public string telefon { get; set; }
        public string pozicija { get; set; }
        public Nullable<int> procentPoDogovor { get; set; }
        public Nullable<System.DateTime> dataVrabotuvanje { get; set; }
        public int plata { get; set; }
        public string linkSlika { get; set; }
        public string ulica { get; set; }
        public string grad { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string email { get; set; }
    
        public virtual ICollection<dogovor> dogovors { get; set; }
    }
}
