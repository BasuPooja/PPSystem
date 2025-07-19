<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="StudentAnalysis.aspx.cs" Inherits="PPSystem.StudentAnalysis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .analysis-container {
            max-width: 95%;
            margin: 20px auto;
            text-align: center;
        }

        .student-info {
            background: #f9f9f9;
            border: 2px solid #cc0066;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 16px;
            font-weight: bold;
            color: #333;
        }

        .chart-container {
            margin: 30px auto;
            width: 90%;
            text-align: center;
        }

        .gridview {
            border-collapse: collapse;
            width: 100%;
            margin-top: 15px;
        }

        .gridview th, .gridview td {
            padding: 8px;
            border: 1px solid #ddd;
        }

        .gridview-header {
            background-color: #cc0066;
            color: white;
            font-weight: bold;
        }

        .gridview-row {
            background-color: #fff8e7;
        }

        .gridview-altrow {
            background-color: #fbe6c0;
        }

        .download-button {
            margin-top: 20px;
            padding: 10px 20px;
            background: #0099ff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .download-button:hover {
            background: #007acc;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="analysis-container">
        <div class="student-info" id="StudentInfo" runat="server">
            Student Analysis
        </div>

        <div class="chart-container">
            <asp:Chart ID="ChartStudent" runat="server" Width="900px" Height="400px">
                <Series>
                    <asp:Series Name="Marks" ChartType="Column"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>

        <asp:GridView ID="GridStudentResults" runat="server"
            AutoGenerateColumns="False"
            CssClass="gridview"
            GridLines="None"
            AllowPaging="true"
            PageSize="10">
            <Columns>
                <asp:BoundField DataField="SI" HeaderText="SI" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" />
                <asp:BoundField DataField="UserName" HeaderText="Name" />
                <asp:BoundField DataField="AttemptedQstn" HeaderText="Attempted" />
                <asp:BoundField DataField="MissedQuestion" HeaderText="Missed" />
                <asp:BoundField DataField="RightAnswer" HeaderText="Right" />
                <asp:BoundField DataField="WrongAnswer" HeaderText="Wrong" />
                <asp:BoundField DataField="ObtainedMarks" HeaderText="Marks" />
                <asp:BoundField DataField="MaxMarks" HeaderText="Max Marks" />
                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd MMM yyyy}" />
            </Columns>
            <HeaderStyle CssClass="gridview-header" />
            <RowStyle CssClass="gridview-row" />
            <AlternatingRowStyle CssClass="gridview-altrow" />
        </asp:GridView>

        <asp:Button ID="BtnDownload" runat="server" Text="Download PDF Report" CssClass="download-button" OnClick="BtnDownload_Click" />
    </div>
</asp:Content>
