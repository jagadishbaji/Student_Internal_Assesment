﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class header : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
   
    protected void Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://www.google.com");
    }
}