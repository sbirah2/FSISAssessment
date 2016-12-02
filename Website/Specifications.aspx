<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Specifications.aspx.cs" Inherits="Specifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--div#topicid.bobclass--%>

<%--<div id="topic" class="bob">--%>
   <%-- h1+p+(ul>li*3>lorem)+p*3+figure>figcaption--%>
    <header class="page-header">
        <img src="Images/Logo.jpg" style="float:right; width:300px; height: 135px" />
        <h1>CQRS</h1>
        <h2>
            <span class="fa-stack fa-lg">
                <i class="fa fa-github fa-stack-1x text-muted"></i>
                <i class="fa fa-ban fa-stack-2x text-danger"></i>
            </span>
            Do <u>NOT</u> Store in a Repository
        </h2>
    </header>
    <table>

    <tr>
        <td>
            Course Weight:
        </td>
        <td>
            10% &nbsp;&nbsp;<a href="MarkingRubik.aspx">Evalutation</a>
        </td>
    </tr>
     <tr>
        <td>
            Assessment Date:
        </td>
        <td>
            <asp:label ID=labelDate runat="server"> <%= DateTime.Today.ToString("MMM dd, yyyy") %></asp:label>
        </td>
    </tr>
     <tr>
        <td>
            Student Name:
        </td>
        <td>
            
        </td>
    </tr>
    </table>
    <br /><br />
    <p>
         In this assessment, you will be demonstrating your understanding of CQRS. In this assessment, you will be evaluated on the following:
     </p>   <ul>
        <li>Create controller method containing Linq to Entity calls to build a data collection for a pre-code web form.</li>
        <li>Implement a web form event which will collect entered form data and submit to a pre-code BLL business process method.</li>
        <li>Implement a BLL business process using data which has been collected from a form and submitted to the controller method for processing.</li>
    </ul>  
  
    <p>
You have been supplied a starting solution for this assessment called FSISAssessment. You are to place this folder onto your 
        machine (desktop or documents). The solution folder contains the database in a .bak (backup file) 
        called FSIS_2018.bak. The starting solution has certain portions of the assessment pre-coded. <strong>This code works and should not be altered.</strong></p>
    <p>
You are to complete each of the activities to create a successful solution to this assessment. You will need to use specified names 
        in portions of the activities to integrate with the existing code. You many need to create local variables to use in your answer (these variables can be 
        called whatever you wish). Use the following activity instructions to complete this assessment.
    </p>
    <h4>Activity 1 Setup</h4>
    <p>Restore the supplied SQL database. The database name is <strong>FSIS_2018</strong>. The database contains data for testing your solution.</p>
    <h4>Activity 2 Create Linq queries: Assessments/Query</h4>
    <h5>Query</h5>
    <p>You will need to create two queries to complete the BLL method <strong>GetTeamStatus</strong> located in the <strong>GameController</strong>. The first query should
        retrieve the Team database record that matches in incoming <strong>teamid</strong> parameter. Save this record to a variable called <strong>theTeam</strong>. 
        The second query should retrieve the games (home or visiting) for the incoming <strong>teamid</strong> parameter. Use the POCO class <strong>GameStat</strong> 
        to hold the data for the collection of games. Save this data collection to a variable called <strong>teamGames</strong>. 
    </p>
     <center>
            <figure>
        <img src="Images/GamesForTeamQuery.png" width="800"/>
        <figcaption>Display of the results for Query Assessment</figcaption>
    </figure>
     </center>
    <h4>Activity 3 WebForm: Assessments/PageEventHandler</h4>
    <p>In the <strong>PageEventHandler.aspx.cs</strong>'s <strong>RecordGame_Click()</strong> method, you are to collect data from the web page form controls and submit the collected data to the BLL controller method <strong>RecordGame</strong> located in the 
        <strong>GameController</strong>. Use the entity <strong>Game</strong> to hold the collected data. Obtain the date from the calendar control (.SelectedDate); ensure that
        teams were selected in the dropdownlists; ensure that scores were entered; and do error handling using MessageUserControl. Validation messages can use 
        <strong>MessageUserControl.ShowInfo()</strong>.
    </p>
    
    <p> The MessageUserControl will handle the success message. View the <strong>RecordStats_Click</strong> event located in the <strong>BLLProcess.aspx.cs</strong> web form 
        code behind to see how to setup the success message in your event. </p>
    <div style="float: left; margin-left:120px">
            <figure>
        <img src="Images/RecordGameResultsValidation.png" width="400"/>
        <figcaption>Display of the invalid data submission</figcaption>
    </figure>
     </div>
     <div style="float: left; margin-left:20px">
            <figure>
        <img src="Images/RecordGameResultsSuccess.png" width="400"/>
        <figcaption>Display of the successful game recording</figcaption>
    </figure>
   </div>
    <div style="clear:both">&nbsp;</div>
        <h4>Activity 4 BLL Business Process: Assessments/BLLProcess</h4>
    <p> You are to complete the code for the BLL method <strong>RecordGamePlayerStats</strong> located in the controller <strong>PlayerStatController</strong>. The method  
        recieves 3 parameters: gameid, data collection of the home team players, and data collection of the visiting team players. All work in the method is to be done 
        as a <strong>single transaction</strong> A query has been done to determine if the game stats have already been entered. Note: <strong>Only</strong> players who have actually 
        played in the game (Act. is checked) will be in the data collection for the team players.
    </p>
    <p>Check the results of the query to decide whether to process the data or issue an appropriate error message. If you are to process the data, each team will need to be processed.
        When processing the team data, for each player: (a) update the <strong>GamesPlayed</strong> property on the player's <strong>Player</strong> record, incrementing by 1; (b) if the player had a goal, assist, yellow card, or red card
        then create a <strong>PlayerStat</strong> record for that player and add it to the database.
    </p>
    <center>
            <figure>
        <img src="/Images/PlayerGameStats.png" width="800"/>
        <figcaption>Display of entering player stats for a game.</figcaption>
    </figure></center>
       
  


    <%--</div>--%>
</asp:Content>
