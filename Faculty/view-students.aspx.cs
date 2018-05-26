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


public partial class faculty_view_students : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlCommand cm;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["faculty"] != null)
        {
            fill_repeater();
        }
        else
            {
                Response.Redirect("../Default.aspx");
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
  
}