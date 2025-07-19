<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddAptitudeQuestion.aspx.cs" Inherits="PPSystem.AddAptitudeQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .page-container {
            display: flex;
            align-items: flex-start;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
            position: relative;
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

        .form-group input[type="text"],
        .form-group select {
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
            margin: 0 auto 15px auto;
            border: 2px solid #990033;
            max-width: 100%;
            height: auto;
        }

        .right-image {
            flex: 1 1 500px;
            max-width: 750px;
            height: 750px;
/*            border: 3px solid #990033;*/
        }

        @media screen and (max-width: 992px) {
            .right-image {
                flex: 1 1 100%;
                max-width: 100%;
                margin-top: 20px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" BackColor="White">

        <div class="page-container">

            <!-- Form Panel -->
            <asp:Panel ID="Panel2" runat="server" CssClass="form-container">

                <!-- Heading Image -->
                <asp:Image ID="ImageHeading" runat="server" CssClass="heading-image" ImageUrl="~/Image/6.png" />

                <div class="form-group">
                    <label>Question ID:</label>
                    <asp:TextBox ID="TBQID" runat="server" Enabled="False"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Question Type:</label>
                    <asp:DropDownList ID="TBQType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="TBQType_SelectedIndexChanged">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Mathematics</asp:ListItem>
                        <asp:ListItem>English</asp:ListItem>
                        <asp:ListItem>Logical Reasoning</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label>Question:</label>
                    <asp:TextBox ID="TBQ" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Option 1:</label>
                    <asp:TextBox ID="TBO1" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Option 2:</label>
                    <asp:TextBox ID="TBO2" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Option 3:</label>
                    <asp:TextBox ID="TBO3" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Option 4:</label>
                    <asp:TextBox ID="TBO4" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Right Answer:</label>
                    <asp:TextBox ID="TBAnswer" runat="server"></asp:TextBox>
                </div>

                <asp:Button ID="Submit" runat="server" Text="Add Question" CssClass="submit-button" OnClick="Button1_Click" />

            </asp:Panel>

            <!-- Right-side image -->
            <asp:Image ID="ImageRight" runat="server" CssClass="right-image" ImageUrl="~/Image/Q1.jpg" />

        </div>
    </asp:Panel>
</asp:Content>
