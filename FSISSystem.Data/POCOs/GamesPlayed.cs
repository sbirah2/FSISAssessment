using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FSISSystem.Data.POCOs
{
    public class GamesPlayed
    {
        public int GameID { get; set; }
        public DateTime GameDate { get;set;}
        public int HomeTeamID { get; set; }
        public string HomeTeamName { get; set; }
        public int HomeTeamScore { get; set; }
        public int VisitingTeamID { get; set; }
        public string VisitingTeamName { get; set; }
        public int VisitingTeamScore { get; set; }
    }
}
