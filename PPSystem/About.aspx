<%@ Page Title="About Predictify" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PPSystem.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .about-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
/*            border: 2px inset #99004d;*/
            gap: 20px;
        }

        .about-image {
            max-width: 1050px;
            height: auto;
/*            border: 2px solid #99004d;*/
/*            border-radius: 8px;*/
        }

        .about-text {
            font-size: 14pt;
            color: #333;
            text-align: justify;
            line-height: 1.6;
        }

        @media (max-width: 768px) {
            .about-text {
                font-size: 12pt;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" CssClass="about-container">
        <asp:Image ID="Image1" runat="server" CssClass="about-image" ImageUrl="~/Image/A3.jpg" AlternateText="Predictify Analysis" />
        
        <asp:Label ID="Label1" runat="server" CssClass="about-text" Text="
            The Predictify CV-based Personality Prediction System, launched in 2024, represents a pioneering approach to leveraging artificial intelligence for enhancing self-awareness. 
            This system goes beyond traditional resume analysis by delving deep into an individual's professional documents to uncover nuanced insights into their personality traits, 
            values, and aspirations. By employing advanced natural language processing techniques, the system identifies subtle linguistic cues indicative of extroversion, agreeableness, 
            openness, conscientiousness, and emotional stability. This comprehensive analysis results in a detailed personality profile that not only informs career decisions but also 
            facilitates personal development, helping individuals harness their inherent potential effectively.">
        </asp:Label>

        <asp:Image ID="Image2" runat="server" CssClass="about-image" ImageUrl="~/Image/B2.png" AlternateText="Predictify System" />

        <asp:Label ID="Label2" runat="server" CssClass="about-text" Text="
            Personality Insights, the driving force behind this innovative system, underscores the importance of self-awareness in achieving success. 
            By integrating machine learning, data science, and industrial-organizational psychology, the platform offers a cutting-edge solution that empowers individuals to better understand themselves. 
            With an impressive accuracy rate exceeding 80%, the system provides unparalleled visibility into one's strengths, weaknesses, preferred work environments, and motivational factors. 
            This level of detailed insight equips individuals with the knowledge necessary to make informed choices and pursue paths aligned with their true selves, ultimately fostering professional 
            and personal growth.">
        </asp:Label>
    </asp:Panel>
</asp:Content>
