<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ShortList_Applicant.aspx.cs" Inherits="PPSystem.ShortList_Applicant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" />

    <style>
        .grid-container {
            max-width: 95%;
            margin: 30px auto;
            text-align: center;
        }

        .filter-container {
            text-align: center;
            margin: 20px auto;
        }

        .filter-textbox, .filter-dropdown {
            padding: 8px;
            font-size: 14px;
            width: 200px;
            margin: 0 5px;
        }

        .filter-button {
            padding: 8px 16px;
            background-color: #0066cc;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin: 0 5px;
        }

        .filter-button:hover {
            background-color: #004999;
        }

        .gridview-header {
            background-color: #CC0066;
            color: white;
            font-weight: bold;
            font-size: 16px;
            text-align: center;
        }

        .gridview-row, .gridview-altrow {
            background-color: #fff8e7;
            text-align: center;
        }

        .gridview-altrow {
            background-color: #fbe6c0;
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
            margin-top: 15px;
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

    <h1 style="
        max-width: 80%;
        text-align: center;
        color: #CC0066;
        font-weight: bold;
        font-size: 42px;
        margin: 40px auto 20px auto;
        padding: 20px 30px;
        border-bottom: 6px solid #CC0066;
        border-radius: 15px;
        box-shadow: 0 6px 16px rgba(0,0,0,0.12);
        background: #8dc0fa;">
        Shortlisted CVs
    </h1>

    <div class="filter-container">
        <asp:TextBox ID="TxtUserID" runat="server" CssClass="filter-textbox" placeholder="Filter by UserID"></asp:TextBox>
        <asp:DropDownList ID="DDLJobID" runat="server" CssClass="filter-dropdown" Width="220px"></asp:DropDownList>
        <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="filter-button" OnClick="BtnSearch_Click" />
        <asp:Button ID="BtnReset" runat="server" Text="Reset" CssClass="filter-button" OnClick="BtnReset_Click" />
    </div>

    <div class="grid-container">
        <asp:GridView ID="GridShortlisted" runat="server"
            AutoGenerateColumns="False"
            AllowPaging="True"
            PageSize="10"
            OnPageIndexChanging="GridShortlisted_PageIndexChanging"
            CssClass="gridview"
            GridLines="None"
            EmptyDataText="<span class='no-records'>No shortlisted CVs found.</span>">

            <AlternatingRowStyle CssClass="gridview-altrow" />
            <RowStyle CssClass="gridview-row" />
            <HeaderStyle CssClass="gridview-header" />
            <FooterStyle CssClass="gridview-footer" />
            <PagerStyle CssClass="pager" HorizontalAlign="Center" />

            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="User ID" />
                <asp:BoundField DataField="AName" HeaderText="Name" />
                <asp:BoundField DataField="AEmail" HeaderText="Email" />
                <asp:BoundField DataField="AContact" HeaderText="Contact" />
                <asp:BoundField DataField="Applying_for" HeaderText="Applying For" />
                <asp:BoundField DataField="AGender" HeaderText="Gender" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="Action_Status" HeaderText="Status" />
                <asp:BoundField DataField="Action_Date_Time" HeaderText="Action Date" DataFormatString="{0:dd MMM yyyy hh:mm tt}" />

                <asp:TemplateField HeaderText="Resume">
                    <ItemTemplate>
                        <a href='<%# ResolveUrl(Eval("CV").ToString()) %>' target="_blank" title="View Resume">
                            <i class="fa-solid fa-file-pdf fa-lg" style="color:#CC0066;"></i>
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <a href='<%# ResolveUrl(Eval("Image").ToString()) %>' target="_blank" title="View Image">
                            <i class="fa-solid fa-image fa-lg" style="color:#CC0066;"></i>
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
