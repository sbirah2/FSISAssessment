using System;
using System.Collections.Generic;
using System.Data.Entity.Spatial;

#region Additional Namespaces
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
#endregion

namespace FSISSystem.Data.Entities
{
    [Table("Teams")]
    public partial class Team
    {

        public Team()
        {

            Players = new HashSet<Player>();
        }

        [Key]
        public int TeamID { get; set; }

        [Required(ErrorMessage ="Team name is a required field")]
        [StringLength(50, ErrorMessage ="Team name is maximum 50 characters")]
        public string TeamName { get; set; }

        [Required(ErrorMessage = "Coach is a required field")]
        [StringLength(75, ErrorMessage = "Coach is maximum 75 characters")]
        public string Coach { get; set; }

        [Required(ErrorMessage = "Assistant Coach is a required field")]
        [StringLength(75, ErrorMessage = "Assistant Coach is maximum 75 characters")]
        public string AssistantCoach { get; set; }

        [Range(0, double.MaxValue, ErrorMessage ="Wins must be 0 or greater.")]
        public int? Wins { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "Losses must be 0 or greater.")]
        public int? Losses { get; set; }

        //navigation properties
       [InverseProperty("HomeTeam")]
       public virtual ICollection<Game> HomeGames { get; set; }

       [InverseProperty("VisitingTeam")]
        public virtual ICollection<Game> VisitingGames { get; set; }

        public virtual ICollection<Player> Players { get; set; }
    }
}
