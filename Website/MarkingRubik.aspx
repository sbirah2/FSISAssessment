<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MarkingRubik.aspx.cs" Inherits="MarkingRubik" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="pageheader">CQRS <small>Evaluation Key and Rubik</small></h1>
    <style>
        table tr th {
            background-color: darkgreen;
            color: white;
        }
    </style>

<<<<<<< HEAD
            </tr>
           
            <tr>
                <td><strong>Complete the controller class method: GameController.GetTeamStatus()</strong></td>
                <td></td>
                
            </tr>
             <tr>
                <td> Query for theTeam information</td>
                <td>1</td>
                
            </tr>
             <tr>
                <td>Query for theGames information (filtering on match for home and visiting teams)</td>
                <td>2</td>
                
            </tr>
             <tr>
                <td><strong>Complete the page event: Assessments_PageEventHandler.RecordGame_Click()</strong></td>
                <td></td>
                
            </tr>
               <tr>
                <td>Checks for and informs user of missing input</td>
                <td>2</td>
                
            </tr>
            <tr>
                <td>Instantiates Game object with data from the form</td>
                <td>2</td>
               
            </tr>
            <tr>
                <td>Sends Game object to BLL for processing</td>
                <td>1</td>
               
            </tr>
            <tr>
                <td>Performs all processing through the MessageUserControl.TryRun() method including success message.</td>
                <td>1</td>
               
            </tr>
            <tr>
                <td><strong>Complete the controller method: PlayerStatController.RecordGamePlayerStats()</strong></td>
                <td></td>
               
            </tr>
             <tr>
                <td>Validates game does not exists</td>
                <td>1</td>
               
            </tr>
             <tr>
                <td>Updates GamesPlayed for players</td>
                <td>1</td>
               
            </tr>
            <tr>
                <td>Records goals/assists/yellow card/red card stats</td>
                <td>1</td>
               
            </tr>
            <tr>
                <td>Does not record information for players who have no stats to record</td>
                <td>1</td>
                
            </tr>
              <tr>
                <td>Processes all Home and Visiting team players</td>
                <td>2</td>
                
            </tr>
             <tr>
                <td>Processes everything as a single transaction</td>
                <td>3</td>
                
            </tr>
            <tr style="background-color:darkgray">
                <td>Total</td>
                <td>18</td>
               
            </tr>
        </table>
        </p>
    <p> <table align="center" style="width: 50%" border="1">
            <tr style="background-color:darkgray">
                <td style="width=10%">Mark</td>
                <td>Breakdown</td>
               
            </tr>
            <tr>
                <td>1</td>
                <td>1 = Proficient (requirement is done)<br />
	0 = Incomplete ( requirement not done)
</td>
               
            </tr>
            <tr>
                <td>2</td>
                <td>2 = Proficient (requirement is done)<br />
	1 = Limited  ( requirement is not done, minor errors)<br />
	0 = Incomplete ( requirement poorly done, missing large portions)
=======
    <div class="row">
>>>>>>> origin/master

        <div class="col-md-6">
            <table border="1">
                <tr style="background-color: darkgray">
                    <td valign="top">Evaluation Item</td>
                    <td>Max<br />
                        Mark</td>
                </tr>
                <tr>
                    <th colspan="2">GameController.GetTeamStatus()</th>
                </tr>
                <tr>
                    <td>Query for <code>theTeam</code> information</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Query for <code>teamGames</code> information (filtering on match on home and visiting teams)</td>
                    <td>2</td>
                </tr>
                <tr>
                    <th colspan="2">Assessments_PageEventHandler.RecordGame_Click()</th>
                </tr>
                <tr>
                    <td>Checks for and informs user of missing input</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>Instantiates <strong>Game</strong> object with data from form</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>Sends <strong>Game</strong> object to BLL for processing</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Performs all processing through the <strong>MessageUserControl.TryRun()</strong> method</td>
                    <td>1</td>
                </tr>
                <tr>
                    <th colspan="2">PlayerStatController.RecordGamePlayerStats()</th>
                </tr>
                <tr>
                    <td>Throws exception if game does not exist</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Updates <strong>GamesPlayed</strong> for players</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Records goals/assists/cards</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Does not record players who have no stats to record</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td>Processes all Home and Visiting team players</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>Processes everything as a <strong><u>single</u></strong> transaction</td>
                    <td>3</td>
                </tr>

                <tr style="background-color: darkgray">
                    <td>Total</td>
                    <td>18</td>

                </tr>
            </table>
        </div>
        <div class="col-md-6">
            <table border="1">
                <tr style="background-color: darkgray">
                    <td style="width=10%">Mark</td>
                    <td>Breakdown</td>

                </tr>
                <tr>
                    <td>1</td>
                    <td>1 = Proficient (requirement is done)<br />
                        0 = Incomplete ( requirement not done)
                    </td>

                </tr>
                <tr>
                    <td>2</td>
                    <td>2 = Proficient (requirement is done)<br />
                        1 = Limited  ( requirement is not done, minor errors)<br />
                        0 = Incomplete ( requirement poorly done, missing large portions)

                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>3 = Proficient (requirement is done)<br />
                        2 = Capable (requirement is not done, minor errors)<br />
                        1 = Limited  ( requirement is not done, major errors)<br />
                        0 = Incomplete ( requirement poorly done, missing large portions)<br />
                    </td>
                </tr>

            </table>
        </div>
    </div>
</asp:Content>
