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


public partial class Admin_Add_subject : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("../Default.aspx");
        }
        else
        {
            fill_repeater();
        }
    }

    protected void lnkSave_Click(object sender, EventArgs e)
    {
        st = "Insert into subjects values('" + txt_title.Text + "','" + txt_Code.Text + "','" + dd_dept.Text + "'," + dd_sem.Text + "," + txt_units.Text + "," + txt_cr.Text + ")";
        int x = db.ExeQuery(st);
        if (x > 0)
        { 
         ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('success','Subject Added successfully.');", true);
           
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Failed ');", true);
        }
        fill_repeater();
        txt_Code.Text = txt_cr.Text = txt_title.Text = txt_units.Text = "";
        
    }
    protected void fill_repeater()
    {
        st = "select * from Subjects";
        db.fill_rptr_ret_sqlda(st, Repeater1);
        if (Repeater1.Items.Count > 0)
            pnl_rpt.Visible = true;
        else
            pnl_rpt.Visible = false;

    }
    protected void lnk_delete_Click(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;

        st = "delete  from subjects where Id=" + lnk.CommandArgument;
        db.ExeQuery(st);

        fill_repeater();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('success','Subject Deleted successfully.');", true);
    
    }
}