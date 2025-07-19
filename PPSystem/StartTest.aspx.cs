using System;
using System.Web.UI;

namespace PPSystem
{
    public partial class StartTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Disable unobtrusive validation if you use older validators
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                // Display the logged-in user's name dynamically
                if (Session["Name"] != null)
                {
                    Label12.Text = "Welcome " + Session["Name"].ToString().ToUpper();
                }
                else
                {
                    Label12.Text = "Welcome User";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Redirect user to the test page when "Start Test" is clicked
            Response.Redirect("Test.aspx");
        }
    }
}
