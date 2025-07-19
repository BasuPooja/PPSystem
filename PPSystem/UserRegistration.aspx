<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="PPSystem.UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            background-color: #FFFFD9;
            padding: 20px;
            max-width: 900px;
            margin: 20px auto;
            border: 2px solid #990033;
            border-radius: 8px;
        }
        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            flex-wrap: wrap;
        }
        .form-group {
            flex: 0 0 48%;
            min-width: 250px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-center {
            text-align: center;
            margin-top: 15px;
        }
        .registration-image {
            display: block;
            margin: 20px auto;
            max-width: 900px;
            width: 100%;
            height: 200px;
            border: solid 1px #990033;
        }
        .profile-photo-container {
            position: absolute;
            top: 245px;
            right: 70px;
            text-align: center;
        }
        .upload-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 2px solid #007b;
            object-fit: cover;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ✅ Place ScriptManager at the top -->
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div class="form-container" style="position: relative;">

        <!-- Registration Panel Image -->
        <asp:Image ID="Image4" runat="server" CssClass="registration-image" ImageUrl="~/Image/RegistrationPanel.png" />

        <!-- Registration Form Fields -->
        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LabelName" runat="server" Text="Name:" />
                <asp:TextBox ID="TBName" runat="server" Width="100%"  Height="30px" placeholder="Enter your full name" />
            </div>
            <div class="form-group">
                <asp:Label ID="LabelUserID" runat="server" Text="User ID:" />
                <asp:TextBox ID="TBUID" runat="server" Width="200px"  Height="30px" Enabled="false" placeholder="Auto-generated" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LabelEmail" runat="server" Text="Email:" />
                <asp:TextBox ID="TBEmail" runat="server" Width="100%" Height="30px" placeholder="example@email.com" />
            </div>
            <div class="form-group">
                <asp:Label ID="LabelContact" runat="server" Text="Contact No:" />
                <asp:TextBox ID="TBContact" runat="server" Width="100%" Height="30px" placeholder="Enter contact number" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LabelDOB" runat="server" Text="DOB:" />
                <asp:TextBox ID="TBDOB" runat="server" Width="100%" Height="30px" TextMode="Date" placeholder="Select your DOB" />
                <asp:RangeValidator ID="RangeValidator1" runat="server"
                    ControlToValidate="TBDOB"
                    ErrorMessage="* Age must be 18-50 years"
                    ForeColor="Red"
                    Display="Dynamic"
                    Type="Date"></asp:RangeValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelLocation" runat="server" Text="Location:" />
                <asp:TextBox ID="TBLocation" runat="server" Width="100%" Height="30px" placeholder="Enter your location" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LabelApply" runat="server" Text="Applying For:" />
                <asp:DropDownList ID="TBApply" runat="server" Width="100%" Height="30px">
                    <asp:ListItem>--Select--</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorApply" runat="server"
                    ControlToValidate="TBApply"
                    InitialValue="--Select--"
                    ErrorMessage="* Required"
                    ForeColor="Red"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelGender" runat="server" Text="Gender:" />
                <br />
                <asp:RadioButton ID="RBMale" runat="server" GroupName="Gender" Text="Male" />
                <asp:RadioButton ID="RBFemale" runat="server" GroupName="Gender" Text="Female" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LabelPassword" runat="server" Text="Password:" />
                <asp:TextBox ID="TBPass" runat="server" Width="100%" Height="30px" TextMode="Password" placeholder="Enter password" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server"
                    ControlToValidate="TBPass"
                    ErrorMessage="* Required"
                    ForeColor="Red"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="LabelConfirmPassword" runat="server" Text="Confirm Password:" />
                <asp:TextBox ID="TBCPass" runat="server" Width="100%" Height="30px" TextMode="Password" placeholder="Re-enter password" />
                <asp:CompareValidator ID="CompareValidatorPass" runat="server"
                    ControlToValidate="TBCPass"
                    ControlToCompare="TBPass"
                    ErrorMessage="* Passwords do not match"
                    ForeColor="Red"
                    Display="Dynamic"></asp:CompareValidator>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <asp:Label ID="LabelUploadCV" runat="server" Text="Upload CV:" />
                <asp:FileUpload ID="FileUpload2" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCV" runat="server"
                    ControlToValidate="FileUpload2"
                    ErrorMessage="* Required"
                    ForeColor="Red"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- AJAX Upload Profile Photo Section -->
            <asp:UpdatePanel ID="UpdatePanelPhotoUpload" runat="server">
                <ContentTemplate>
                    <div class="form-group">
                        <asp:Label ID="LabelUploadPhoto" runat="server" Text="Upload Profile Photo:" />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button ID="Submit1" runat="server" Text="Upload Photo" Height="30px" OnClick="Uplode_Click" />
                    </div>
                    <div class="profile-photo-container">
                        <asp:Image ID="TBImage" runat="server" ImageUrl="~/Image/Profile-icon.jpg" CssClass="upload-image" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="Submit1" />
                </Triggers>
            </asp:UpdatePanel>

        </div>

        <div class="form-center">
            <asp:Button ID="Submit" runat="server" Text="Register" BackColor="#0099FF" Height="50px" ForeColor="White" Font-Bold="true" Width="200px" OnClick="Button1_Click" />
        </div>

        <div class="form-center" style="margin-top:10px;">
            <asp:Label ID="LabelLogin" runat="server" Text="Already registered?" />
            <asp:HyperLink ID="HyperLinkLogin" runat="server" NavigateUrl="UserLogin.aspx">Login</asp:HyperLink>
        </div>
    </div>
</asp:Content>
