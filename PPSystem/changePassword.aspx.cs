using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static IronPython.Modules._ast;
using System.Windows.Forms;

namespace PPSystem
{
    public partial class changePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\.Net\\Web\\PPSystem\\PPSystem\\App_Data\\PPS.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("update Applicant set APassword=@v1 where UserID=@v2", con);
            cmd.Parameters.AddWithValue("@v1", TBNpass.Text);
            string s = (string)Session["id"];
            cmd.Parameters.AddWithValue("@v2", s);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            string message = "Sucessfully Registered!!";
            MessageBox.Show(message);
            clear();
        }
        void clear()
        {
            TBCNPass.Text = "";
            TBNpass.Text = "";
            TBPass.Text = "";
        }
    }
}