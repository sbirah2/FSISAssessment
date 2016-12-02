using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#region Additonal Namespaces
using FSISSystem.BLL;
using FSISSystem.Data.POCOs;
using FSISSystem.Data.Entities;
using FSIS.UI;
using System.Collections;
using System.Data.Entity.Validation;
#endregion

public partial class Assessments_BLLProcess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CheckForException(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MessageUserControl.HandleDataBoundException(e);
    }

    protected void GamesPlayedList_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow agvrow = GamesPlayedList.Rows[GamesPlayedList.SelectedIndex];
        int homeid = int.Parse((agvrow.FindControl("HomeTeamID") as Label).Text);
        string homescore = (agvrow.FindControl("HomeTeamScore") as Label).Text;
        int visitid = int.Parse((agvrow.FindControl("VisitingTeamID") as Label).Text);
        string visitingscore = (agvrow.FindControl("VisitingTeamScore") as Label).Text;
        int gameid = int.Parse((agvrow.FindControl("GameID") as Label).Text);
        HomeTeamName.Text = agvrow.Cells[1].Text;
        HomeTeamScore.Text = "(" + homescore + ")";
        VisitingTeamName.Text = agvrow.Cells[2].Text;
        VisitingTeamScore.Text = "(" + visitingscore + ")";
        MessageUserControl.TryRun(() =>
        {
            PlayerStatController sysmgr = new PlayerStatController();
            List<PlayerGameStat> hometeamlist = sysmgr.GetTeamRosterforPlayerGameStats(homeid);
            List<PlayerGameStat> visitingteamlist = sysmgr.GetTeamRosterforPlayerGameStats(visitid);
            HomeTeamList.DataSource = hometeamlist;
            HomeTeamList.DataBind();
            VisitingTeamList.DataSource = visitingteamlist;
            VisitingTeamList.DataBind();
        });
    }

    protected void RecordStats_Click(object sender, EventArgs e)
    {
        GridViewRow agvrow = GamesPlayedList.Rows[GamesPlayedList.SelectedIndex];
        int gameid = int.Parse((agvrow.FindControl("GameID") as Label).Text);
        PlayerGameStat aPlayer = null;
        List<PlayerGameStat> hometeamlist = new List<PlayerGameStat>();
        List<PlayerGameStat> visitingteamlist = new List<PlayerGameStat>();
        MessageUserControl.TryRun(() =>
        {
            int aNumeric = 0;
            foreach (GridViewRow arow in HomeTeamList.Rows)
            {
                aPlayer = new PlayerGameStat();
                aPlayer.PlayerID = int.Parse((arow.FindControl("PlayerID") as Label).Text);
                if (string.IsNullOrEmpty((arow.FindControl("Goals") as TextBox).Text))
                {
                    aPlayer.Goals = 0;
                }
                else
                {
                    if (int.TryParse((arow.FindControl("Goals") as TextBox).Text, out aNumeric))
                    {
                        aPlayer.Goals = aNumeric;
                    }
                    else
                    {
                        throw new Exception("You have not entered a number for a Goal at some point.");
                    }
                }
                if (string.IsNullOrEmpty((arow.FindControl("Assists") as TextBox).Text))
                {
                    aPlayer.Assists = 0;
                }
                else
                {
                    if (int.TryParse((arow.FindControl("Assists") as TextBox).Text, out aNumeric))
                    {
                        aPlayer.Assists = aNumeric;
                    }
                    else
                    {
                        throw new Exception("You have not entered a number for an Assists at some point.");
                    }
                }
                aPlayer.Yellow = (arow.FindControl("YellowCard") as CheckBox).Checked;
                aPlayer.Red = (arow.FindControl("RedCard") as CheckBox).Checked;
                aPlayer.Rostered = (arow.FindControl("Rostered") as CheckBox).Checked;
                hometeamlist.Add(aPlayer);
            }

            foreach (GridViewRow arow in VisitingTeamList.Rows)
            {
                aPlayer = new PlayerGameStat();
                aPlayer.PlayerID = int.Parse((arow.FindControl("PlayerID") as Label).Text);
                if (string.IsNullOrEmpty((arow.FindControl("Goals") as TextBox).Text))
                {
                    aPlayer.Goals = 0;
                }
                else
                {
                    if (int.TryParse((arow.FindControl("Goals") as TextBox).Text, out aNumeric))
                    {
                        aPlayer.Goals = aNumeric;
                    }
                    else
                    {
                        throw new Exception("You have not entered a number for a Goal at some point.");
                    }
                }
                if (string.IsNullOrEmpty((arow.FindControl("Assists") as TextBox).Text))
                {
                    aPlayer.Assists = 0;
                }
                else
                {
                    if (int.TryParse((arow.FindControl("Assists") as TextBox).Text, out aNumeric))
                    {
                        aPlayer.Assists = aNumeric;
                    }
                    else
                    {
                        throw new Exception("You have not entered a number for an Assists at some point.");
                    }
                }
                aPlayer.Yellow = (arow.FindControl("YellowCard") as CheckBox).Checked;
                aPlayer.Red = (arow.FindControl("RedCard") as CheckBox).Checked;
                aPlayer.Rostered = (arow.FindControl("Rostered") as CheckBox).Checked;
                visitingteamlist.Add(aPlayer);
            }
            PlayerStatController sysmgr = new PlayerStatController();
            sysmgr.RecordGamePlayerStats(gameid, hometeamlist, visitingteamlist);
            HomeTeamName.Text = "";
            HomeTeamScore.Text = "";
            VisitingTeamName.Text = "";
            VisitingTeamScore.Text = "";
            HomeTeamList.DataSource = null;
            HomeTeamList.DataBind();
            VisitingTeamList.DataSource = null;
            VisitingTeamList.DataBind();
            GamesPlayedList.DataBind();
        },"Player Stat Recording","Stats have been successfully recorded for the game");
       
    }
}