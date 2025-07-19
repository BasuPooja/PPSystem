using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using static IronPython.Modules._ast;

namespace PPSystem
{
    public partial class ContectUs : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\.Net\\Web\\PPSystem\\PPSystem\\App_Data\\PPS.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        void clear()
        {
            TBName.Text = "";
            TBContact.Text = "";
            TBEmail.Text = "";
            TBMessage.Text = "";
            TBSub.Text = "";
        }
        protected void Send_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Insert into ContactUs values(@v1,@v2,@v3,@v4,@v5)", con);
            cmd.Parameters.AddWithValue("@v1", TBName.Text);
            cmd.Parameters.AddWithValue("@v2", TBContact.Text);
            cmd.Parameters.AddWithValue("@v3", TBEmail.Text);
            cmd.Parameters.AddWithValue("@v4", TBSub.Text);
            cmd.Parameters.AddWithValue("@v5", TBMessage.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string message = "Our team will contact you soon";
            MessageBox.Show(message);
            clear();
        }
    }
}