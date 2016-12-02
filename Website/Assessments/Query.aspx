<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Query.aspx.cs" Inherits="Assessments_Query" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   
     <div class="jumbotron">
         <h1>Season Games for Team</h1>
    </div>
    <div class="row">
        <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
    </div>
    <div class="row">
        <div class="col-sm-3">
            <asp:DropDownList ID="TeamList" runat="server"
                AppendDataBoundItems="true" 
                DataSourceID="TeamListODS" 
                DataTextField="DisplayText" 
                DataValueField="PFKeyIdentifier">
                <asp:ListItem Value="0">Select a team</asp:ListItem>
            </asp:DropDownList><br /><br />
              <asp:Button ID="GetGamesforTeam" runat="server" Text="Get Games for Team" CssClass="btn btn-primary"/>
        </div>
        <div class="col-sm-6">
            <h2>Games Played</h2>
            <asp:Repeater ID="GameList" runat="server" DataSourceID="GameListODS">
                <ItemTemplate>
                    Team: <%# Eval("TeamName") %> &nbsp;&nbsp;
                    Wins: <%# Eval("Wins") %> &nbsp;&nbsp;
                    Losses: <%# Eval("Losses") %> &nbsp;&nbsp;
                    Total Games Played: <%# Eval("TotalGamesPlayed") %>
                    <br /><br />
                    <asp:GridView ID="GameResultsList" runat="server" GridLines="Horizontal"
                        BorderStyle="None" DataSource='<%# Eval("theGames") %>' 
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                     <asp:Label runat="server"
                                    Text='<%# string.Format("{0:MMM dd, yyyy}", Eval("DatePlayed")) %>'>
                                     </asp:Label>&nbsp;&nbsp;
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Home">
                                <ItemTemplate>
                                    <asp:Label runat="server" 
                                        Text='<%# Eval("HomeTeam")  %>'>
                                    </asp:Label>&nbsp;&nbsp;
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                  <ItemTemplate>
                                    <asp:Label runat="server" 
                                        Text='<%# Eval("HomeScore")  %>'>
                                    </asp:Label>&nbsp;&nbsp;
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Visitor">
                                 <ItemTemplate>
                                    <asp:Label runat="server" 
                                        Text='<%# Eval("VisitingTeam")  %>'>
                                    </asp:Label>&nbsp;&nbsp;
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                 <ItemTemplate>
                                    <asp:Label runat="server" 
                                        Text='<%# Eval("VisitingScore")  %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            No data to report at this time.
                        </EmptyDataTemplate>
                    </asp:GridView>
                </ItemTemplate>
            </asp:Repeater>
          
        </div>
        
    </div>
    <asp:ObjectDataSource ID="TeamListODS" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="Get_TeamList" 
        TypeName="FSISSystem.BLL.TeamController"
        OnSelected="CheckForException">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="GameListODS" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetTeamStatus" 
        TypeName="FSISSystem.BLL.GameController"
         OnSelected="CheckForException">
        <SelectParameters>
            <asp:ControlParameter ControlID="TeamList" PropertyName="SelectedValue" 
                Name="teamid" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

