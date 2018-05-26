using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Timers;
public partial class quickTest : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Admin\Documents\StudentIA.mdf;Integrated Security=True;Connect Timeout=30");
    SqlCommand comm = new SqlCommand();

    static DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

       
        if (!Page.IsPostBack)
        {


            comm.Connection = conn;
            comm.CommandText = "select distinct(Sub) from quiz";
            conn.Open();
            SqlDataReader dr = comm.ExecuteReader();

            dd_sub.DataSource = dr;
            dd_sub.DataTextField = "sub";
            dd_sub.DataBind();
            dd_sub.Items.Insert(0, new ListItem("--Select--", "0"));
            conn.Close();
            btnTryAgain.Visible = false;
            btnBackToHomePage.Visible = false;


        }
    }
    static int index = 0;
    static int answer = 0;
    static int wrong = 0;
    static int skip = 0;
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        RadioButton1.Enabled = true;
        RadioButton2.Enabled = true;
        RadioButton3.Enabled = true;
        RadioButton4.Enabled = true;
        // Button2.Enabled = true;
        if (btnSubmit.Text == "Next")
        {
            string user_ans = "";
            if (RadioButton1.Checked == true)
            {
                user_ans = "1";
            }
            else if (RadioButton2.Checked == true)
            {
                user_ans = "2";
            }
            else if (RadioButton3.Checked == true)
            {
                user_ans = "3";
            }
            else if (RadioButton4.Checked == true)
            {
                user_ans = "4";
            }
            string cor_ans = ds.Tables[0].Rows[index]["ans"].ToString();
            if (user_ans == cor_ans)
            {
                answer++;
            }
            else
            {
                wrong++;
            }
            index++;

            Label1.Text = ds.Tables[0].Rows[index]["que"].ToString();
            RadioButton1.Text = ds.Tables[0].Rows[index]["op1"].ToString();
            RadioButton2.Text = ds.Tables[0].Rows[index]["op2"].ToString();
            RadioButton3.Text = ds.Tables[0].Rows[index]["op3"].ToString();
            RadioButton4.Text = ds.Tables[0].Rows[index]["op4"].ToString();
            RadioButton1.Checked = false;
            RadioButton2.Checked = false;
            RadioButton3.Checked = false;
            RadioButton4.Checked = false;
            btnSkip.Enabled = true;

            if (ds.Tables[0].Rows.Count == index + 1)
            {
                btnSubmit.Text = "Submit";
                //Button2.Visible = false;
            }

        }
        else
        {
            string user_ans = "";
            if (RadioButton1.Checked == true)
            {
                user_ans = "1";
            }
            else if (RadioButton2.Checked == true)
            {
                user_ans = "2";
            }
            else if (RadioButton3.Checked == true)
            {
                user_ans = "3";
            }
            else if (RadioButton4.Checked == true)
            {
                user_ans = "4";
            }
            string cor_ans = ds.Tables[0].Rows[index]["ans"].ToString();
            if (user_ans == cor_ans)
            {
                answer++;
            }
            else
            {
                wrong++;
            }
            Label2.ForeColor = System.Drawing.Color.Green;
            Label3.ForeColor = System.Drawing.Color.Red;
            Label4.ForeColor = System.Drawing.Color.Blue;
            Label2.Text = "Correct Ans = " + answer.ToString();
            Label3.Text = "Incorrect Ans = " + wrong.ToString();
            Label4.Text = "Skipped Question = " + skip.ToString();

            btnTryAgain.Visible = true;
            btnBackToHomePage.Visible = true;
            btnSubmit.Enabled = false;

           
            index = 0;
            answer = 0;
            skip = 0;
            wrong = 0;
        }

    }
    protected void show(object sender, EventArgs e)
    {
        RadioButton1.Enabled = false;
        RadioButton2.Enabled = false;
        RadioButton3.Enabled = false;
        RadioButton4.Enabled = false;
        btnSkip.Enabled = false;

    }
    //skip
    protected void btnSkip_Click(object sender, EventArgs e)
    {

      
       

        RadioButton1.Enabled = true;
        RadioButton2.Enabled = true;
        RadioButton3.Enabled = true;
        RadioButton4.Enabled = true;

        if (btnSubmit.Text == "Next")
        {
            string user_ans = "";
            if (RadioButton1.Checked == true)
            {
                user_ans = "1";
            }
            else if (RadioButton2.Checked == true)
            {
                user_ans = "2";
            }
            else if (RadioButton3.Checked == true)
            {
                user_ans = "3";
            }
            else if (RadioButton4.Checked == true)
            {
                user_ans = "4";
            }
            string cor_ans = ds.Tables[0].Rows[index]["ans"].ToString();
            if (user_ans == cor_ans)
            {
                answer++;
            }
            else
            {
                wrong++;
            }
            index++;
            skip++;
            Label1.Text = ds.Tables[0].Rows[index]["que"].ToString();
            RadioButton1.Text = ds.Tables[0].Rows[index]["op1"].ToString();
            RadioButton2.Text = ds.Tables[0].Rows[index]["op2"].ToString();
            RadioButton3.Text = ds.Tables[0].Rows[index]["op3"].ToString();
            RadioButton4.Text = ds.Tables[0].Rows[index]["op4"].ToString();
            RadioButton1.Checked = false;
            RadioButton2.Checked = false;
            RadioButton3.Checked = false;
            RadioButton4.Checked = false;
            btnSkip.Enabled = true;

            if (ds.Tables[0].Rows.Count == index + 1)
            {
                btnSubmit.Text = "Submit";

            }

        }

        else if (ds.Tables[0].Rows.Count == index + 1)
        {

            skip++;
            string user_ans = "";
            if (RadioButton1.Checked == true)
            {
                user_ans = "1";
            }
            else if (RadioButton2.Checked == true)
            {
                user_ans = "2";
            }
            else if (RadioButton3.Checked == true)
            {
                user_ans = "3";
            }
            else if (RadioButton4.Checked == true)
            {
                user_ans = "4";
            }
            string cor_ans = ds.Tables[0].Rows[index]["ans"].ToString();
            if (user_ans == cor_ans)
            {
                answer++;
            }
            else
            {
                wrong++;
            }
            Label2.ForeColor = System.Drawing.Color.Green;
            Label3.ForeColor = System.Drawing.Color.Red;
            Label4.ForeColor = System.Drawing.Color.Blue;
            Label6.ForeColor = System.Drawing.Color.Black;
            Label6.Text = "Quiz Result :";
            Label2.Text = "Correct Ans = " + answer.ToString();
            Label3.Text = "Incorrect Ans = " + wrong.ToString();
            Label4.Text = "Skipped Question = " + skip.ToString();

            btnTryAgain.Visible = true;
            btnBackToHomePage.Visible = true;
            btnSubmit.Enabled = false;
            btnSkip.Enabled = false;
            RadioButton1.Enabled = false;
            RadioButton2.Enabled = false;
            RadioButton3.Enabled = false;
            RadioButton4.Enabled = false;
            index = 0;
            answer = 0;
            skip = 0;
            wrong = 0;

        }

    }

    protected void btnGo_Click1(object sender, EventArgs e)
    {
        
            btnHome.Visible = false;
            Label5.Text = dd_sub.Text;
            ds.Clear();
            index = 0;
            answer = 0;
            SqlDataAdapter da = new SqlDataAdapter("select * from quiz where sub='" + dd_sub.Text+ "' and dept='"+DropDownList2.Text+"'", conn);
            da.Fill(ds);
            Label1.Text = ds.Tables[0].Rows[0]["que"].ToString();
            RadioButton1.Text = ds.Tables[0].Rows[0]["op1"].ToString();
            RadioButton2.Text = ds.Tables[0].Rows[0]["op2"].ToString();
            RadioButton3.Text = ds.Tables[0].Rows[0]["op3"].ToString();
            RadioButton4.Text = ds.Tables[0].Rows[0]["op4"].ToString();
            MultiView1.ActiveViewIndex = 0;
            Panel1.Visible = false;
       
      
    }
    protected void btnBackToHomePage_Click(object sender, EventArgs e)
    {
        Response.Redirect("dashboard.aspx");
    }
    protected void btnTryAgain_Click(object sender, EventArgs e)
    {
        Response.Redirect("quickTest.aspx");
    }

    
    

    //.............................................................../////////////////





    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("dashboard.aspx");
    }
   
}