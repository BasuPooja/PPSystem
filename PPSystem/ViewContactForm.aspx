<%@ Page Title="View Contact Form" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewContactForm.aspx.cs" Inherits="PPSystem.ViewContactForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .page-title {
            text-align: center;
            color: #CC0066;
            font-weight: bold;
            font-size: 36px;
            margin: 30px auto 15px auto;
            padding: 15px;
            border-bottom: 4px solid #CC0066;
            border-radius: 10px;
            background: #8dc0fa;
            width: 60%;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .toolbar-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }

        .search-box {
            width: 250px;
            padding: 6px 10px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .search-button,
        .reset-button {
            padding: 8px 14px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: white;
            transition: background-color 0.2s;
        }

        .search-button {
            background-color: #0066cc;
        }

        .search-button:hover {
            background-color: #004999;
        }

        .reset-button {
            background-color: #990000;
        }

        .reset-button:hover {
            background-color: #660000;
        }

        .gridview-custom {
            width: 95%;
            margin: 0 auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Title -->
    <h2 class="page-title">CONTACT US RECORDS</h2>

    <!-- Search Toolbar -->
    <div class="toolbar-container">
        <asp:TextBox ID="TxtSearch" runat="server" CssClass="search-box" placeholder="Search by Name or Email"></asp:TextBox>
        <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="search-button" OnClick="BtnSearch_Click" />
        <asp:Button ID="BtnReset" runat="server" Text="Reset" CssClass="reset-button" OnClick="BtnReset_Click" />
    </div>


    <!-- GridView -->
    <asp:GridView ID="GridView1" runat="server"
        CssClass="gridview-custom"
        AutoGenerateColumns="False"
        AllowPaging="True"
        AllowSorting="True"
        PageSize="10"
        CellPadding="6"
        GridLines="None"
        BorderColor="#990033"
        BorderStyle="Inset"
        OnPageIndexChanging="GridView1_PageIndexChanging"
        EmptyDataText="No records found.">

        <AlternatingRowStyle BackColor="#f9f9f9" />
        <RowStyle BackColor="#ffffff" />
        <HeaderStyle BackColor="#CC0066" ForeColor="White" Font-Bold="True" Font-Size="14pt" />
        <PagerStyle BackColor="#FFCC66" HorizontalAlign="Center" />
        <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
        <SelectedRowStyle BackColor="#FFCC66" ForeColor="Navy" Font-Bold="True" />

        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
            <asp:BoundField DataField="Messages" HeaderText="Messages" SortExpression="Messages" />
        </Columns>
    </asp:GridView>

</asp:Content>
