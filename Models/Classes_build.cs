//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace projectE.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Classes_build
    {
        public string Build_ID { get; set; }
        public string User_ID { get; set; }
        public string Class_ID { get; set; }
        public string Head_ID { get; set; }
        public string Chest_ID { get; set; }
        public string Hand_ID { get; set; }
        public string Leg_ID { get; set; }
        public string Left_hand1_ID { get; set; }
        public string Left_hand2_ID { get; set; }
        public string Left_hand3_ID { get; set; }
        public string Right_hand1_ID { get; set; }
        public string Right_hand2_ID { get; set; }
        public string Right_hand3_ID { get; set; }
        public string Ring1_ID { get; set; }
        public string Ring2_ID { get; set; }
        public string Ring3_ID { get; set; }
        public string Ring4_ID { get; set; }
        public short Levels { get; set; }
        public short Vigor { get; set; }
        public short Mind { get; set; }
        public short Endurance { get; set; }
        public short Strength { get; set; }
        public short Dex { get; set; }
        public short Intell { get; set; }
        public short Fai { get; set; }
        public Nullable<bool> HienThi { get; set; }
    
        public virtual Armor_info Armor_info { get; set; }
        public virtual Armor_info Armor_info1 { get; set; }
        public virtual Armor_info Armor_info2 { get; set; }
        public virtual Armor_info Armor_info3 { get; set; }
        public virtual Class Class { get; set; }
        public virtual Equipment_info Equipment_info { get; set; }
        public virtual Equipment_info Equipment_info1 { get; set; }
        public virtual Equipment_info Equipment_info2 { get; set; }
        public virtual Equipment_info Equipment_info3 { get; set; }
        public virtual Equipment_info Equipment_info4 { get; set; }
        public virtual Equipment_info Equipment_info5 { get; set; }
        public virtual Ring Ring { get; set; }
        public virtual Ring Ring1 { get; set; }
        public virtual Ring Ring2 { get; set; }
        public virtual Ring Ring3 { get; set; }
        public virtual User User { get; set; }
    }
}
