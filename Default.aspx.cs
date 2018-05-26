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


public partial class Default : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    public static DataSet ds = new DataSet();
    mydb db = new mydb();
    SqlDataAdapter sqlda;
    SqlCommand cm;
    string st = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
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
    protected void login_Click(object sender, EventArgs e)
    {
        if (txt_emailid.Text.Length > 0 && txt_password.Text.Length > 0)
        {
            
             if (dd_login.Text == "Faculty")
            {
                st = "select * from Faculty where email='" + txt_emailid.Text + "' and Password='" + txt_password.Text + "'";
                dt = get_datatable(st);

                if (dt.Rows.Count > 0)
                {
                    int session_faculty = dt.Rows[0]["faculty_id"].GetHashCode();
                    Session["session_faculty"] = session_faculty;
                    Session["faculty"] = dt.Rows[0][0].ToString();
                    Faculty_details obj = new Faculty_details();
                    obj.EmailID = dt.Rows[0]["email"].ToString();
                    obj.name = dt.Rows[0]["name"].ToString();

                    Session["faculty_details"] = obj;
                    Response.Redirect("Faculty/dashboard.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Login failed');", true);
                }


            }

            else if (dd_login.Text == "Student")
            {
                st = "select * from student where email='" + txt_emailid.Text + "' and Password='" + txt_password.Text + "'";
                dt = get_datatable(st);
                Session["std"] = txt_emailid.Text;
                Session["std1"] = txt_password.Text;
                if (dt.Rows.Count > 0)
                {
                    int session_std = dt.Rows[0]["Reg_number"].GetHashCode();
                    int sem = dt.Rows[0]["sem"].GetHashCode();
                    Session["sem"] = sem;
                    Session["dept"]=dt.Rows[0]["dept"].ToString();
                    Session["session_std"] = session_std;
                    Session["student"] = dt.Rows[0][0].ToString();
                    student_details obj = new student_details();

                    obj.EmailID = dt.Rows[0]["email"].ToString();
                    obj.name = dt.Rows[0]["fullname"].ToString();

                    Session["student_details"] = obj;
                    Response.Redirect("student/dashboard.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Login failed');", true);
                }

            }
            else if (dd_login.Text == "Admin")
            {

                st = "select * from admin where email='" + txt_emailid.Text + "' and Password='" + txt_password.Text + "'";
                dt = get_datatable(st);

                if (dt.Rows.Count > 0)
                {
                    int session_admin = dt.Rows[0]["admin_id"].GetHashCode();
                    Session["session_admin"] = session_admin;
                    Session["admin"] = dt.Rows[0][0].ToString();
                    Adminlogin_details objAdminlogin_details = new Adminlogin_details();

                    objAdminlogin_details.fullname = dt.Rows[0]["Name"].ToString();
                    Session["Adminlogin_details"] = objAdminlogin_details;
                    Response.Redirect("Admin/dashboard.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "showalert('error','Login failed');", true);
                }
            }



        }

    }
}