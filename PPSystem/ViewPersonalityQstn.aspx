<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewPersonalityQstn.aspx.cs" Inherits="PPSystem.ViewPersonalityQstn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Font Awesome (optional, if needed for future) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" />

    <style type="text/css">
        .grid-container {
            max-width: 95%;
            margin: auto;
            text-align: center;
        }

        .search-container {
            margin: 20px auto;
            text-align: center;
        }

        .search-box {
            padding: 8px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .search-button, .reset-button {
            padding: 8px 16px;
            margin-left: 5px;
            background-color: #0066cc;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
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

        .gridview {
            border-collapse: collapse;
            width: 100%;
            margin-top: 10px;
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

        .header-image {
            display: block;
            margin: 20px auto;
            height: 100px;
            width: 5500px;
            max-width: 600px;
            border: 2px solid #990033;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Header -->
    <h1 style="
        max-width: 80%;
        text-align: center;
        color: #CC0066;
        font-weight: bold;
        font-size: 54px;
        margin: 40px auto 30px auto;
        padding: 25px 30px;
        display: block;
        border-bottom: 6px solid #CC0066;
        border-radius: 15px;
        box-shadow: 0 6px 16px rgba(0,0,0,0.12);
        background: #8dc0fa;
        ">
        PERSONALITY QUESTION
    </h1>
    <!-- Search & Reset -->
    <div class="search-container">
        <asp:TextBox ID="TxtSearch" runat="server" CssClass="search-box" placeholder="Search by Question"></asp:TextBox>
        <asp:Button ID="BtnFilter" runat="server" Text="Search" OnClick="BtnFilter_Click" CssClass="search-button" />
        <asp:Button ID="BtnReset" runat="server" Text="Reset" OnClick="BtnReset_Click" CssClass="reset-button" />
    </div>

    <!-- GridView -->
    <div class="grid-container">
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="QuestionID"
            AllowPaging="True"
            PageSize="10"
            OnPageIndexChanging="GridView1_PageIndexChanging"
            CssClass="gridview"
            GridLines="None"
            EmptyDataText="<span class='no-records'>No questions found.</span>">

            <AlternatingRowStyle CssClass="gridview-altrow" />
            <RowStyle CssClass="gridview-row" />
            <HeaderStyle CssClass="gridview-header" />
            <FooterStyle CssClass="gridview-footer" />
            <PagerStyle CssClass="pager" HorizontalAlign="Center" />

            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="QuestionID" HeaderText="Question ID" ReadOnly="True" />
                <asp:BoundField DataField="Question" HeaderText="Question" />
                <asp:BoundField DataField="Option1" HeaderText="Option 1" />
                <asp:BoundField DataField="Option2" HeaderText="Option 2" />
                <asp:BoundField DataField="Option3" HeaderText="Option 3" />
                <asp:BoundField DataField="Option4" HeaderText="Option 4" />
                <asp:BoundField DataField="Option5" HeaderText="Option 5" />
                <asp:BoundField DataField="Answer" HeaderText="Answer" />
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
