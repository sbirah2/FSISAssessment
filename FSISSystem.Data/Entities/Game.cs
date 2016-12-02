
using System;
using System.Collections.Generic;

using System.Data.Entity.Spatial;

#region Additional Namespaces
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
#endregion

namespace FSISSystem.Data.Entities
{
    [Table("Games")]
    public partial class Game
    {

        public Game()
        {
            PlayerStats = new HashSet<PlayerStat>();
        }
        [Key]
        public int GameID { get; set; }

        [Required(ErrorMessage = "Game Date is a required field")]
        public DateTime GameDate { get; set; }

        [Required(ErrorMessage ="Home Team is a required field")]
        public int HomeTeamID { get; set; }

        [Required(ErrorMessage = "Visiting Team is a required field")]
        public int VisitingTeamID { get; set; }

        [Required(ErrorMessage = "Home Team score is a required field")]
        [Range(0.0,double.MaxValue,ErrorMessage ="Home Team score must be 0 or greater.")]
        public int HomeTeamScore { get; set; }

        [Required(ErrorMessage = "Visiting Team score is a required field")]
        [Range(0.0, double.MaxValue, ErrorMessage = "Visiting Team score must be 0 or greater.")]
        public int VisitingTeamScore { get; set; }

        //Navigation properties
        [ForeignKey("HomeTeamID")]
        public virtual Team HomeTeam { get; set; }

        [ForeignKey("VisitingTeamID")]
        public virtual Team VisitingTeam { get; set; }

        public virtual ICollection<PlayerStat> PlayerStats { get; set; }
    }
}
