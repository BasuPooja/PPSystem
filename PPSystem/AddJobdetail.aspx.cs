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
    public partial class AddJobdetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void clear()
        {
            TBJID.Text = "";
            TBDesignation.Text = "";
            TBSalary.Text = "";
            TBLocation.Text = "";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\.Net\\Web\\PPSystem\\PPSystem\\App_Data\\PPS.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("Insert into JD values(@v1,@v2,@v3,@v4)", con);
            cmd.Parameters.AddWithValue("v1", TBJID.Text);
            cmd.Parameters.AddWithValue("v2", TBDesignation.Text);
            cmd.Parameters.AddWithValue("v3", TBSalary.Text);
            cmd.Parameters.AddWithValue("v4", TBLocation.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            string message = "Sucessfully Registered!!";
            MessageBox.Show(message);
            clear();
        }
    }
}