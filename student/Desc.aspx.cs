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
using System.Data.SqlClient;

public partial class Desc : System.Web.UI.Page
{
    mydb db = new mydb();
    SqlCommand comm = new SqlCommand();
    DataTable dt;
    static DataSet ds = new DataSet();
    static int counter = 10;
   static  string fin1 = "";
   static string fin2 = ""; static string fin3 = ""; static string fin4 = ""; static string fin5 = "";
    string ans5;
    SqlCommand cm;
    SqlDataAdapter sqlda;
    
 int c;
    TimeSpan ts=DateTime.Now.TimeOfDay;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["student"] == null)
        {
            Response.Redirect("../Default.aspx");
        }
        else
        {
            string str = "select Reg_number from Answers where Reg_number=" + Session["student"] + "";
          dt= db.get_datatable(str);
                if(dt.Rows.Count>0)
                {
                    string j = dt.Rows[0]["Reg_number"].ToString();
                    string  b = Session["student"].ToString(); 
                    if (j ==b )
                    {
                        Response.Write("<script>alert('You have already attended Exam..');window.location.href ='dashboard.aspx' </script>");
      
                    }
                    
                }

          
        }
       
        if (!Page.IsPostBack)
        {
            Session["timer"] = DateTime.Now.AddHours(1).ToString();
            SqlConnection con=new System.Data.SqlClient.SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Admin\Documents\StudentIA.mdf;Integrated Security=True;Connect Timeout=30");
            con.Open();
            comm.Connection = con;
            comm.CommandText = "select distinct(dept) from questions";
            
            SqlDataReader dr = comm.ExecuteReader();

            DropDownList2.DataSource = dr;
            DropDownList2.DataTextField = "dept";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("--Select--", "0"));
            dr.Close();
            comm.Connection = con;
            comm.CommandText = "select distinct(subject) from questions";
           
            SqlDataReader drs = comm.ExecuteReader();

            DropDownList1.DataSource = drs;
            DropDownList1.DataTextField = "subject";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("--Select--", "0"));
           
          /*  btnTryAgain.Visible = false;
            btnBackToHomePage.Visible = false;*/


        }
    }
    static int index = 0;
    static int answer = 0;
    static int wrong = 0;
    static int skip = 0;
   
    protected void btnGo_Click1(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedValue == "CS")
        {
           // btnHome.Visible = false;
            Label5.Text = "C#";
            ds.Clear();
            index = 0;
            answer = 0;
            SqlDataAdapter da = new SqlDataAdapter("select * from questions where dept='CS' and subject='"+DropDownList1.Text+"'" , db.db);
            da.Fill(ds);
           
            Label1.Text = ds.Tables[0].Rows[0]["question"].ToString();
            cl.Text = ds.Tables[0].Rows[0]["cl_type"].ToString();
            MultiView1.ActiveViewIndex = 0;
            Panel1.Visible = false;
        }
        else if (DropDownList2.SelectedValue == "Electrical")
        {
            //btnHome.Visible = false;
            Label5.Text = "Java";
            ds.Clear();
            index = 0;
            answer = 0;
            SqlDataAdapter da = new SqlDataAdapter("select * from questions where dept='Electrical'", db.db);
            da.Fill(ds);
            Label1.Text = ds.Tables[0].Rows[0]["question"].ToString();
            cl.Text = ds.Tables[0].Rows[0]["cl_type"].ToString();
           
            MultiView1.ActiveViewIndex = 0;
            Panel1.Visible = false;
        }
        else if (DropDownList2.SelectedValue == "Mech")
        {
           // btnHome.Visible = false;
            Label5.Text = "HTML_CSS";
            ds.Clear();
            index = 0;
            answer = 0;
            SqlDataAdapter da = new SqlDataAdapter("select * from questions where dept='Mech'", db.db);
            da.Fill(ds);
            Label1.Text = ds.Tables[0].Rows[0]["question"].ToString();
            cl.Text = ds.Tables[0].Rows[0]["cl_type"].ToString();
           
            MultiView1.ActiveViewIndex = 0;
            Panel1.Visible = false;
        }

    }
   
    //skip
  
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
     
        // Button2.Enabled = true;
        
        if (btnSubmit.Text == "Next")
        {
            if (string.IsNullOrEmpty(fin1))
            {
                fin1 = TextBox1.Text;
            
            }
            else if (string.IsNullOrEmpty(fin2))
            {
                fin2 = TextBox1.Text;
               
            }
            else if (string.IsNullOrEmpty(fin3))
            {
                fin3 = TextBox1.Text;
               
            }
            else if (string.IsNullOrEmpty(fin4))
            {
                fin4 = TextBox1.Text;
              
            }
            else if (string.IsNullOrEmpty(fin5))
            {
                fin5 = TextBox1.Text;
               
            }
            index++;
            if (index == 5)
            {
                btnSubmit.Text = "Submit";
                //Button2.Visible = false;
                fin5 = TextBox1.Text;
            }

            else
            {
                Label1.Text = ds.Tables[0].Rows[index]["question"].ToString();
                cl.Text = ds.Tables[0].Rows[index]["cl_type"].ToString();
            }
            
           
        

            /*if (ds.Tables[0].Rows.Count == index + 0)
            {
                btnSubmit.Text = "Submit";
                //Button2.Visible = false;
                fin5 = TextBox1.Text;
            }*/
            TextBox1.Text = "";

        }
        else
        {
            string user_ans = "";


            string s = "Insert into Answers values (" + Session["student"] + ",'"+DropDownList3.Text+"','" + fin1.ToString() + "','" + fin2.ToString() + "','" + fin3.ToString() + "','" + fin4.ToString() + "','" + fin5.ToString() + "')";
          //  string st = "insert into answers values(" + Session["student"] + ",'" + fin1.ToString() + "','" + fin2.ToString() + "','" + fin3.ToString() + "','" + fin4.ToString() + "','" + fin5.ToString() + "')";
            int x = db.ExeQuery(s);
            if (x > 0)
            {
                Response.Write("<script>alert('Exam Over');window.location.href ='dashboard.aspx' </script>");
               
            }

           /* btnTryAgain.Visible = true;
            btnBackToHomePage.Visible = true;*/
            btnSubmit.Enabled = false;


            index = 0;
            answer = 0;
            skip = 0;
            wrong = 0;
        }

    }
    protected void btnTryAgain_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Default.aspx");
    }
    protected void btnBackToHomePage_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Default.aspx");
    }

    
    protected void timer_Tick(object sender, EventArgs e)
    {
        if (DateTime.Compare(DateTime.Now, DateTime.Parse(Session["timer"].ToString())) < 0)
        {
            
            litmsg.Text = "Time left :" + ((Int32)DateTime.Parse(Session["timer"].ToString()).Subtract(DateTime.Now).TotalMinutes).ToString()
                + "Minutes :" + (((Int32)DateTime.Parse(Session["timer"].ToString()).Subtract(DateTime.Now).TotalSeconds) % 60).ToString() + "Seconds";
        }
        else
        {
            litmsg.Text = "Try again";
        }
    }
}