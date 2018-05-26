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



public partial class student_dashboard : System.Web.UI.Page
{
    mydb db=new mydb();
    SqlDataAdapter sqlda;
    DataTable dt;
    SqlCommand cm;
    DataSet ds;
    string st = "";
    public DataTable get_datatable(string st)
    {

        try
        {

            cm = new SqlCommand(st, db.db);
            sqlda = new SqlDataAdapter(cm);
            ds = new DataSet();
            ds.Tables.Clear();
            sqlda.Fill(ds, "recordset");
            db.db.Close();

        }
        catch (Exception) { }
        return ds.Tables["recordset"];
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["student"] == null)
        {
            Response.Redirect("../Default.aspx");

        }
        else
        {
            st = "select * from subjects where sem=" + Session["sem"] + " and dept='" + Session["dept"] + "'";
            db.fill_rptr_ret_sqlda(st, Repeater1);
            if (Repeater1.Items.Count > 0)
                pnl_rpt.Visible = true;
            else
                pnl_rpt.Visible = false;

        }
    }
    protected void logout_Click1(object sender, EventArgs e)
    {
         Session.Clear();
        Response.Redirect("../Default.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lnk=sender as LinkButton;
        Response.Redirect("assignments.aspx?tittle='" + lnk.CommandArgument + "'");
    }
}