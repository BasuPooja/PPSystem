<%@ Page Title="View Aptitude Questions" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewApptitudeQstn.aspx.cs" Inherits="PPSystem.ViewApptitudeQstn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .page-title {
            max-width: 80%;
            text-align: center;
            color: #CC0066;
            font-weight: bold;
            font-size: 48px;
            margin: 40px auto 20px auto;
            padding: 20px;
            border-bottom: 5px solid #CC0066;
            border-radius: 12px;
            background: #8dc0fa;
            box-shadow: 0 6px 16px rgba(0,0,0,0.12);
        }

        .toolbar-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            margin: 20px auto;
            gap: 10px;
        }

        .label-questiontype {
            font-weight: bold;
            font-size: 15pt;
        }

        .dropdown-questiontype,
        .search-box {
            width: 220px;
            height: 34px;
            font-size: 14px;
            padding: 4px 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .search-button,
        .reset-button {
            padding: 8px 14px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: white;
            background-color: #0066cc;
            transition: background-color 0.2s ease;
        }

        .reset-button {
            background-color: #990000;
        }

        .search-button:hover {
            background-color: #004999;
        }

        .reset-button:hover {
            background-color: #660000;
        }

        .header-image {
            display: block;
            margin: 20px auto;
            width: 80%;
            max-width: 600px;
            border: 2px ridge #990033;
        }

        .gridview-custom {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        .gridview-header {
            background-color: #CC0066;
            color: white;
            font-weight: bold;
            font-size: 16px;
            text-align: center;
        }

        .gridview-row {
            background-color: #fffcce;
            text-align: center;
        }

        .gridview-altrow {
            background-color: #dfdba3;
            text-align: center;
        }

        .gridview-footer {
            background-color: #990000;
            color: white;
            font-weight: bold;
        }

        .pager {
            background-color: #FFCC66;
            text-align: center;
        }

        .gridview th, .gridview td {
            padding: 8px;
            border: 1px solid #ddd;
        }

        .no-records {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Title -->
    <h1 class="page-title">APTITUDE QUESTIONS</h1>

    <!-- Toolbar: Question Type, Search, Reset -->
    <div class="toolbar-container">
        <asp:Label ID="Label5" runat="server" CssClass="label-questiontype" Text="Question Type:"></asp:Label>
        <asp:DropDownList ID="TBQType" runat="server" CssClass="dropdown-questiontype" AutoPostBack="True" OnSelectedIndexChanged="TBQType_SelectedIndexChanged">
            <asp:ListItem>--Select--</asp:ListItem>
            <asp:ListItem>Mathematics</asp:ListItem>
            <asp:ListItem>English</asp:ListItem>
            <asp:ListItem>Logical Reasoning</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TxtSearch" runat="server" CssClass="search-box" placeholder="Search by Question"></asp:TextBox>

        <asp:Button ID="BtnFilter" runat="server" Text="Search" OnClick="BtnFilter_Click" CssClass="search-button" />
        <asp:Button ID="BtnReset" runat="server" Text="Reset" OnClick="BtnReset_Click" CssClass="reset-button" />
    </div>

    <!-- GridView -->
    <asp:GridView ID="GridView2" runat="server"
        CssClass="gridview-custom"
        AutoGenerateColumns="False"
        CellPadding="6"
        ForeColor="#333333"
        GridLines="None"
        PageSize="10"
        AllowPaging="True"
        AllowSorting="True"
        DataKeyNames="QuestionID"
        BorderColor="#990033"
        BorderStyle="Inset"
        EmptyDataText="<span class='no-records'>No questions found.</span>"
        OnPageIndexChanging="GridView2_PageIndexChanging">

        <AlternatingRowStyle CssClass="gridview-altrow" />
        <RowStyle CssClass="gridview-row" />
        <HeaderStyle CssClass="gridview-header" />
        <FooterStyle CssClass="gridview-footer" />
        <PagerStyle CssClass="pager" HorizontalAlign="Center" />

        <Columns>
            <asp:BoundField DataField="Q_Type" HeaderText="Question Type" SortExpression="Q_Type" />
            <asp:BoundField DataField="QuestionID" HeaderText="Question ID" ReadOnly="True" SortExpression="QuestionID" />
            <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
            <asp:BoundField DataField="Option1" HeaderText="Option 1" SortExpression="Option1" />
            <asp:BoundField DataField="Option2" HeaderText="Option 2" SortExpression="Option2" />
            <asp:BoundField DataField="Option3" HeaderText="Option 3" SortExpression="Option3" />
            <asp:BoundField DataField="Option4" HeaderText="Option 4" SortExpression="Option4" />
            <asp:BoundField DataField="Answer" HeaderText="Answer" SortExpression="Answer" />
        </Columns>
    </asp:GridView>

    <!-- SqlDataSource -->
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
        ConnectionString="<%$ ConnectionStrings:PPSConnectionString %>"
        SelectCommand="SELECT Q_Type, QuestionID, Question, Option1, Option2, Option3, Option4, Answer FROM AptitudeQuestion">
    </asp:SqlDataSource>

</asp:Content>
