<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PageEventHandler.aspx.cs" Inherits="Assessments_PageEventHandler" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="jumbotron">
        <h1>Record Game Results</h1>
    </div>
    <div class="row">
        <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
    </div>
    <div class="row">
        <div class="col-sm-3">
            <asp:Calendar ID="GameCalendar" runat="server"></asp:Calendar>
        </div>
        <div class="col-sm-6">
            <h2>Home:</h2>
            <asp:DropDownList ID="HomeList" runat="server" 
                DataSourceID="TeamListODS" 
                DataTextField="DisplayText" 
                DataValueField="PFKeyIdentifier"
                 AppendDataBoundItems="true">
                <asp:ListItem Value="0">Select team</asp:ListItem>
            </asp:DropDownList>&nbsp;&nbsp;
            <asp:TextBox ID="HomeScore" runat="server" Width="50"></asp:TextBox><br />
            <h2>Vistors:</h2>
            <asp:DropDownList ID="VisitorList" runat="server" 
                DataSourceID="TeamListODS" 
                DataTextField="DisplayText" 
                DataValueField="PFKeyIdentifier"
                AppendDataBoundItems="true">
                <asp:ListItem Value="0">Select team</asp:ListItem>
            </asp:DropDownList>&nbsp;&nbsp;
            <asp:TextBox ID="VisitorScore" runat="server" Width="50"></asp:TextBox><br /><br />
            <asp:Button ID="RecordGame" runat="server" Text="Record Game" CssClass="btn btn-primary" OnClick="RecordGame_Click" />
        </div>
        
    </div>
    <asp:ObjectDataSource ID="TeamListODS" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="Get_TeamList" 
        TypeName="FSISSystem.BLL.TeamController"
        OnSelected="CheckForException">
    </asp:ObjectDataSource>
</asp:Content>

