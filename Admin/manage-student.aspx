<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage-student.aspx.cs" Inherits="Admin_manage_student" %>

<%@ Register Src="~/Admin/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/Admin/sidemenu.ascx" TagPrefix="uc1" TagName="sidemenu" %>






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Student IA</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport' />

    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/ionicons.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/admin-section.css" rel="stylesheet" type="text/css" />
    <link href="../css/custom.css" rel="stylesheet" type="text/css" />
    <link href="../js/plugins/croppic/css/croppic.css" rel="stylesheet" />
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    <script src="../Admin/js/pikaday.js"></script>
    <script src="../Admin/js/pikaday.jquery.js"></script>
    <link href="../Admin/css/pikaday.css" rel="stylesheet" />
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
                    <h1>Manage Students
                       
                        <small></small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                        <li class="active">Manage Students</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="container">
                        <div class="col-lg-4">
                            <div class="box box-info">
                                <div class="box-header">
                                </div>
                                <div id="server-message"></div>
                                <div class="box-body">
                                    

                                    <i class="fa fa-user"></i>
                                    <label>Full Name</label>
                                    <asp:TextBox ID="txt_name" CssClass="form-control" placeholder="Full name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="g1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter FullName" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_name"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="g1" ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ErrorMessage="Enter Characters Only" ForeColor="Red" ControlToValidate="txt_name" ValidationExpression="[a-z A-Z]+"></asp:RegularExpressionValidator>
                                    <br />
                                    <label>Date-Of-Birth</label>
                                    &nbsp;&nbsp;&nbsp;
                                        <asp:TextBox ID="txt_date" placeholder="Birth Date" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <label>Gender</label>
                                    <asp:DropDownList ID="dd_gender" runat="server" ForeColor="#0099FF" Height="24px" Width="222px">

                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>

                                    <br />
                                    <i class="fa fa-home"></i>
                                    <label>Address</label>
                                    <asp:TextBox ID="txt_address" TextMode="MultiLine" CssClass="form-control" placeholder="Address" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="g1" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter address" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_address"></asp:RequiredFieldValidator>

                                    <i class="fa fa-mobile"></i>
                                    <label>Mobile</label>
                                    <asp:TextBox ID="txt_mobile" CssClass="form-control" placeholder="Mobile Num" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="g1" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Number" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_mobile"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="g1" ID="RegularExpressionValidator4" Display="Dynamic" runat="server" ErrorMessage="Enter 10 digits" ForeColor="Red" ControlToValidate="txt_mobile" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                                    <i class="fa fa-envelope"></i>
                                    <label>Email ID</label>
                                    <asp:TextBox ID="txt_emailid" CssClass="form-control" placeholder="Email ID" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="g1" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Email ID" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_emailid"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="g1" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid EmailId" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_emailid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                                    <i class="fa fa-lock"></i>
                                    <label>Password</label>
                                    <asp:TextBox ID="txt_password" CssClass="form-control" placeholder="Password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="g1" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Password" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_name"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="g1" ID="RegularExpressionValidator3" Display="Dynamic" runat="server" ErrorMessage="Enter Password" ForeColor="Red" ControlToValidate="txt_password" ValidationExpression="[a-z A-Z 0-9]+"></asp:RegularExpressionValidator>

                                    <br />
                                    <label>Select Department</label>
                                    <asp:DropDownList ID="dd_dept" runat="server" ForeColor="#0099FF" Height="24px" Width="222px">
                                        <asp:ListItem>Select Dept.</asp:ListItem>
                                        <asp:ListItem>CS</asp:ListItem>
                                        <asp:ListItem>Electrical</asp:ListItem>
                                        <asp:ListItem>Mech</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                    <label>Select Semester</label>
                                    <br />
                                    <asp:DropDownList ID="dd_sem" runat="server" ForeColor="#0099FF" Height="24px" Width="222px">
                                        <asp:ListItem>Select Sem.</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                    </asp:DropDownList>


                                </div>
                                <div class="box-footer clearfix">
                                    <asp:LinkButton ID="LinkButton1" ValidationGroup="g1" class="pull-right btn btn-default" OnClick="lnk_save_Click" runat="server">Save <i class="fa fa-arrow-circle-right"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>




                        <div class="clearfix"></div>
                        <div class="col-lg-11">
                            <asp:Panel ID="pnl_rpt" runat="server">
                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="box-title">List of Students</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover table-bordered">
                                                <thead>
                                                    <tr>
                                                        <td>FullNname</td>

                                                        <td>Register Number</td>
                                                        <td>DOB</td>
                                                        <td>Gender </td>
                                                        <td>Address</td>
                                                        <td>Mobile  </td>
                                                        <td>Email</td>
                                                        <td>Dept</td>
                                                        <td>Delete</td>
                                                    </tr>
                                                </thead>
                                                <asp:Repeater ID="Repeater1" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%# Eval("fullname") %></td>
                                                            <td><%# Eval("Reg_number") %></td>
                                                            <td><%# Eval("dob") %></td>
                                                            <td><%# Eval("gender") %></td>
                                                            <td><%# Eval("address") %></td>

                                                            <td><%# Eval("mobile") %></td>
                                                            <td><%# Eval("email") %></td>
                                                            <td><%# Eval("dept") %></td>
                                                            <td>
                                                                <asp:LinkButton ID="lnk_delete" ToolTip="Delete" CommandArgument='<%# Eval("Reg_number") %>' OnClick="lnk_delete_Click" runat="server"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>

                    </div>
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
            var picker = new Pikaday(
             {
                 field: document.getElementById('txt_date'),
                 firstDay: 1,
                 minDate: new Date('1980-12-30'),
                 maxDate: new Date(1998 - 12 - 30),
                 yearRange: [1980, 1998],
                 dateFormat: 'DD-MM-YYYY'
             });
        </script>
    </form>
</body>
</html>
