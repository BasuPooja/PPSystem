using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static IronPython.Modules._ast;
using System.Windows.Forms;
using System.Xml.Linq;

namespace PPSystem
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\.Net\\Web\\PPSystem\\PPSystem\\App_Data\\PPS.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("update Applicant set APassword =@v1 where UserID=@v2 and AEmail=@v3", con);
            cmd.Parameters.AddWithValue("@v1", TBNpass.Text);
            cmd.Parameters.AddWithValue("@v2", TBUID.Text);
            cmd.Parameters.AddWithValue("@v3", TBEmail.Text);
           
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            string message = "Sucessfully Changed!!";
            MessageBox.Show(message);
            clear();
        }
        void clear()
        {
            TBUID.Text = "";
            TBCNPass.Text = ""; 
            TBNpass.Text = "";
            TBEmail.Text = "";
        }

        
    }
}