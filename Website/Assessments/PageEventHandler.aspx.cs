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
public partial class Assessments_PageEventHandler : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CheckForException(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MessageUserControl.HandleDataBoundException(e);
    }

    protected void RecordGame_Click(object sender, EventArgs e)
    {
        /*
         * You will code logic within this event to:
         * a)obtain the date from the Calendar control
         * b)ensure a Home and Visiting team were selected
         * c)ensure a Home and Visiting score was entered
         * d)pass the collected data to the GameController.RecordGame method.
         * e)use the MessageUserControl to handle error/information messages to the user.
         * f)use the class Game to hold the collected data for processing
         */


        //Your code goes here
        MessageUserControl.TryRun(() =>
        {
            if (string.IsNullOrEmpty(HomeList.Text))
            {
                MessageUserControl.ShowInfo("Select the Home Team Name");
            }
            if (string.IsNullOrEmpty(VisitorList.Text))
            {
                MessageUserControl.ShowInfo("Select the Visitor Team Name");
            }
           
            else
            {
                MessageUserControl.TryRun(() =>
                {
                    GameController sysmgr = new GameController();
                    Game results = new Game();
                    
                    results.HomeTeamScore = int.Parse(HomeScore.Text);
                    results.VisitingTeamScore = int.Parse(VisitorScore.Text);
                    results.GameDate = Convert.ToDateTime(GameCalendar);

                });
            }
        });
    }
}