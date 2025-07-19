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
using System.Data;

namespace PPSystem
{
    public partial class AddAptitudeQuestion : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\.Net\\Web\\PPSystem\\PPSystem\\App_Data\\PPS.mdf;Integrated Security=True");
        SqlCommand cmd1;
        int v,v1;
        string t3;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                QuestionID();
            }
        }
        protected void clear()
        {
            TBQType.Text = "--Select--";
            TBQID.Text = "";
            TBQ.Text = "";
            TBO1.Text = "";
            TBO2.Text = "";
            TBO3.Text = "";
            TBO4.Text = "";
            TBAnswer.Text = "";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string query = "Insert into AptitudeQuestion values(@v1,@v2,@v3,@v4,@v5,@v6,@v7,@v8,@V9)";
            SqlCommand cmd = new SqlCommand(query, con);
            if (TBQType.SelectedItem.Text == "--Select--")
            {
                Response.Write("Please Select Job Detail");
            }
            else
            {

                SqlCommand cmd1 = new SqlCommand("Select MAX(SI) from AptitudeQuestion", con);
                con.Open();
                var t = cmd1.ExecuteScalar() as string;
                con.Close();
                if (t == null)
                {
                    TBQID.Text = "1";
                }
                else
                {
                    v1 = Convert.ToInt32(t);
                    v1 = v1 + 1;
                }
                cmd.Parameters.AddWithValue("v1", v1);
                cmd.Parameters.AddWithValue("v2", TBQType.Text);
                cmd.Parameters.AddWithValue("v3", TBQID.Text);
                cmd.Parameters.AddWithValue("v4", TBQ.Text);
                cmd.Parameters.AddWithValue("v5", TBO1.Text);
                cmd.Parameters.AddWithValue("v6", TBO2.Text);
                cmd.Parameters.AddWithValue("v7", TBO3.Text);
                cmd.Parameters.AddWithValue("v8", TBO4.Text);
                cmd.Parameters.AddWithValue("v9", TBAnswer.Text);
            }
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            string message = "Question Sucessfully Added";
            MessageBox.Show(message);
            clear();
        }
        protected void TBQType_SelectedIndexChanged(object sender, EventArgs e)
        {
            QuestionID();
        }
        void QuestionID()
        {
            cmd1 = new SqlCommand("Select MAX(QuestionID) from AptitudeQuestion where Q_Type=@v1", con);
            cmd1.Parameters.AddWithValue("v1", TBQType.SelectedItem.Text);
            con.Open();
            var t1 = cmd1.ExecuteScalar() as string;
            if (t1 == null)
            {
                if(TBQType.SelectedItem.Text=="--Select--")
                {
                    TBQID.Text = "";
                }
                else
                if (TBQType.SelectedItem.Text == "Mathematics")
                {
                    TBQID.Text = "AMQ01";
                }
                else
                    if (TBQType.SelectedItem.Text == "English")
                {
                    TBQID.Text = "AEQ01";
                }
                else
                    if (TBQType.SelectedItem.Text == "Logical Reasoning")
                {
                    TBQID.Text = "ALQ01";
                }

            }
            else
            {
                if (TBQType.SelectedItem.Text == "--Select--")
                {
                    TBQID.Text = "";
                }
                else
                {
                    var t = cmd1.ExecuteScalar() as string;
                    int l = t.Length;
                    v = Convert.ToInt32(t.Substring(3, l - 3));
                    v = v + 1;
                    if (TBQType.SelectedItem.Text == "Mathematics")
                    {
                        t3 = "AMQ" + v;
                    }
                    else
                    if (TBQType.SelectedItem.Text == "English")
                    {
                        t3 = "AEQ" + v;
                    }
                    else
                    if (TBQType.SelectedItem.Text == "Logical Reasoning")
                    {
                        t3 = "ALQ" + v;
                    }

                    TBQID.Text = String.Format(t3);
                }
            }
            con.Close();
        }
    }
}