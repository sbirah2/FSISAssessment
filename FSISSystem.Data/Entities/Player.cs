
using System;
using System.Collections.Generic;
using System.Data.Entity.Spatial;

#region Additional Namespaces
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
#endregion

namespace FSISSystem.Data.Entities
{
    [Table("Players")]
    public partial class Player
    {

        public Player()
        {
            PlayerStats = new HashSet<PlayerStat>();
        }

        [Key]
        public int PlayerID { get; set; }

        [Required(ErrorMessage ="Guardian is a required field")]
        public int GuardianID { get; set; }

        [Required(ErrorMessage = "Team is a required field")]
        public int TeamID { get; set; }

        [Required(ErrorMessage = "First Name is a required field")]
        [StringLength(50, ErrorMessage = "First Name has a maximum length of 50 characters")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last Name is a required field")]
        [StringLength(50, ErrorMessage = "Last Name has a maximum length of 50 characters")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Age is a required field")]
        [Range(6.0,14.0,ErrorMessage ="Players are age 6 to 14")]
        public int Age { get; set; }

        [Required(ErrorMessage = "Gender is a required field")]
        [StringLength(1, ErrorMessage ="Gender is M or F")]
        [RegularExpression("[mfMF]",ErrorMessage ="Gender is M or F")]
        public string Gender { get; set; }

        [Required(ErrorMessage = "Alberta HealthCareNumber is a required field")]
        [StringLength(10, ErrorMessage = "Alberta HealthCareNumber is 10 characters", MinimumLength =10)]
        public string AlbertaHealthCareNumber { get; set; }

        [StringLength(250, ErrorMessage = "Medical Alert Details allows for 250 characters.")]
        public string MedicalAlertDetails { get; set; }

        [Required(ErrorMessage = "Games played is a required field")]
        [Range(0.0, double.MaxValue, ErrorMessage = "Games played is a value o ro greater.")]
        public int GamesPlayed { get; set; }

        //navigation properties
        public virtual Guardian Guardian { get; set; }

        public virtual ICollection<PlayerStat> PlayerStats { get; set; }

        public virtual Team Team { get; set; }
    }
}
