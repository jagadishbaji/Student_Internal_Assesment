using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_change_password : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("../Default.aspx");
        }
    }
    protected void lnk_save_Click(object sender, EventArgs e)
    {
        st = "update admin set password ='" + txt_newpassword.Text + "' where admin_id='" + Session["session_admin"].GetHashCode() + "' and password='" + txt_oldpwd.Text + "'";
        int x=db.ExeQuery(st);
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
    }
}