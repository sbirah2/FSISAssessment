using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using FSISSystem.Data.POCOs;
#endregion

namespace FSISSystem.Data.DTOs
{
    public class TeamGameStats
    {
        public string TeamName { get; set; }
        public int Wins { get; set; }
        public int Losses { get; set; }
        public int TotalGamesPlayed
        {
            get
            {
                return Wins + Losses;
            }
        }
        public List<GameStats> theGames { get; set; }
       
    }
}
