<%@ Page Language="C#" AutoEventWireup="true" CodeFile="assignments.aspx.cs" Inherits="student_assignments" %>

<%@ Register Src="~/student/sidemenu.ascx" TagPrefix="uc1" TagName="sidemenu" %>
<%@ Register Src="~/student/head.ascx" TagPrefix="uc1" TagName="head" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student IA</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="card.css" rel="stylesheet" />
    <link href="../css/ionicons.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/admin-section.css" rel="stylesheet" type="text/css" />
    <link href="../css/custom.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    <style type="text/css">
        .user-row
        {
            margin-bottom: 14px;
        }

            .user-row:last-child
            {
                margin-bottom: 0;
            }

        .dropdown-user
        {
            margin: 13px 0;
            padding: 5px;
            height: 100%;
        }

            .dropdown-user:hover
            {
                cursor: pointer;
            }

        .table-user-information > tbody > tr
        {
            border-top: 1px solid rgb(221, 221, 221);
        }

            .table-user-information > tbody > tr:first-child
            {
                border-top: 0;
            }


            .table-user-information > tbody > tr > td
            {
                border-top: 0;
            }

        .toppad
        {
            margin-top: 20px;
        }
    </style>
</head>
<body class="skin-black">
    <form id="form1" runat="server">
        <uc1:head runat="server" ID="head" />
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <uc1:sidemenu runat="server" ID="sidemenu" />
            <aside class="right-side">
                <section class="content-header">
                    <h1>Dashboard
                       
                      
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                        <li class="active">Student Details</li>
                    </ol>
                    <div class="panel panel-info"></div>
                    <div class="panel-heading">

                    </div>
                     <asp:Panel ID="pnl_rpt" runat="server">
                        <div class="box box-info">
                            <div class="box-header">
                                <h3 class="box-title">Assignment List</h3>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <td>Dept.</td>
                                                <td>Semester</td>
                                               <td>Assignment Description</td>
                                                <td>Submission Date</td>
                                                <td>Select Document</td>
                                                <td>Upload</td>
                                            </tr>
                                        </thead>
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("dept") %></td>
                                                    <td><%# Eval("sem") %></td>
                                                    <td><%# Eval("desc") %></td>
                                                   
                                                    <td><%# Eval("date") %></td>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload1"  runat="server" />
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButton1" class="pull-right btn btn-default" OnClick="LinkButton1_Click" runat="server">Upload<i class="fa fa-arrow-circle-right"></i></asp:LinkButton>
                                                       </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </section>
            </aside>
        </div>







             <script src="../js/jquery.js"></script>
        <!-- Bootstrap -->
        <script src="../js/bootstrap.min.js"></script>

        <!-- AdminLTE App -->
        <script src="../js/AdminLTE/app.js"></script>
        <script src="../js/plugins/croppic/js/croppic.min.js"></script>
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
        <script type="text/javascript">
            $(document).ready(function () {
                var panels = $('.user-infos');
                var panelsButton = $('.dropdown-user');
                panels.hide();

                //Click dropdown
                panelsButton.click(function () {
                    //get data-for attribute
                    var dataFor = $(this).attr('data-for');
                    var idFor = $(dataFor);

                    //current button
                    var currentButton = $(this);
                    idFor.slideToggle(400, function () {
                        //Completed slidetoggle
                        if (idFor.is(':visible')) {
                            currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
                        }
                        else {
                            currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
                        }
                    })
                });


                $('[data-toggle="tooltip"]').tooltip();

                $('button').click(function (e) {
                    e.preventDefault();
                    alert("This is a demo.\n :-)");
                });
            });
</script>
    </form>
</body>
</html>
