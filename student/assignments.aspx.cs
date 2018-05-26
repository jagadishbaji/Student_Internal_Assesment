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

public partial class student_assignments : System.Web.UI.Page
{
    mydb db = new mydb();
    SqlDataAdapter sqlda;
    DataTable dt;
    SqlCommand cm;
    DataSet ds;
    string sub = "";
    string st = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["student"] == null)
        {
            Response.Redirect("../Default.aspx");

        }
        else
        {
            sub = Request.QueryString["tittle"].ToString();
            fill_repeater();
        }
    }
    protected void fill_repeater()
    {
        st = "select * from assignment where dept='"+Session["dept"]+"' and subject="+sub+" and sem="+Session["sem"]+"";
        db.fill_rptr_ret_sqlda(st, Repeater1);
        if (Repeater1.Items.Count > 0)
            pnl_rpt.Visible = true;
        else
            pnl_rpt.Visible = false;

    }
  
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in Repeater1.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                FileUpload fu = (FileUpload)item.FindControl("FileUpload1");
                if (fu.HasFile)
                {
                    string path = Server.MapPath("~/Doc/");
                    string fileName = Path.GetFileName(fu.FileName);
                    string fileExt = Path.GetExtension(fu.FileName).ToLower();
                    fu.SaveAs(path + fileName + fileExt);

                   
                }
                else
                {
                    Response.Write("<script>alert('Select Document')</script>");
                }
            }
        }
    }
}