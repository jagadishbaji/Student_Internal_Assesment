﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="change-password.aspx.cs" Inherits="faculty_change_password" %>


<%@ Register Src="~/Faculty/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/Faculty/sidemenu.ascx" TagPrefix="uc1" TagName="sidemenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Student IA</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

  <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/ionicons.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/admin-section.css" rel="stylesheet" type="text/css" />
    <link href="../css/custom.css" rel="stylesheet" type="text/css" />
    <link href="../js/plugins/croppic/css/croppic.css" rel="stylesheet" />
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>
<body class="skin-black">
    <form id="form1" runat="server">
        <uc1:header runat="server" ID="header" />
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <uc1:sidemenu runat="server" ID="sidemenu" />
            <!-- This is the place to put all your content -->
            <aside class="right-side">
                <!-- Heading section of page -->
                <section class="content-header">
                    <h1>Change Password
                       
                        <small>Change password frequently to secure account</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                        <li class="active">Change Passwrord</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <div class="container">
                        <div class="col-lg-4">
                            <div class="box box-info">
                                <div class="box-header">
                                    <i class="glyphicon glyphicon-lock"></i>
                                    <h3 class="box-title">Change Passwrord</h3>
                                </div>
                                <div id="server-message"></div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label>Old Password</label>
                                        <asp:TextBox ID="txt_oldpwd" CssClass="form-control" MaxLength="8" placeholder="Old Password" TextMode="Password" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="Enter Old Password" ControlToValidate="txt_oldpwd"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label>New Password</label>
                                        <asp:TextBox ID="txt_newpassword" CssClass="form-control" MaxLength="8" placeholder="New Password" TextMode="Password" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" Display="Dynamic" ErrorMessage="Enter New Password" ControlToValidate="txt_newpassword"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm Password</label>
                                        <asp:TextBox ID="txt_cnfpwd" CssClass="form-control" MaxLength="8" placeholder="Confirm Password" TextMode="Password" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Enter Confirm Password" ControlToValidate="txt_cnfpwd"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="box-footer clearfix">
                                    <asp:LinkButton ID="lnk_save" class="pull-right btn btn-default" OnClick="lnk_save_Click" runat="server">Save <i class="fa fa-arrow-circle-right"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Main content -->
            </aside>
            <!-- All content section ends here-->
        </div>
        <script src="../js/jquery.js"></script>
        <!-- Bootstrap -->
        <script src="../js/bootstrap.min.js"></script>

        <!-- AdminLTE App -->
        <script src="../js/AdminLTE/app.js"></script>
        <script>
            function showalert(type, message) {
                if (type == "success")
                    var content = '<div class="alert alert-success alert-dismissable"><i class="fa fa-check"></i><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><b>Success!</b> ' + message + '.</div>';
                if (type == "error")
                    var content = '<div class="alert alert-danger alert-dismissable"><i class="fa fa-ban"></i><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><b>Alert!</b> ' + message + '.</div>';
                if (type == "warning")
                    var content = '<div class="alert alert-warning alert-dismissable"><i class="fa fa-warning"></i><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><b>Warning!</b> ' + message + '.</div>';

                $("#server-message").empty().append(content);
            }
        </script>
    </form>
</body>
</html>
