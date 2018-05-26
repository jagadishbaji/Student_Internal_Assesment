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
using System.Web.Security;



public partial class Faculty_dashboard : System.Web.UI.Page
{
    mydb db=new mydb();
    SqlDataAdapter sqlda;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["faculty"] != null)
        {
            sqlda = new SqlDataAdapter("SELECT * from faculty where email='" + Session["faculty"].ToString() + "'", db.db);
            DataTable dt = new DataTable();
            sqlda.Fill(dt);

        }
        else
        {
            Response.Redirect("../Default.aspx");
        }
    }
    protected void logout_Click1(object sender, EventArgs e)
    {
         Session.Clear();
        Response.Redirect("login.aspx");
    }
}