<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Requirement.aspx.cs" Inherits="PPSystem.Requirement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .main-panel {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 30px 20px;
            background-color: #f9f9f9;
            min-height: 100vh;
            gap: 30px;
            flex-wrap: wrap;
        }

        .form-panel {
            background-color: #FFFFD9;
            border: 3px ridge #990033;
            padding: 25px 30px;
            width: 500px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .form-panel h2 {
            text-align: center;
            color: #990033;
            margin-bottom: 10px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: bold;
            font-size: 14pt;
            color: #333;
        }

        .form-group input[type="text"],
        .form-group select {
            padding: 8px;
            font-size: 12pt;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .submit-button {
            align-self: center;
            background-color: #0099FF;
            color: white;
            font-size: 14pt;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .submit-button:hover {
            background-color: #007ACC;
        }

        .right-image {
           flex: 1 1 500px;
            max-width: 850px;
            width: 850px;
            height: auto;
/*            border: 3px solid #990033;*/
        }
        .header-image {
            max-width: 500px;
            width: 200%;
            border: 3px solid #990033;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-panel">

        <div class="form-panel">
            <asp:Image ID="Image3" runat="server" CssClass="header-image" ImageUrl="~/Image/JR.png" />

            <!-- Job ID -->
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="Job ID:" />
                <asp:DropDownList ID="TBJID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="TBJID_SelectedIndexChanged" />
            </div>

            <!-- Designation -->
            <div class="form-group">
                <asp:Label ID="Label10" runat="server" Text="Designation:" />
                <asp:TextBox ID="TBDesignation" runat="server" Enabled="False" />
            </div>

            <!-- Salary -->
            <div class="form-group">
                <asp:Label ID="Label7" runat="server" Text="Salary:" />
                <asp:TextBox ID="TBSalary" runat="server" Enabled="False" />
            </div>

            <!-- Location -->
            <div class="form-group">
                <asp:Label ID="Label11" runat="server" Text="Location:" />
                <asp:TextBox ID="TBLocation" runat="server" Enabled="False" />
            </div>

            <!-- Experience -->
            <div class="form-group">
                <asp:Label ID="Label6" runat="server" Text="Experience:" />
                <asp:TextBox ID="TBExperience" runat="server" />
            </div>

            <!-- Qualification -->
            <div class="form-group">
                <asp:Label ID="Label18" runat="server" Text="Qualification:" />
                <asp:TextBox ID="TBQualification" runat="server" />
            </div>

            <!-- Key Skill -->
            <div class="form-group">
                <asp:Label ID="Label8" runat="server" Text="Key Skill:" />
                <asp:TextBox ID="TBKeyskill" runat="server" />
            </div>

            <!-- Submit Button -->
            <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="submit-button" OnClick="Button1_Click" />
        </div>

        <!-- Right Image -->
        <asp:Image ID="Image4" runat="server" CssClass="right-image" ImageUrl="~/Image/JR1.jpg" />

    </div>
</asp:Content>
