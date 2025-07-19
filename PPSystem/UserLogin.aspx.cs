using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Text;

namespace PPSystem
{
    public partial class UserLogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\.Net\\Web\\PPSystem\\PPSystem\\App_Data\\PPS.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select APassword,AName,UserID from Applicant where UserID=@v1", con);
            cmd.Parameters.AddWithValue("@v1", TBUID.Text);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            string pswd = "", id="";
            int f = 0,f1=0;
            while (dr.Read())
            {
                pswd = dr[0].ToString();
                Session["Name"] = dr[1].ToString();
                Session["id"] = dr[2].ToString();  
                f = 1;
            }
            con.Close();
            if (f == 0)
            {
                MessageBox.Show("Record not found!");
            }
            else
            {
                if (TBPass.Text == pswd)
                {
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand("Select UserID from Result", con);
                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    while (dr1.Read())
                    {
                        id = dr1[0].ToString();
                        if (TBUID.Text == id)
                        {
                            f1 = 1;
                        }
                    }
                    con.Close();
                    if (f1 ==1)
                    {
                        Response.Redirect("Result.aspx");
                    }
                    else
                    {
                        Response.Redirect("StartTest.aspx");
                    }
                }
                else
                {
                    MessageBox.Show("Incorrect Password!");
                }
            }
            con.Close();            
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                //TBPass.UseSystemPasswordChar = true;
            }
        }
    }
}