using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class faculty_change_password : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["faculty"] == null)
        {
            Response.Redirect("../Default.aspx");
        }
    }
    protected void lnk_save_Click(object sender, EventArgs e)
    {
        st = "update faculty set password ='" + txt_newpassword.Text + "' where faculty_id='" + Session["session_faculty"].GetHashCode()+ "' and password='" + txt_oldpwd.Text + "'";
        int x = db.ExeQuery(st);
        if (x > 0)
        {
            if (txt_newpassword.Text == txt_cnfpwd.Text)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('success','Details Updated successfully.');", true);
            }
            else
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Updation failed please try later.');", true);
            }
        }
        else
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Updation failed please try later.');", true);
        }
        fill_empty();
    }
    public void fill_empty()
    {

        txt_cnfpwd.Text = "";
        txt_newpassword.Text = "";
        txt_oldpwd.Text = "";
    }
}