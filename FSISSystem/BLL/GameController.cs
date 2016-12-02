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
using FSISSystem.Data.DTOs;
#endregion

namespace FSISSystem.BLL
{
    [DataObject]
    public class GameController
    {
      
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public TeamGameStats GetTeamStatus(int teamid)
        {
            using (var context = new FSISContext())
            {
                TeamGameStats results = null;
                Team theTeam = null;
                List<GameStats> teamGames = null;

                //TODO: place your code after the comments

                /* Code a Linq query which will retrieve the team
                 * matching the incoming teamid parameter.
                 * Save the results in a variable called theTeam
                 */

                //Your code goes here
                theTeam = (from x in context.Teams
                           where x.TeamID == teamid
                           select x).FirstOrDefault();

                //new Team
                //{
                //    TeamName = x.TeamName,
                //    Coach = x.Coach,
                //    AssistantCoach = x.AssistantCoach,
                //    Wins = x.Wins,
                //    Losses = x.Losses
                //}).FirstOrDefault();


                /* code a Linq query which will retrieve all games
                 * played by the incoming teamid parameter.
                 * Use the POCO GameStats to define your saved 
                 * data collection.
                 * Save the results in a variable called teamGames
                 */

                //Your code goes here
                teamGames = (from y in context.Games
                             where y.HomeTeamID == teamid || y.VisitingTeamID == teamid
                             select new GameStats
                             {
                                 DatePlayed = y.GameDate,
                                 HomeTeam = y.HomeTeam.TeamName,
                                 HomeScore = y.HomeTeamScore,
                                 VisitingTeam = y.VisitingTeam.TeamName,
                                 VisitingScore = y.VisitingTeamScore,
                             }).ToList();

                if (theTeam != null)
                {
                    results = new TeamGameStats()
                    {
                        TeamName = theTeam.TeamName,
                        Wins = theTeam.Wins.HasValue ? (int)theTeam.Wins : 0,
                        Losses = theTeam.Losses.HasValue ? (int)theTeam.Losses : 0,
                        theGames = teamGames
                    };
                }
                return results;
            } 
                                   
           
        }//eom

        public void RecordGame(Game item)
        {
            if (item.HomeTeamID == item.VisitingTeamID)
            {
                throw new Exception("Home and Visiting teams cannot be be the same.");
            }


            using (var context = new FSISContext())
            {
                context.Games.Add(item);
                Team hometeam = (from x in context.Teams
                                 where x.TeamID == item.HomeTeamID
                                 select x).FirstOrDefault();
                Team visitingteam = (from x in context.Teams
                                     where x.TeamID == item.VisitingTeamID
                                     select x).FirstOrDefault();
                if (item.HomeTeamScore > item.VisitingTeamScore)
                {
                    hometeam.Wins += 1;
                    visitingteam.Losses += 1;
                    context.Entry(hometeam).Property(y => y.Wins).IsModified = true;
                    context.Entry(visitingteam).Property(y => y.Losses).IsModified = true;
                }
                else
                {
                    hometeam.Losses += 1;
                    visitingteam.Wins += 1;
                    context.Entry(hometeam).Property(y => y.Losses).IsModified = true;
                    context.Entry(visitingteam).Property(y => y.Wins).IsModified = true;
                }
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<GamesPlayed> GetGamesPlayed()
        {
            using (var context = new FSISContext())
            {
                var results = from x in context.Games
                              orderby x.GameDate
                              where x.PlayerStats.Count == 0
                              select new GamesPlayed
                              {
                                  GameID = x.GameID,
                                  GameDate = x.GameDate,
                                  HomeTeamID = x.HomeTeamID,
                                  HomeTeamName = x.HomeTeam.TeamName,
                                  HomeTeamScore = x.HomeTeamScore,
                                  VisitingTeamID = x.VisitingTeamID,
                                  VisitingTeamName = x.VisitingTeam.TeamName,
                                  VisitingTeamScore = x.VisitingTeamScore
                              };
                return results.ToList();
            }
        }
    }
}
