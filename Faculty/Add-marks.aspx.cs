using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class Faculty_Add_marks : System.Web.UI.Page
{
    mydb db = new mydb();
    SqlCommand cmd;
    string st = "";
    string sub = "";

    static int maximum, minor1, minor2, assignment, grand, assign_max;
    static int total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Faculty"] == null)
        {
            Response.Redirect("../Default.aspx");
        }
        /*if(!IsPostBack)
        {
            cmd = new SqlCommand("select distinct Reg_number from student ", db.db);
            int x=cmd.ExecuteNonQuery();
            SqlDataReader re = cmd.ExecuteReader();
            while (re.Read())
            {
                DropDownList1.Items.Add(re["Reg_number"].ToString());
            }
            re.Close();
        }*/
       
        
    }

    protected void fill_repeater()
    {
        st = "select * from Subjects where dept='"+dd_dept.Text+"' and sem="+dd_sem.Text+"";
        db.fill_rptr_ret_sqlda(st, Repeater1);
        if (Repeater1.Items.Count > 0)
            pnl_rpt.Visible = true;
        else
            pnl_rpt.Visible = false;

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
       // mark1 = Int32.Parse(ans1.Text);
       
        foreach (Control item in Repeater1.Items)
        {
            TextBox SubText = (TextBox)item.FindControl("ReadText");
           // TextBox tb = (TextBox)item.FindControl("TextBox1") as TextBox;
            TextBox max = (TextBox)item.FindControl("txt_max") as TextBox;
            TextBox assign = (TextBox)item.FindControl("txt_assign") as TextBox;
            TextBox assignment_max = (TextBox)item.FindControl("txt_assign_max") as TextBox;
            TextBox min1 = (TextBox)item.FindControl("txt_min1") as TextBox;
            TextBox min2 = (TextBox)item.FindControl("txt_min2") as TextBox;
            maximum = Convert.ToInt16(max.Text);
            assignment = Convert.ToInt16(assign.Text);
            assign_max = Convert.ToInt16(assignment_max.Text);

              minor1 = Convert.ToInt16(min1.Text);
            minor2 = Convert.ToInt16(min2.Text);
            sub = SubText.Text;
            grand = assignment + minor1 + minor2;
           // insertion(sub, max, assignment, minor1, minor2, grand);
            insertion(sub, maximum, assignment,assign_max, minor1, minor2, grand);

        }
       
        /*
        string s= "insert into IAMarks values("+DropDownList1.Text+","+mark1+")";
        int x = db.ExeQuery(s);
        if (x > 0)
        {
            Response.Write("<script>alert('Marks added Succesfully , Thank you....')</script>");
        }*/

    }
    public void insertion(string sub, int max,int asssignment,int max_assign,int minor1,int minor2,int grand)
    { 
     string s = "insert into MarksCard values('" + dd_dept.Text + "'," + dd_sem.Text + "," + DropDownList1.Text + ",'" + sub + "',"+maximum+","+assignment+","+max_assign+","+minor1+","+minor2+","+grand+")";
        int b=db.ExeQuery(s);
        if (b > 0)
        {
            Response.Write("<script>alert('Marks added Succesfully , Thank you....')</script>");
        }
        else { Response.Write("<script>alert('Failed')</script>)"); }
    }
  
    
    protected void lnk_save_Click(object sender, EventArgs e)
    {
        fill_repeater();
    }

    protected void dd_sem_SelectedIndexChanged(object sender, EventArgs e)
    {
        string st = "Select distinct Reg_number from student where dept='" + dd_dept.Text + "' and sem=" + dd_sem.Text + "";
        //  cmd = new SqlCommand("select * from subjects where dept= '" + dd_dept.Text + "' and sem=" + dd_sem.Text + " ", db.db);

        //int x = cmd.ExecuteNonQuery();
        //SqlDataReader re = cmd.ExecuteReader();
        SqlDataReader dr = db.sqldr(st);
        DropDownList1.Items.Clear();
        while (dr.Read())
        {
            DropDownList1.Items.Add(dr["Reg_number"].ToString());
          

        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string st = "Select fullname from student where dept='" + dd_dept.Text + "' and sem=" + dd_sem.Text + " and Reg_number="+DropDownList1.Text+"";
        //  cmd = new SqlCommand("select * from subjects where dept= '" + dd_dept.Text + "' and sem=" + dd_sem.Text + " ", db.db);

        //int x = cmd.ExecuteNonQuery();
        //SqlDataReader re = cmd.ExecuteReader();
        SqlDataReader drs = db.sqldr(st);
       // DropDownList1.Items.Clear();
        while (drs.Read())
        {
            Label1.Text = drs["fullname"].ToString();


        }
    }
}