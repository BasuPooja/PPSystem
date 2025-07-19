using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace PPSystem
{
    public partial class AddPersonalityQuestion : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\.Net\\Web\\PPSystem\\PPSystem\\App_Data\\PPS.mdf;Integrated Security=True");
        int v1 = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            QuestionID();
        }
        protected void clear()
        {
            QuestionID();
            TBQ.Text = "";
            TBO1.Text = "";
            TBO2.Text = "";
            TBO3.Text = "";
            TBO4.Text = "";
            TBO5.Text = "";
            TBAnswer.Text = "";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Insert into PersonalityQuestion values(@v1,@v2,@v3,@v4,@v5,@v6,@v7,@v8,@v9)", con);
            SqlCommand cmd1 = new SqlCommand("Select MAX(SI) from PersonalityQuestion", con);
            var t = cmd1.ExecuteScalar() as string;
            if (t == null)
            {
                TBQID.Text = "1";
            }
            else
            {
                v1 = Convert.ToInt32(t);
                v1 = v1 + 1;
                cmd.Parameters.AddWithValue("v1", v1);
                cmd.Parameters.AddWithValue("v2", TBQID.Text);
                cmd.Parameters.AddWithValue("v3", TBQ.Text);
                cmd.Parameters.AddWithValue("v4", TBO1.Text);
                cmd.Parameters.AddWithValue("v5", TBO2.Text);
                cmd.Parameters.AddWithValue("v6", TBO3.Text);
                cmd.Parameters.AddWithValue("v7", TBO4.Text);
                cmd.Parameters.AddWithValue("v8", TBO5.Text);
                cmd.Parameters.AddWithValue("v9", TBAnswer.Text);
            }

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            string message = "Sucessfully Added";
            MessageBox.Show(message);
            clear();
        }
        void QuestionID()
        {
            int v;
            string t3;
            SqlCommand cmd1 = new SqlCommand("Select MAX(QuestionID) from PersonalityQuestion", con);
            con.Open();
            var t = cmd1.ExecuteScalar() as string;
            if (t == null)
            {
                TBQID.Text = "PQ1";
            }
            else
            {
                int l = t.Length;
                v = Convert.ToInt32(t.Substring(2, l - 2));
                v = v + 1;
                t3 = "PQ" + v;
                TBQID.Text = String.Format(t3);
            }
            con.Close();
        }
    }
}
