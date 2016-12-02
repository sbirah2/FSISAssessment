using System;
using System.Collections.Generic;

using System.Data.Entity.Spatial;

#region Additional Namespaces
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
#endregion

namespace FSISSystem.Data.Entities
{
    [Table("Guardians")]
    public partial class Guardian
    {

        public Guardian()
        {
            Players = new HashSet<Player>();
        }

        [Key]
        public int GuardianID { get; set; }

        [Required(ErrorMessage ="First Name is a required field")]
        [StringLength(50,ErrorMessage ="First Name has a maximum length of 50 characters")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last Name is a required field")]
        [StringLength(50, ErrorMessage = "Last Name has a maximum length of 50 characters")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Emergency PhoneNumber is a required field")]
        [StringLength(10, ErrorMessage = "Emergency PhoneNumber has a maximum length of 10 characters")]
        public string EmergencyPhoneNumber { get; set; }

        [Required(ErrorMessage = "Email Address is a required field")]
        [StringLength(75, ErrorMessage = "Email Address has a maximum length of 75 characters")]
        public string EmailAddress { get; set; }

        //navigation properties
        public virtual ICollection<Player> Players { get; set; }
    }
}
