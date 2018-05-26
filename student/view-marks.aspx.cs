using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Data.SqlClient;
using System.Web.Security;
using System.Drawing;
using System.Data;


public partial class student_view_marks : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlCommand cm;
    DataTable dt;
    SqlDataAdapter sqlda;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["student"] == null)
        {
            Response.Redirect("../Default.aspx");
        }
        else
        {
            string st = "select Reg_number,sub as Subjects,Total_Maximum,Assignment_Maximum,assign as Assignment,Minor1,Minor2,Total from MarksCard where Reg_number=" + Session["student"] + "";
            db.fill_grid_ret_sqlda(st, GridView1);
        string str="select sum(Total) from MarksCard where Reg_number=" + Session["student"] + "";
        SqlDataReader dr = db.sqldr(str); 
            while (dr.Read())
            {
                Label1.Text = dr.GetValue(0).ToString();
            }
            dr.Close();
        
        }
     
         
    }
 
   
   
    }
    
