<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add-assignment.aspx.cs" Inherits="Faculty_add_assignment" %>

<%@ Register Src="~/Faculty/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/Faculty/sidemenu.ascx" TagPrefix="uc1" TagName="sidemenu" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
            <!-- This is the place to put all your content -->
            <aside class="right-side">
                <!-- Heading section of page -->
                <section class="content-header">
                    <h1>Add Assignments
                       
                        
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>

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
                                    <div class="form-group">

                                        <label>Select Department</label>
                                        <asp:DropDownList ID="dd_dept" runat="server" ForeColor="#0099FF" Height="24px" Width="222px" Font-Bold="True" Font-Italic="True" Font-Size="Large">
                                            <asp:ListItem>Select Dept.</asp:ListItem>
                                            <asp:ListItem>CS</asp:ListItem>
                                            <asp:ListItem>Electrical</asp:ListItem>
                                            <asp:ListItem>Mech</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <label><strong>Semester :</strong> </label>
                                        <br />
                                        <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="dd_sem_SelectedIndexChanged" ID="dd_sem" runat="server" ForeColor="#0099FF" Height="24px" Width="222px" Font-Bold="True" Font-Italic="True" Font-Size="Large">
                                            <asp:ListItem>Select Sem.</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                        </asp:DropDownList>

                                        <br />
                                        <br />
                                        <i class="fa fa-book"></i>
                                        <label>Select Subject :</label>
                                        <asp:DropDownList ID="dd_sub" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:DropDownList>
                                        <br />
                                        <br />


                                        <br />
                                    </div>
                                    <div class="form-group">

                                        <label>Assignment Desc.</label>
                                        <asp:TextBox ID="txt_que" CssClass="form-control" placeholder="Enter Desc." runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="g1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter question" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_que"></asp:RequiredFieldValidator>

                                    </div>
                                   
                                    <div class="form-group">

                                        <label>Submission Date</label>
                                       <asp:TextBox ID="txt_date" placeholder=" Date" runat="server"></asp:TextBox>
                                
                                        <asp:RequiredFieldValidator ValidationGroup="g1" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Date" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_date"></asp:RequiredFieldValidator>


                                    </div>







                                </div>
                                <div class="box-footer clearfix">
                                    <asp:LinkButton ID="lnk_save" ValidationGroup="g1" class="pull-right btn btn-default" OnClick="lnk_save_Click" runat="server">Save <i class="fa fa-arrow-circle-right"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="col-lg-11">
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
                                                <td>Delete</td>
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
                                                     <asp:LinkButton ID="lnk_delete" ToolTip="Delete" CommandArgument='<%# Eval("id") %>' OnClick="lnk_delete_Click"  runat="server"><i class="fa fa-trash-o"></i></asp:LinkButton>
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
