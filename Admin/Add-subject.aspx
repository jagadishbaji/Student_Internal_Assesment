<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add-subject.aspx.cs" Inherits="Admin_Add_subject" %>

<%@ Register Src="~/Admin/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/Admin/sidemenu.ascx" TagPrefix="uc1" TagName="sidemenu" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StudentIA</title>
    
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
                    <h1>Manage Subject
                       
                        <small></small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
                        <li class="active">Manage Subjects</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="container">
                        <div class="col-md-4">
                            <div class="box box-info">
                                <div class="box-header">
                                </div>
                                <div id="server-message"></div>
                                <div class="box-body">

                                  
                                        <i class="fa fa-user"></i>
                                        <label>Title</label>
                                        <asp:TextBox ID="txt_title" CssClass="form-control" placeholder="Subject Title" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="g1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Subject" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_title"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ValidationGroup="g1" ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ErrorMessage="Enter Characters Only" ForeColor="Red" ControlToValidate="txt_title" ValidationExpression="[a-z A-Z]+"></asp:RegularExpressionValidator>

                                      <br />   <br /> 
                                        <i class="fa fa-envelope"></i>
                                        <label>Subject Code</label>
                                        <asp:TextBox ID="txt_Code" CssClass="form-control" placeholder="Subject Code" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="g1" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Subject Code" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_code"></asp:RequiredFieldValidator>
                                       
                                       <br />   <br /> 
                                    <label>Select Department</label>
                                        <asp:DropDownList ID="dd_dept" runat="server" ForeColor="#0099FF" Height="24px" Width="222px">
                                            <asp:ListItem>Select Dept.</asp:ListItem>
                                            <asp:ListItem>CS</asp:ListItem>
                                            <asp:ListItem>Electrical</asp:ListItem>
                                            <asp:ListItem>Mech</asp:ListItem>
                                        </asp:DropDownList>
                                  <br />   <br /> 
                                      <label>Select Semester</label><br />
                                        <asp:DropDownList ID="dd_sem" runat="server" ForeColor="#0099FF" Height="24px" Width="222px">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                             <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                        </asp:DropDownList>
                                  
                                    <br />   <br />
                                   <i class="fa fa-mobile"></i>
                                    <label>Units</label>
                                    <asp:TextBox ID="txt_units" CssClass="form-control" placeholder="Units" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="g1" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter units" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_units"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="g1" ID="RegularExpressionValidator4" Display="Dynamic" runat="server" ErrorMessage="Enter digits" ForeColor="Red" ControlToValidate="txt_units" ValidationExpression="[0-9]"></asp:RegularExpressionValidator>
                                    <br />
                                     <i class="fa fa-mobile"></i>
                                    <label>Credits</label>
                                    <asp:TextBox ID="txt_cr" CssClass="form-control" placeholder="Credits" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="g1" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Credits" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_cr"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="g1" ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ErrorMessage="Enter digits" ForeColor="Red" ControlToValidate="txt_cr" ValidationExpression="[0-9]"></asp:RegularExpressionValidator>

                                        <asp:Label ID="msg" runat="server"></asp:Label>
                                   
                                </div>
                                <div class="box-footer clearfix">
                                     <asp:LinkButton ID="lnkSave" OnClick="lnkSave_Click" ValidationGroup="g1" class="pull-right btn btn-default"  runat="server">Save <i class="fa fa-arrow-circle-right"></i></asp:LinkButton>
                             
                                </div>
                            </div>
                        </div>
                        
                        <div class="clearfix"></div>
                        <div class="col-lg-11">
                            <asp:Panel ID="pnl_rpt" runat="server">
                                <div class="box box-info">
                                    <div class="box-header">
                                        <h3 class="box-title">List of Subjects</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover table-bordered">
                                                <thead>
                                                    <tr>
                                                        <td>Title</td>

                                                        <td>Subject Code</td>
                                                        <td>Department</td>
                                                        <td>Semester </td>
                                                        <td>Units</td>
                                                        <td>Credits  </td>
                                                        <td>Delete</td>
                                                       
                                                    </tr>
                                                </thead>
                                                <asp:Repeater ID="Repeater1" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%# Eval("title") %></td>
                                                            <td><%# Eval("code") %></td>
                                                            <td><%# Eval("dept") %></td>
                                                            <td><%# Eval("sem") %></td>
                                                            <td><%# Eval("units") %></td>

                                                            <td><%# Eval("credits") %></td>
                                                          <td>
                                                                <asp:LinkButton ID="lnk_delete" ToolTip="Delete" CommandArgument='<%# Eval("Id") %>' OnClick="lnk_delete_Click" runat="server"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                            </td>                                                       </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                        </div></section>
                        </aside></div>
        

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
    </form>
</body>
</html>
