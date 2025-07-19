using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace PPSystem
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\.Net\\Web\\PPSystem\\PPSystem\\App_Data\\PPS.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("Select APassword from Admin where UserID=@v1", con);
            cmd.Parameters.AddWithValue("@v1", TBUID.Text);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            string pswd = "";
            int f = 0;
            while (dr.Read())
            {
                pswd = dr[0].ToString();
                f = 1;
            }
            if (f == 0)
            {
                MessageBox.Show("Record not found!");
            }
            else
            {
                if (TBPass.Text == pswd)
                {
                    Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    MessageBox.Show("Incorrect Password!");
                }
            }
            con.Close();
        }
    }
}