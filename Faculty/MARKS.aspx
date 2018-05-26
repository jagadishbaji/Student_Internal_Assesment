<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MARKS.aspx.cs" Inherits="Faculty_MARKS" %>

<%@ Register Src="~/Faculty/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/Faculty/sidemenu.ascx" TagPrefix="uc1" TagName="sidemenu" %>


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8" />
    <title>Student IA</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport' />

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/ionicons.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/admin-section.css" rel="stylesheet" type="text/css" />
    <link href="../css/custom.css" rel="stylesheet" type="text/css" />
    <link href="../js/plugins/croppic/css/croppic.css" rel="stylesheet" />
    <script src="../Admin/js/pikaday.js"></script>
    <script src="../Admin/js/pikaday.jquery.js"></script>
    <link href="../Admin/css/pikaday.css" rel="stylesheet" />

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
            <aside class="right-side">
                <section class="content-header">
                    <h1>Add Marks
                       
                        <small>Student Marks Sheet</small>
                    </h1>



                    <div class="col-lg-8">
                    
                           
                                <hr />
                                <asp:Panel ID="pnl_rpt" runat="server">
                                    <div style="width:89em;" class="box box-info">
                                        <div class="box-header">
                                            <h3 class="box-title">Enter Marks</h3>
                                        </div>
                                        <div  class="box-body">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <td>Dept.</td>
                                                            <td>Semester</td>
                                                            <td>Subjects</td>
                                                            <td>Max.</td>
                                                            <td>Assignment Max.</td>
                                                            <td>Obtained Assignmnt</td>
                                                            <td>1st Minor</td>
                                                            <td>2nd Minor</td>
                                                            
                                                        </tr>
                                                    </thead>
                                                    <asp:Repeater ID="Repeater1" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td><%# Eval("dept") %></td>
                                                                <td><%# Eval("sem") %></td>
                                                                <td>
                                                                    <asp:TextBox ID="ReadText" runat="server" ReadOnly="true" Text='<%#Eval("title") %>'></asp:TextBox></td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_max" runat="server"></asp:TextBox></td>

                                                               
                                                                 <td>
                                                                    <asp:TextBox ID="txt_assign_max" runat="server"></asp:TextBox>
                                                                </td>
                                                                 <td>
                                                                    <asp:TextBox ID="txt_assign" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txt_min1" runat="server"></asp:TextBox>
                                                                </td>

                                                                <td>
                                                                    <asp:TextBox ID="txt_min2" runat="server"></asp:TextBox>
                                                                </td>

                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </table>
                                            </div>
                                        </div>
                                         &nbsp; &nbsp; &nbsp;     
                                <asp:Button ID="Submit" class=" btn btn-default" runat="server" Text="Submit" OnClick="Submit_Click1" />
                                        <br /> <br />
                                    </div>

                                </asp:Panel>
                                <hr />
                                <br />
                               


                                <hr />



                       
                            <br />
                     
                    </div>
                </section>

            </aside>
            <!-- /#page-wrapper -->
        </div>
        <!-- /#wrapper -->
        <script src="../js/jquery.js"></script>
        <!-- Bootstrap -->
        <script src="../js/bootstrap.min.js"></script>

        <!-- AdminLTE App -->
        <script src="../js/AdminLTE/app.js"></script>
        <script src="../js/plugins/croppic/js/croppic.min.js"></script>
    </form>
</body>
</html>
