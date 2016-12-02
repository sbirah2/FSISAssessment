<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BLLProcess.aspx.cs" Inherits="Assessments_BLLProcess" %>

<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="jumbotron">
        <h1>Record Game Player Stats</h1>
    </div>
    <div class="row">
        <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
    </div>
    <div class="row">
        <div class="col-sm-4" style="font-size: .8em;">
        <asp:GridView ID="GamesPlayedList" runat="server" AutoGenerateColumns="False" 
            DataSourceID="GamesPlayedListODS" GridLines="Horizontal"
             OnSelectedIndexChanged="GamesPlayedList_SelectedIndexChanged">
            <Columns>  
                 <asp:BoundField DataField="GameDate" HeaderText="GameDate" SortExpression="GameDate" DataFormatString="{0:MMM dd, yyyy}"></asp:BoundField>
                 <asp:BoundField DataField="HomeTeamName" HeaderText="HomeTeamName" SortExpression="HomeTeamName"></asp:BoundField> 
                 <asp:BoundField DataField="VisitingTeamName" HeaderText="VisitingTeamName" SortExpression="VisitingTeamName"></asp:BoundField>
                <asp:CommandField SelectText="View" ShowSelectButton="True"></asp:CommandField>
                 <asp:TemplateField SortExpression="GameID">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("GameID") %>' ID="GameID" Visible="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
             
                <asp:TemplateField SortExpression="HomeTeamID">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("HomeTeamID") %>' ID="HomeTeamID" Visible="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="HomeTeamScore">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("HomeTeamScore") %>' ID="HomeTeamScore" Visible="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="VisitingTeamID">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("VisitingTeamID") %>' ID="VisitingTeamID" Visible="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
              <asp:TemplateField SortExpression="VisitingTeamScore">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("VisitingTeamScore") %>' ID="VisitingTeamScore" Visible="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="GamesPlayedListODS" runat="server" 
            OldValuesParameterFormatString="original_{0}"
             SelectMethod="GetGamesPlayed" 
            TypeName="FSISSystem.BLL.GameController"
             OnSelected="CheckForException"></asp:ObjectDataSource>

        </div>
  
        <div class="col-sm-4" style="font-size: .8em;">
            <asp:Label ID="HomeTeamName" runat="server" ></asp:Label>&nbsp;&nbsp; 
            <asp:Label ID="HomeTeamScore" runat="server" ></asp:Label>
            <asp:Label ID="HomeTeamID" runat="server" visible="false"></asp:Label>
           
            <br />
            <asp:GridView ID="HomeTeamList" runat="server" GridLines="None" AutoGenerateColumns="false">
                  <Columns>
                <asp:TemplateField >
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("PlayerID") %>' ID="PlayerID" Visible="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="PlayerName" HeaderText="Player" ></asp:BoundField>
                <asp:TemplateField HeaderText="Goals">
                    <ItemTemplate>
                        <asp:TextBox runat="server" ID="Goals" Width="50px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Assists">
                    <ItemTemplate>
                        <asp:TextBox runat="server" ID="Assists" Width="50px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Yellow">
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="YellowCard" Width="50px"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Red">
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="RedCard" Width="50px"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Act.">
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="Rostered" Width="50px" Checked='<%# Eval("Rostered") %>'></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
        </div>

         <div class="col-sm-4" style="font-size: .8em;">
            <asp:Label ID="VisitingTeamName" runat="server" ></asp:Label>&nbsp;&nbsp; 
            <asp:Label ID="VisitingTeamScore" runat="server" ></asp:Label>
            <asp:Label ID="VisitingTeamID" runat="server" visible="false"></asp:Label><br />
            <asp:GridView ID="VisitingTeamList" runat="server" GridLines="None" AutoGenerateColumns="false">
                  <Columns>
                <asp:TemplateField >
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("PlayerID") %>' ID="PlayerID" Visible="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="PlayerName" HeaderText="Player" ></asp:BoundField>
                <asp:TemplateField HeaderText="Goals">
                    <ItemTemplate>
                        <asp:TextBox runat="server" ID="Goals" Width="40px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Assists">
                    <ItemTemplate>
                        <asp:TextBox runat="server" ID="Assists" Width="40px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Yellow">
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="YellowCard" Width="50px"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Red">
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="RedCard" Width="40px"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Act.">
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="Rostered" Width="40px" Checked='<%# Eval("Rostered") %>'></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="container">
    <div class="row">
        <div class="col-md-offset-7 col-md-1">

            <asp:Button ID="RecordStats" runat="server" Text="Record Game Stats" CssClass="btn btn-primary" OnClick="RecordStats_Click" />

        </div>
    </div>

    </div>
</asp:Content>

