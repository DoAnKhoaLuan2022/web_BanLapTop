//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoAnAdmin.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class returnProduct
    {
        public int id { get; set; }
        public Nullable<int> id_order { get; set; }
        public string reason { get; set; }
        public string nameImage { get; set; }
        public string tt { get; set; }
    
        public virtual Order Order { get; set; }
    }
}