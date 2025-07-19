using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Windows.Forms;

namespace PPSystem
{
    public partial class Test : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\.Net\Web\PPSystem\PPSystem\App_Data\PPS.mdf;Integrated Security=True");

        int aq = 0, mq = 20, ra = 0, wa = 0;

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        //    if (!IsPostBack)
        //    {
        //        TBName.Text = Session["Name"].ToString();
        //        TBUID.Text = Session["id"].ToString();

        //        if (!CheckTestRecordExists(TBUID.Text))
        //            InsertTestRecord(TBUID.Text, TBName.Text);

        //        TBAQ.Text = "0";
        //        TBMQ.Text = "20";
        //        Label23.Text = "02:00:00";
        //        Timer1.Enabled = true;

        //        LoadUserProfile();
        //    }
        //}
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TBName.Text = Session["Name"].ToString();
                TBUID.Text = Session["id"].ToString();

                if (!CheckTestRecordExists(TBUID.Text))
                    InsertTestRecord(TBUID.Text, TBName.Text);

                Session["attempted"] = 0;
                Session["missed"] = 20;
                Session["ra"] = 0;
                Session["wa"] = 0;

                TBAQ.Text = Session["attempted"].ToString();
                TBMQ.Text = Session["missed"].ToString();

                Label23.Text = "02:00:00";
                Timer1.Enabled = true;
                LoadUserProfile();
                //filldata();
            }
        }


        private bool CheckTestRecordExists(string userId)
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Test WHERE UserID=@uid", con))
            {
                cmd.Parameters.AddWithValue("@uid", userId);
                con.Open();
                int count = (int)cmd.ExecuteScalar();
                con.Close();
                return count > 0;
            }
        }

        private void InsertTestRecord(string userId, string userName)
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO Test (UserID, Name) VALUES (@uid, @name)", con))
            {
                cmd.Parameters.AddWithValue("@uid", userId);
                cmd.Parameters.AddWithValue("@name", userName);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        private void LoadUserProfile()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Image FROM Applicant WHERE UserID = @UserID", con))
            {
                cmd.Parameters.AddWithValue("@UserID", TBUID.Text);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    string photoPath = dr["Image"].ToString();
                    ProfileImage.ImageUrl = !string.IsNullOrEmpty(photoPath) ? photoPath : "~/Image/default-profile.png";
                }
                else
                {
                    MessageBox.Show("User not found.");
                    Response.Redirect("Login.aspx");
                }
                dr.Close();
                con.Close();
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            TimeSpan ts = TimeSpan.Parse(Label23.Text);
            ts = ts.Subtract(TimeSpan.FromSeconds(1));
            Label23.Text = ts.ToString(@"hh\:mm\:ss");

            if (ts.TotalSeconds <= 0)
            {
                Timer1.Enabled = false;
                MessageBox.Show("Time Up! Test will be submitted automatically.");
                Finish_Click(sender, e);
            }
        }

        protected void TBQType_SelectedIndexChanged(object sender, EventArgs e)
        {
            clear();
            if (TBQType.SelectedItem.Text == "Apptitude Question")
            {
                TBQType0.Visible = true;
                TBQType0.Items.Clear();
                TBQType0.Items.Add("--Select--");
                TBQType0.Items.Add("Mathematics");
                TBQType0.Items.Add("English");
                TBQType0.Items.Add("Logical Reasoning");
            }
            else if (TBQType.SelectedItem.Text == "Personality Question")
            {
                TBQType0.Visible = false;
                LoadQuestion("PQ1");
            }
        }

        protected void TBQType0_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (TBQType0.SelectedItem.Text != "--Select--")
            {
                string prefix = TBQType0.SelectedItem.Text == "Mathematics" ? "AMQ" :
                                TBQType0.SelectedItem.Text == "English" ? "AEQ" : "ALQ";
                LoadQuestion(prefix + "1");
            }
        }

        private void LoadQuestion(string qid)
        {
            TBQID.Text = qid;
            string table = qid.StartsWith("PQ") ? "PersonalityQuestion" : "AptitudeQuestion";
            string query = $"SELECT Question, Option1, Option2, Option3, Option4{(qid.StartsWith("PQ") ? ", Option5" : "")} FROM {table} WHERE QuestionID = @qid";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@qid", qid);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count == 0)
                {
                    MessageBox.Show("Question not found.");
                    return;
                }

                TBQuestion.Text = dt.Rows[0]["Question"].ToString();
                RBO1.Text = dt.Rows[0]["Option1"].ToString();
                RBO2.Text = dt.Rows[0]["Option2"].ToString();
                RBO3.Text = dt.Rows[0]["Option3"].ToString();
                RBO4.Text = dt.Rows[0]["Option4"].ToString();
                RBO5.Text = qid.StartsWith("PQ") ? dt.Rows[0]["Option5"].ToString() : "";
                RBO5.Visible = qid.StartsWith("PQ");

                clearSelections();
                LoadPreviousAnswer(qid);
            }
        }

        private void LoadPreviousAnswer(string qid)
        {
            string column = qid.StartsWith("PQ") ? $"PAnswer{qid.Substring(2)}" : $"AAnswer{qid.Substring(3)}";
            using (SqlCommand cmd = new SqlCommand($"SELECT {column} FROM Test WHERE UserID=@uid", con))
            {
                cmd.Parameters.AddWithValue("@uid", TBUID.Text);
                con.Open();
                string ans = cmd.ExecuteScalar()?.ToString();
                con.Close();

                if (!string.IsNullOrEmpty(ans))
                {
                    if (RBO1.Text == ans) RBO1.Checked = true;
                    else if (RBO2.Text == ans) RBO2.Checked = true;
                    else if (RBO3.Text == ans) RBO3.Checked = true;
                    else if (RBO4.Text == ans) RBO4.Checked = true;
                    else if (RBO5.Text == ans) RBO5.Checked = true;
                }
            }
        }

        protected void Next_Click(object sender, EventArgs e)
        {
            Save();
            NavigateQuestion(1);
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Save();
            NavigateQuestion(-1);
        }

        private void NavigateQuestion(int step)
        {
            string currentQID = TBQID.Text;
            string prefix = currentQID.Substring(0, currentQID.Length - 1);
            int num = int.Parse(currentQID.Substring(currentQID.Length - 1)) + step;

            if (num < 1 || num > 5)
            {
                MessageBox.Show("No more questions in this section.");
                return;
            }
            LoadQuestion(prefix + num);
        }

        //protected void Finish_Click(object sender, EventArgs e)
        //{
        //    Save();

        //    int marks = ra * 4 - wa;
        //    using (SqlCommand cmd = new SqlCommand("INSERT INTO Result (UserID, UserName, AttemptedQstn, MissedQuestion, RightAnswer, WrongAnswer, ObtainedMarks, MaxMarks) VALUES (@UserID, @UserName, @AttemptedQ, @MissedQ, @RightAns, @WrongAns, @ObtainedMarks, @MaxMarks)", con))
        //    {
        //        cmd.Parameters.AddWithValue("@UserID", TBUID.Text);
        //        cmd.Parameters.AddWithValue("@UserName", TBName.Text);
        //        cmd.Parameters.AddWithValue("@AttemptedQ", aq);
        //        cmd.Parameters.AddWithValue("@MissedQ", mq);
        //        cmd.Parameters.AddWithValue("@RightAns", ra);
        //        cmd.Parameters.AddWithValue("@WrongAns", wa);
        //        cmd.Parameters.AddWithValue("@ObtainedMarks", marks);
        //        cmd.Parameters.AddWithValue("@MaxMarks", 80);

        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //    }

        //    MessageBox.Show("Test submitted successfully!");
        //    Response.Redirect("TestExistPage.aspx");
        //}

        protected void Finish_Click(object sender, EventArgs e)
        {
            Save();

            int marks = ra * 4;
            int newSI = 1;
            int attempted = Convert.ToInt32(Session["attempted"]);
            int missed = Convert.ToInt32(Session["missed"]);
            int rightAns = Convert.ToInt32(Session["ra"]);
            int wrongAns = Convert.ToInt32(Session["wa"]);


            // Get MAX SI + 1
            using (SqlCommand getMax = new SqlCommand("SELECT ISNULL(MAX(SI),0) + 1 FROM Result", con))
            {
                con.Open();
                newSI = (int)getMax.ExecuteScalar();
                con.Close();
            }

            using (SqlCommand cmd = new SqlCommand("INSERT INTO Result (UserID, UserName, AttemptedQstn, MissedQuestion, RightAnswer, WrongAnswer, ObtainedMarks, MaxMarks) VALUES (@UserID, @UserName, @AttemptedQ, @MissedQ, @RightAns, @WrongAns, @ObtainedMarks, @MaxMarks)", con))
            {
                //cmd.Parameters.AddWithValue("@SI", newSI);
                cmd.Parameters.AddWithValue("@UserID", TBUID.Text);
                cmd.Parameters.AddWithValue("@UserName", TBName.Text);
                cmd.Parameters.AddWithValue("@AttemptedQ", aq);
                cmd.Parameters.AddWithValue("@MissedQ", mq);
                cmd.Parameters.AddWithValue("@RightAns", ra);
                cmd.Parameters.AddWithValue("@WrongAns", wa);
                cmd.Parameters.AddWithValue("@ObtainedMarks", marks);
                cmd.Parameters.AddWithValue("@MaxMarks", 80);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            MessageBox.Show("Test submitted successfully!");
            Response.Redirect("TestExistPage.aspx");
        }

        private void Save()
        {
            string ans = RBO1.Checked ? RBO1.Text :
                         RBO2.Checked ? RBO2.Text :
                         RBO3.Checked ? RBO3.Text :
                         RBO4.Checked ? RBO4.Text :
                         RBO5.Checked ? RBO5.Text : "";

            if (string.IsNullOrWhiteSpace(TBQID.Text) || TBQID.Text.Length < 3)
            {
                MessageBox.Show("No question is currently loaded. Please select a question before saving.");
                return;
            }

            aq = int.Parse(TBAQ.Text);
            mq = int.Parse(TBMQ.Text);
            ra = Session["ra"] != null ? Convert.ToInt32(Session["ra"]) : 0;
            wa = Session["wa"] != null ? Convert.ToInt32(Session["wa"]) : 0;

            if (!string.IsNullOrWhiteSpace(ans))
            {
                aq++;
                mq--;

                TBAQ.Text = aq.ToString();
                TBMQ.Text = mq.ToString();

                string ansCol, qCol;
                if (TBQID.Text.StartsWith("PQ") && TBQID.Text.Length >= 3)
                {
                    ansCol = $"PAnswer{TBQID.Text.Substring(2)}";
                    qCol = $"PQID{TBQID.Text.Substring(2)}";
                }
                else if ((TBQID.Text.StartsWith("AMQ") || TBQID.Text.StartsWith("AEQ") || TBQID.Text.StartsWith("ALQ")) && TBQID.Text.Length >= 4)
                {
                    ansCol = $"AAnswer{TBQID.Text.Substring(3)}";
                    qCol = $"AQID{TBQID.Text.Substring(3)}";
                }
                else
                {
                    MessageBox.Show("Invalid Question ID format.");
                    return;
                }

                using (SqlCommand cmd = new SqlCommand($"UPDATE Test SET {qCol}=@qid, {ansCol}=@ans WHERE UserID=@uid", con))
                {
                    cmd.Parameters.AddWithValue("@qid", TBQID.Text);
                    cmd.Parameters.AddWithValue("@ans", ans);
                    cmd.Parameters.AddWithValue("@uid", TBUID.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                string table = TBQID.Text.StartsWith("PQ") ? "PersonalityQuestion" : "AptitudeQuestion";
                using (SqlCommand cmd = new SqlCommand($"SELECT Answer FROM {table} WHERE QuestionID=@qid", con))
                {
                    cmd.Parameters.AddWithValue("@qid", TBQID.Text);
                    con.Open();
                    string correctAns = (string)cmd.ExecuteScalar();
                    con.Close();

                    if (ans.Trim() == correctAns.Trim())
                        ra++;
                    else
                        wa++;
                }

                Session["attempted"] = aq;
                Session["missed"] = mq;
                Session["ra"] = ra;
                Session["wa"] = wa;
            }
        }


        //private void Save()
        //{
        //    string ans = RBO1.Checked ? RBO1.Text :
        //                 RBO2.Checked ? RBO2.Text :
        //                 RBO3.Checked ? RBO3.Text :
        //                 RBO4.Checked ? RBO4.Text :
        //                 RBO5.Checked ? RBO5.Text : "";

        //    // Load current session or textbox values
        //    aq = int.Parse(TBAQ.Text);
        //    mq = int.Parse(TBMQ.Text);
        //    ra = Session["ra"] != null ? Convert.ToInt32(Session["ra"]) : 0;
        //    wa = Session["wa"] != null ? Convert.ToInt32(Session["wa"]) : 0;

        //    if (!string.IsNullOrWhiteSpace(ans))
        //    {
        //        aq++;
        //        mq--;

        //        TBAQ.Text = aq.ToString();
        //        TBMQ.Text = mq.ToString();

        //        string table = TBQID.Text.StartsWith("PQ") ? "PersonalityQuestion" : "AptitudeQuestion";
        //        string ansCol = TBQID.Text.StartsWith("PQ") ? $"PAnswer{TBQID.Text.Substring(2)}" : $"AAnswer{TBQID.Text.Substring(3)}";
        //        string qCol = TBQID.Text.StartsWith("PQ") ? $"PQID{TBQID.Text.Substring(2)}" : $"AQID{TBQID.Text.Substring(3)}";

        //        using (SqlCommand cmd = new SqlCommand($"UPDATE Test SET {qCol}=@qid, {ansCol}=@ans WHERE UserID=@uid", con))
        //        {
        //            cmd.Parameters.AddWithValue("@qid", TBQID.Text);
        //            cmd.Parameters.AddWithValue("@ans", ans);
        //            cmd.Parameters.AddWithValue("@uid", TBUID.Text);

        //            con.Open();
        //            cmd.ExecuteNonQuery();
        //            con.Close();
        //        }

        //        using (SqlCommand cmd = new SqlCommand($"SELECT Answer FROM {table} WHERE QuestionID=@qid", con))
        //        {
        //            cmd.Parameters.AddWithValue("@qid", TBQID.Text);
        //            con.Open();
        //            string correctAns = (string)cmd.ExecuteScalar();
        //            con.Close();

        //            if (ans.Trim() == correctAns.Trim())
        //                ra++;
        //            else
        //                wa++;
        //        }

        //        // ✅ Save back to Session too
        //        Session["attempted"] = aq;
        //        Session["missed"] = mq;
        //        Session["ra"] = ra;
        //        Session["wa"] = wa;
        //    }
        //}


        //private void Save()
        //{
        //    string ans = RBO1.Checked ? RBO1.Text :
        //                 RBO2.Checked ? RBO2.Text :
        //                 RBO3.Checked ? RBO3.Text :
        //                 RBO4.Checked ? RBO4.Text :
        //                 RBO5.Checked ? RBO5.Text : "";

        //    if (!string.IsNullOrWhiteSpace(ans))
        //    {
        //        aq++;
        //        mq--;
        //        TBAQ.Text = aq.ToString();
        //        TBMQ.Text = mq.ToString();

        //        string table = TBQID.Text.StartsWith("PQ") ? "PersonalityQuestion" : "AptitudeQuestion";
        //        string idCol = TBQID.Text;
        //        string ansCol = TBQID.Text.StartsWith("PQ") ? $"PAnswer{TBQID.Text.Substring(2)}" : $"AAnswer{TBQID.Text.Substring(3)}";
        //        string qCol = TBQID.Text.StartsWith("PQ") ? $"PQID{TBQID.Text.Substring(2)}" : $"AQID{TBQID.Text.Substring(3)}";

        //        using (SqlCommand cmd = new SqlCommand($"UPDATE Test SET {qCol}=@qid, {ansCol}=@ans WHERE UserID=@uid", con))
        //        {
        //            cmd.Parameters.AddWithValue("@qid", TBQID.Text);
        //            cmd.Parameters.AddWithValue("@ans", ans);
        //            cmd.Parameters.AddWithValue("@uid", TBUID.Text);

        //            con.Open();
        //            cmd.ExecuteNonQuery();
        //            con.Close();
        //        }

        //        using (SqlCommand cmd = new SqlCommand($"SELECT Answer FROM {table} WHERE QuestionID=@qid", con))
        //        {
        //            cmd.Parameters.AddWithValue("@qid", TBQID.Text);
        //            con.Open();
        //            string correctAns = (string)cmd.ExecuteScalar();
        //            con.Close();

        //            if (ans.Trim() == correctAns.Trim()) ra++;
        //            else wa++;
        //        }
        //    }
        //}

        private void clear()
        {
            TBQuestion.Text = "";
            TBQID.Text = "";
            clearSelections();
        }

        private void clearSelections()
        {
            RBO1.Checked = false;
            RBO2.Checked = false;
            RBO3.Checked = false;
            RBO4.Checked = false;
            RBO5.Checked = false;
        }
    }
}
