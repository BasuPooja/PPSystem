<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewApplicant.aspx.cs" Inherits="PPSystem.ViewApplicant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<!-- Font Awesome via CDN for reliable loading -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-pEMXgaZ0RRSMS/EXAMPLEHASH==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        APPLICANT LIST
    </h1>

    <div class="search-container">
        <asp:TextBox ID="TxtSearch" runat="server" CssClass="search-box" placeholder="Search by Name or Email"></asp:TextBox>
        <asp:Button ID="BtnFilter" runat="server" Text="Search" OnClick="BtnFilter_Click" CssClass="search-button" />
        <asp:Button ID="BtnReset" runat="server" Text="Reset" OnClick="BtnReset_Click" CssClass="reset-button" />
    </div>

    <div class="grid-container">
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="UserID"
            AllowPaging="True"
            PageSize="10"
            OnPageIndexChanging="GridView1_PageIndexChanging"
            CssClass="gridview"
            GridLines="None"
            EmptyDataText="<span class='no-records'>No records found.</span>">

            <AlternatingRowStyle CssClass="gridview-altrow" />
            <RowStyle CssClass="gridview-row" />
            <HeaderStyle CssClass="gridview-header" />
            <FooterStyle CssClass="gridview-footer" />
            <PagerStyle CssClass="pager" HorizontalAlign="Center" />

            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="User ID" ReadOnly="True" />
                <asp:BoundField DataField="Applying_for" HeaderText="Applying For" />
                <asp:BoundField DataField="AName" HeaderText="Name" />
                <asp:BoundField DataField="AEmail" HeaderText="Email" />
                <asp:BoundField DataField="AContact" HeaderText="Contact" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="AGender" HeaderText="Gender" />
            
              <asp:TemplateField HeaderText="Resume (PDF)">
                    <ItemTemplate>
                        <a href='<%# ResolveUrl(Eval("CV").ToString()) %>' target="_blank" title="View">
                            <img src='<%# ResolveUrl("~/Image/view-icon.png") %>' alt="View" style="height: 30px; width: 30px; margin-right: 5px;" />
                        </a>
                        <a href='<%# ResolveUrl(Eval("CV").ToString()) %>' download title="Download">
                            <img src='<%# ResolveUrl("~/Image/download.png") %>' alt="Download" style="height: 30px; width: 30px;" />
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <a href='<%# ResolveUrl(Eval("Image").ToString()) %>' target="_blank" title="View">
                            <img src='<%# ResolveUrl("~/Image/view-icon.png") %>' alt="View" style="height: 30px; width: 30px; margin-right: 5px;" />
                        </a>
                        <a href='<%# ResolveUrl(Eval("Image").ToString()) %>' download title="Download">
                            <img src='<%# ResolveUrl("~/Image/download.png") %>' alt="Download" style="height: 30px; width: 30px;" />
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>


            
                <asp:BoundField DataField="Date_Time" HeaderText="Date & Time" />
            </Columns>
            

        </asp:GridView>
    </div>
</asp:Content>
