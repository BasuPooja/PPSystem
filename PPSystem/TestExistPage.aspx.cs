using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPSystem
{
    public partial class TestExistPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label12.Text = "Welcome " + Session["Name"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Result.aspx");
        }
    }
}