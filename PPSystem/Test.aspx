<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="PPSystem.Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            overflow-y: scroll;
            font-family: Segoe UI, sans-serif;
        }
        .test-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
            gap: 25px;
            flex-wrap: wrap;
            flex-direction: column; /* NEW: stack vertically */
            align-items: center;   
        }
        .info-panel {
            background-color: #ffffd9;
            border: 2px inset #990033;
            padding: 20px;
            min-width: 220px;
            font-size: 14pt;
            line-height: 1;
            box-shadow: 2px 2px 5px rgba(0,0,0,0.1);
        }
        .info-panel div {
            margin-bottom: 10px;
        }
        .question-panel {
            background-color: #ffffd9;
            border: 2px inset #990033;
            padding: 20px 30px;
            max-width: 600px;
            width: 100%;
            text-align: center;
            box-shadow: 2px 2px 5px rgba(0,0,0,0.1);
        }
        .question-title {
            background-color: #cc0066;
            color: white;
            padding: 12px;
            font-weight: bold;
            font-size: 18pt;
            text-align: center;
            margin-bottom: 15px;
            border-radius: 4px;
            width: 630px;
        }
        .timer-label {
            font-size: 18pt;
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .question-text {
            border: 1px solid #990033;
            padding: 12px;
            min-height: 80px;
            font-size: 14pt;
            margin-bottom: 15px;
            background-color: #fff;
            border-radius: 4px;
        }
        .radio-options {
            text-align: left;
            margin-bottom: 15px;
            margin-left: 130px;
            font-size: 20px;
        }
        .nav-buttons {
            display: flex;
            justify-content: space-between; /* Distributes left/center/right */
            align-items: center;
            width: 100%;
            margin-top: 10px;
            gap: 20px;
        }

        .finish-button-container {
            margin-left: auto; /* pushes Finish button to the far right */
        }

        .test-image {
            max-width: 280px;
            width: 100%;
            margin-top: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="test-container">
        <!-- Info Panel -->
        <div class="question-title">
            <asp:Label ID="Label12" runat="server" Text="Test"></asp:Label>
        </div>
        <!-- Question Panel -->
        <asp:Panel ID="Panel2" runat="server" CssClass="question-panel">
            
            <!-- Profile + Timer Row -->
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
                <!-- Profile Image and User Info -->
                <div style="display: flex; align-items: center; gap: 15px;">
                    <asp:Image ID="ProfileImage" runat="server" Width="60" Height="60"
                                Style="border-radius: 50%; border: 2px solid #990033;" />
                    <div style="font-size: 14pt; text-align: left;">
                        <div>User ID: <asp:Label ID="TBUID" runat="server" style="font-weight: bold;" ></asp:Label></div>
                        <div>Name: <asp:Label ID="TBName" runat="server" style="font-weight: bold;"></asp:Label></div>
                    </div>
                </div>

                <!-- Timer aligned right -->
                <asp:UpdatePanel ID="UpdatePanelTimer" runat="server">
                    <ContentTemplate>
                        <div class="timer-label" style="text-align: right; font-size: 14pt;">
                            <asp:Label ID="Label23" runat="server" Text="02:00:00"></asp:Label>
                        </div>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div style="background-color: #f7e5b3;
                        /* border: 2px inset #990033; */
                        padding: 10px;
                        margin-bottom: 10px;
                        box-shadow: 2px 2px 5px rgba(0,0,0,0.1);
                        font-size: 14pt;
                        text-align: left;">

                <div>
                    Total: <asp:Label ID="TBMQ" runat="server" ForeColor="Red">20</asp:Label> |
                    Attempted: <asp:Label ID="TBAQ" runat="server" ForeColor="Red">0</asp:Label> |
                    Missed: <asp:Label ID="TBTQ" runat="server" ForeColor="Red">0</asp:Label>
                </div>
            </div>

            <div style="margin-bottom:10px;">Question Type: 
                <asp:DropDownList ID="TBQType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="TBQType_SelectedIndexChanged" Width="90%" Height="30px">
                    <asp:ListItem>--Select--</asp:ListItem>
                    <asp:ListItem>Personality Question</asp:ListItem>
                    <asp:ListItem>Apptitude Question</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div style="margin-bottom:15px;">
                <asp:DropDownList ID="TBQType0" runat="server" AutoPostBack="True" OnSelectedIndexChanged="TBQType0_SelectedIndexChanged" Width="90%" Height="30px" Visible="false">
                    <asp:ListItem>--Select--</asp:ListItem>
                </asp:DropDownList>
            </div>


            <div class="question-text">
                <b>Question ID:</b> <asp:Label ID="TBQID" runat="server" Text=""></asp:Label>
                <br /><br />
                <asp:Label ID="TBQuestion" runat="server"></asp:Label>
            </div>

            <div class="radio-options">
                <asp:RadioButton ID="RBO1" runat="server" Text=" Option 1" GroupName="G1" /><br />
                <asp:RadioButton ID="RBO2" runat="server" Text=" Option 2" GroupName="G1" /><br />
                <asp:RadioButton ID="RBO3" runat="server" Text=" Option 3" GroupName="G1" /><br />
                <asp:RadioButton ID="RBO4" runat="server" Text=" Option 4" GroupName="G1" /><br />
                <asp:RadioButton ID="RBO5" runat="server" Text=" Option 5" GroupName="G1" Visible="false" />
            </div>

            <div class="nav-buttons" style="gap: 20px; justify-content: center; align-items: center;">
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Image/back-arrow.png" OnClick="Back_Click" Width="40" Height="40" />
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Image/next.png" OnClick="Next_Click" Width="40" Height="40" />
                <div class="finish-button-container">
                    <asp:Button ID="Finish" runat="server" Text="Finish" OnClick="Finish_Click" BackColor="#33CC33" ForeColor="white" Font-Bold="true" />
                </div>
            </div>
            
        </asp:Panel>

        <asp:Image ID="Image3" runat="server" ImageUrl="~/Image/animated6.gif" CssClass="test-image" />
    </div>
</asp:Content>
