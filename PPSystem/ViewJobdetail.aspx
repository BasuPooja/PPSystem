<%@ Page Title="View Job Details" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewJobdetail.aspx.cs" Inherits="PPSystem.ViewJobdetail" %>

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

        .label-dropdown {
            font-weight: bold;
            font-size: 15pt;
        }

        .dropdown-filter,
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
    <h1 class="page-title">JOB DETAILS</h1>

    <!-- Toolbar: Dropdown, Search, Reset -->
    <div class="toolbar-container">
        <asp:Label ID="LblDesignation" runat="server" CssClass="label-dropdown" Text="Designation:"></asp:Label>
        <asp:DropDownList ID="DDLDesignation" runat="server" CssClass="dropdown-filter" AutoPostBack="True" OnSelectedIndexChanged="DDLDesignation_SelectedIndexChanged">
            <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TxtSearch" runat="server" CssClass="search-box" placeholder="Search by Location, Key Skill"></asp:TextBox>

        <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="search-button" OnClick="BtnSearch_Click" />
        <asp:Button ID="BtnReset" runat="server" Text="Reset" CssClass="reset-button" OnClick="BtnReset_Click" />
    </div>

    <!-- GridView -->
    <asp:GridView ID="GridView1" runat="server"
        CssClass="gridview-custom"
        AutoGenerateColumns="False"
        CellPadding="6"
        ForeColor="#333333"
        GridLines="None"
        PageSize="10"
        AllowPaging="True"
        AllowSorting="True"
        DataKeyNames="Job_ID"
        BorderColor="#990033"
        BorderStyle="Inset"
        EmptyDataText="<span class='no-records'>No jobs found.</span>"
        OnPageIndexChanging="GridView1_PageIndexChanging">

        <AlternatingRowStyle CssClass="gridview-altrow" />
        <RowStyle CssClass="gridview-row" />
        <HeaderStyle CssClass="gridview-header" />
        <FooterStyle CssClass="gridview-footer" />
        <PagerStyle CssClass="pager" HorizontalAlign="Center" />

        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Job_ID" HeaderText="Job ID" ReadOnly="True" SortExpression="Job_ID" />
            <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
            <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
            <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
            <asp:BoundField DataField="Experience" HeaderText="Experience" SortExpression="Experience" />
            <asp:BoundField DataField="Qualification" HeaderText="Qualification" SortExpression="Qualification" />
            <asp:BoundField DataField="Key_Skill" HeaderText="Key Skill" SortExpression="Key_Skill" />
        </Columns>
    </asp:GridView>

</asp:Content>
