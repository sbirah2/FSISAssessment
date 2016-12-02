using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FSISSystem.Data.POCOs
{
    public class GameStats
    {
        public DateTime DatePlayed { get; set; }
        public string HomeTeam { get; set; }
        public int HomeScore { get; set; }
        public string VisitingTeam { get; set; }
        public int VisitingScore { get; set; }
    }
}
