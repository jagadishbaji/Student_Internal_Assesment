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

public partial class Admin_add_faculty : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlCommand cm;
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

    protected void fill_repeater()
    {
        st = "select * from Faculty";
        db.fill_rptr_ret_sqlda(st, Repeater1);
        if (Repeater1.Items.Count > 0)
            pnl_rpt.Visible = true;
        else
            pnl_rpt.Visible = false;

    }

    protected void lnk_save_Click(object sender, EventArgs e)
    {
        st = "insert into faculty (name,email,password,address,dept)values('" + txt_name.Text + "','" + txt_emailid.Text + "','" + txt_password.Text + "','" + txt_address.Text + "','" + dd_dept.Text + "')";

        int x = db.ExeQuery(st);
        if (x > 0)
        {
            emailaccount _emailaccount = new emailaccount();
            string mail_body = _emailaccount.email_content1("Your account has been created in Student IA. <br/><b>Password : " + txt_password.Text + "</b> ", "", "", "", "Account Created");
            _emailaccount.SendEmail(txt_emailid.Text, "", "", "Your account created", mail_body, true);
            fill_empty();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('success','Faculty Added successfully.');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Failed to add faculty');", true);
        }
        fill_repeater();
    }
    protected void fill_empty()
    {

        txt_emailid.Text = "";

        txt_name.Text = "";

        txt_password.Text = "";

    }

    protected void lnk_delete_Click(object sender, EventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        st = "delete from faculty where Faculty_id=" + lnk.CommandArgument;
        db.ExeQuery(st);
        fill_repeater();
    }
}