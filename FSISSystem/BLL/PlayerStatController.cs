using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel;
using FSISSystem.DAL;
using FSISSystem.Data.Entities;
using FSISSystem.Data.POCOs;
#endregion

namespace FSISSystem.BLL
{
    public class PlayerStatController
    {
        
        public void RecordGamePlayerStats(int gameid, List<PlayerGameStat> hometeam, List<PlayerGameStat> visitingteam)
        {
            using (var context = new FSISContext())
            {
                var gameexists = (from x in context.PlayerStats
                                  where x.GameID == gameid
                                  select x).Count();
                /*
                 * if the game does not exist (count is 0) record the player stats for each team.
                 * if the game does exist, throw an error message.
                 * All work must be done as a single transaction.
                 * 
                 * For each player in the data collection (Home or Visiting):
                 *  a) increment the GamesPlayed on the Player record by 1.
                 *  b) if the player has a goal, assist, a yellow card, or a red card
                 *     create a PlayerStat record for that player.
                 */
               

                //Your code goes here

            }
        }
        public List<PlayerGameStat> GetTeamRosterforPlayerGameStats(int teamid)
        {
            using (var context = new FSISContext())
            {
                var results = from x in context.Players
                              where x.TeamID == teamid
                              orderby x.LastName, x.FirstName
                              select new PlayerGameStat
                              {
                                  PlayerID = x.PlayerID,
                                  PlayerName = x.LastName + ", " + x.FirstName,
                                  Rostered = true
                              };
                return results.ToList();
            }
        }
    }
}
