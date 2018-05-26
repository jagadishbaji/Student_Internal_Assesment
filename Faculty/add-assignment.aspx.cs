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

public partial class Faculty_add_assignment : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlCommand cmd;
    static int sub_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Faculty"] == null)
        {
            Response.Redirect("../Default.aspx");
        }
        else
        {


            fill_repeater();
        }
    }
    protected void fill_repeater()
    {
        st = "select * from assignment";
        db.fill_rptr_ret_sqlda(st, Repeater1);
        if (Repeater1.Items.Count > 0)
            pnl_rpt.Visible = true;
        else
            pnl_rpt.Visible = false;

    }
    protected void dd_sem_SelectedIndexChanged(object sender, EventArgs e)
    {
        string st = "select * from subjects where dept= '" + dd_dept.Text + "' and sem=" + dd_sem.Text + " ";
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
    protected void lnk_save_Click(object sender, EventArgs e)
    {
        st = "insert into assignment values('" + dd_dept.Text + "','"+dd_sub.Text+"'," + dd_sem.Text + ",'" + txt_que.Text + "','" + txt_date.Text + "')";
        int y = db.ExeQuery(st);
        if(y>0)
        {
        Response.Write("<script>alert('Assignment Added, Thank you...')</script>");

        }
        else
        {
         Response.Write("<script>alert('Failed, Try again...')</script>");

        }
        
    }
    protected void lnk_delete_Click(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        st = "delete from assignment where id=" + lnk.CommandArgument;
        int j=db.ExeQuery(st);
        if (j > 0)
        {
            Response.Write("<script>alert('Assignment Deleted...')</script>");

        }
        else
        {
            Response.Write("<script>alert('Failed, Try again...')</script>");

        }
        fill_repeater();
    }
}