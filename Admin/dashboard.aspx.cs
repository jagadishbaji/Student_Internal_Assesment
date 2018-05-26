using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("../default.aspx");        
        }
       
    }

  
    protected void logout_Click1(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("login.aspx");
    }
}