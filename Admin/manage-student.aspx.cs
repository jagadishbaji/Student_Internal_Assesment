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

public partial class Admin_manage_student : System.Web.UI.Page
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
    protected void lnk_save_Click(object sender, EventArgs e)
    {
        st = "INSERT INTO student(fullname,dob,gender,address,email,mobile,password,dept,sem) VALUES('" + txt_name.Text + "','" + txt_date.Text + "','" + dd_gender.Text + "','" + txt_address.Text + "','" + txt_emailid.Text + "'," + txt_mobile.Text + ",'" + txt_password.Text + "','" + dd_dept.Text + "'," + dd_sem.Text + ")";

        int x = db.ExeQuery(st);
        if (x > 0)
        {
            emailaccount _emailConfig = new emailaccount();
            string mail_body = _emailConfig.email_content1("Your account has been created in Student IA. <br/><b>Password : " + txt_password.Text + "</b> ", "", "", "", "Account Created");
            _emailConfig.SendEmail(txt_emailid.Text, "", "", "Your account created", mail_body, true);
            fill_empty();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('success','Student Added successfully.');", true);
            fill_repeater();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Failed ');", true);
        }
    }

    protected void fill_repeater()
    {
        st = "select * from student";
        db.fill_rptr_ret_sqlda(st, Repeater1);
        if (Repeater1.Items.Count > 0)
            pnl_rpt.Visible = true;
        else
            pnl_rpt.Visible = false;

    }
    protected void lnk_delete_Click(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;

        st = "delete  from student where Reg_number=" + lnk.CommandArgument;
        db.ExeQuery(st);
       
        fill_repeater();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('success','Student Deleted successfully.');", true);
    }
    public void fill_empty()
    {
        txt_address.Text = "";
        txt_date.Text = "";
        txt_emailid.Text = "";
        txt_mobile.Text = "";
        txt_name.Text = "";
        txt_password.Text = "";
    }
}