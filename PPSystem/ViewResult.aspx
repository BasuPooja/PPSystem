<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewResult.aspx.cs" Inherits="PPSystem.ViewResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page-header {
            text-align: center;
            font-weight: bold;
            color: #CC0066;
            font-size: 40px;
            margin: 20px auto;
            padding: 15px;
            border-bottom: 5px solid #CC0066;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            background: #e6f0ff;
            max-width: 80%;
        }
        .search-container {
            text-align: center;
            margin: 15px auto;
        }
        .search-box {
            padding: 8px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        .search-button {
            padding: 8px 16px;
            background-color: #0099FF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            margin-left: 5px;
        }
        .search-button:hover {
            background-color: #007acc;
        }
        .gridview {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        .gridview th, .gridview td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: center;
        }
        .gridview-header {
            background-color: #CC0066;
            color: white;
            font-weight: bold;
            font-size: 16px;
        }
        .gridview-row {
            background-color: #fff8e7;
        }
        .gridview-altrow {
            background-color: #fbe6c0;
        }
        .chart-container {
            text-align: center;
            margin: 20px auto;
            padding: 35px;
 
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-header">Result Dashboard</div>

    <div class="search-container">
        <asp:TextBox ID="SearchBox" runat="server" CssClass="search-box" placeholder="Search by UserID"></asp:TextBox>
    
        <asp:TextBox ID="TxtFromDate" runat="server" CssClass="search-box" placeholder="From Date (yyyy-mm-dd)"></asp:TextBox>
        <asp:TextBox ID="TxtToDate" runat="server" CssClass="search-box" placeholder="To Date (yyyy-mm-dd)"></asp:TextBox>
    
        <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" CssClass="search-button" />
        <asp:Button ID="BtnReset" runat="server" Text="Reset" OnClick="BtnReset_Click" CssClass="search-button" Style="background-color:#990000;" />
    </div>
    
    <div class="grid-container">
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            CssClass="gridview"
            AllowPaging="True"
            PageSize="7"
            OnPageIndexChanging="GridView1_PageIndexChanging"
            GridLines="None">

            <HeaderStyle CssClass="gridview-header" />
            <RowStyle CssClass="gridview-row" />
            <AlternatingRowStyle CssClass="gridview-altrow" />

            <Columns>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="BtnViewAnalysis" runat="server" Text="View Analysis" CssClass="search-button"
                            CommandArgument='<%# Eval("UserID") %>' OnClick="BtnViewAnalysis_Click" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="SI" HeaderText="SI" />
                <asp:BoundField DataField="UserID" HeaderText="User ID" />
                <asp:BoundField DataField="UserName" HeaderText="User Name" />
                <asp:BoundField DataField="AttemptedQstn" HeaderText="Attempted" />
                <asp:BoundField DataField="MissedQuestion" HeaderText="Missed" />
                <asp:BoundField DataField="RightAnswer" HeaderText="Right" />
                <asp:BoundField DataField="WrongAnswer" HeaderText="Wrong" />
                <asp:BoundField DataField="ObtainedMarks" HeaderText="Marks" />
                <asp:BoundField DataField="MaxMarks" HeaderText="Max Marks" />
            </Columns>
        </asp:GridView>
    </div>

    
    <div class="chart-container">
        <asp:Chart ID="Chart1" runat="server" Height="400px" Width="800px">
            <Series>
                <asp:Series Name="Series1"></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
    </div>


</asp:Content>
