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
    
    public partial class kancelarija
    {
        public int idKancelarija { get; set; }
        public string internet { get; set; }
        public Nullable<int> idObjekt { get; set; }
    
        public virtual objekt objekt { get; set; }
    }
}