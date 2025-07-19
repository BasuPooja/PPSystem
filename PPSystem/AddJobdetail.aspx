<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddJobdetail.aspx.cs" Inherits="PPSystem.AddJobdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .page-container {
            display: flex;
            align-items: flex-start;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
        }

        .form-container {
            flex: 1 1 400px;
            max-width: 600px;
            background-color: #FFFFD9;
            border: 2px ridge #990033;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: bold;
            font-size: 14pt;
            margin-bottom: 5px;
        }

        .form-group input[type="text"] {
            padding: 8px;
            font-size: 12pt;
        }

        .submit-button {
            padding: 10px;
            font-size: 14pt;
            font-weight: bold;
            background-color: #0099FF;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            align-self: center;
            width: 200px;
        }

        .submit-button:hover {
            background-color: #007acc;
        }

        .heading-image {
            display: block;
            height: 150px;
            width: 600px;
            margin: 0 auto 15px auto;
            border: 2px solid #990033;
        }

        .right-image {
            flex: 1 1 400px;
            max-width: 750px;
            height: auto;
            margin-top: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" BackColor="White">
        <div class="page-container">

            <!-- Form Panel -->
            <asp:Panel ID="Panel2" runat="server" CssClass="form-container">
                <!-- Heading Image -->
                <asp:Image ID="ImageHeading" runat="server" CssClass="heading-image" ImageUrl="~/Image/JD.png" />

                <div class="form-group">
                    <label>Job ID:</label>
                    <asp:TextBox ID="TBJID" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Designation:</label>
                    <asp:TextBox ID="TBDesignation" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Salary:</label>
                    <asp:TextBox ID="TBSalary" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Location:</label>
                    <asp:TextBox ID="TBLocation" runat="server"></asp:TextBox>
                </div>

                <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="submit-button" OnClick="Button1_Click" />
            </asp:Panel>

            <!-- Right-side image -->
            <asp:Image ID="ImageRight" runat="server" CssClass="right-image" ImageUrl="~/Image/JD2.jpg" />

        </div>
    </asp:Panel>
</asp:Content>
