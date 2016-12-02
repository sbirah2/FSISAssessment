using System;
using System.Collections.Generic;
using System.Data.Entity.Spatial;

#region Additional Namespaces
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
#endregion

namespace FSISSystem.Data.Entities
{
    [Table("PlayerStats")]
    public partial class PlayerStat
    {

        [Key]
        public int PlayerStatsID { get; set; }

        [Required(ErrorMessage ="Game is a required field")]
        public int GameID { get; set; }

        [Required(ErrorMessage = "Player is a required field")]
        public int PlayerID { get; set; }

        [Required(ErrorMessage = "Goals is a required field")]
        [Range(0.0, double.MaxValue, ErrorMessage ="Goals is a value 0 or greater.")]
        public int Goals { get; set; }

        [Required(ErrorMessage = "Assists is a required field")]
        [Range(0.0, double.MaxValue, ErrorMessage = "Assists is a value 0 or greater.")]
        public int Assists { get; set; }

        public bool YellowCard { get; set; }

        public bool RedCard { get; set; }

        //navigation properties
        public virtual Game Game { get; set; }

        public virtual Player Player { get; set; }
    }
}
