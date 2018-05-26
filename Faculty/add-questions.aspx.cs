using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Drawing;
using System.IO;
using System.Xml;

public partial class Faculty_add_student : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlCommand cmd;
    static int sub_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["Faculty"]==null)
        {
            Response.Redirect("../Default.aspx");
        }
        fill_repeater();
    }
    protected void fill_repeater()
    {
        st = "select * from quiz";
        db.fill_rptr_ret_sqlda(st, Repeater1);
        if (Repeater1.Items.Count > 0)
            pnl_rpt.Visible = true;
        else
            pnl_rpt.Visible = false;

    }
    protected void lnk_save_Click(object sender, EventArgs e)
    {

       // string path = Server.MapPath("upload1/");

        st = "insert into quiz values ('" + dd_sub.Text + "','" + txt_que.Text + "','" + txt_a.Text + "','" + txt_b.Text + "','" + txt_c.Text + "','" + txt_d.Text + "',"+txt_ans.Text+",'"+dd_dept.Text+"',"+dd_sem.Text+")";
     
        int x =db.ExeQuery(st);
        if (x > 0)
        {
               fill_repeater1();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('success','Question Added successfully.');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Failed ');", true);
        }
        fill_repeater();

       }
    protected void logout_Click1(object sender, EventArgs e)
    {

    }
  
    protected void fill_repeater1()
    {
       
       
        txt_que.Text = "";
        txt_ans.Text = txt_a.Text = txt_b.Text = txt_c.Text = txt_d.Text = "";


    }
    protected void lnk_delete_Click(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        st = "delete from quiz where id=" + lnk.CommandArgument;
        db.ExeQuery(st);
        fill_repeater();
    }

    protected void dd_sem_SelectedIndexChanged(object sender, EventArgs e)
    {
        string st="select * from subjects where dept= '" + dd_dept.Text + "' and sem=" + dd_sem.Text + " ";
      //  cmd = new SqlCommand("select * from subjects where dept= '" + dd_dept.Text + "' and sem=" + dd_sem.Text + " ", db.db);
        
        //int x = cmd.ExecuteNonQuery();
        //SqlDataReader re = cmd.ExecuteReader();
        SqlDataReader dr = db.sqldr(st);
        dd_sub.Items.Clear();
        while (dr.Read())
        {
            dd_sub.Items.Add(dr["title"].ToString());
            sub_id = Convert.ToInt32(dr["Id"].ToString());

        }
       
    }
}