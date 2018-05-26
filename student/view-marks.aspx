<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view-marks.aspx.cs" Inherits="student_view_marks" %>



<%@ Register Src="~/student/sidemenu.ascx" TagPrefix="uc1" TagName="sidemenu" %>
<%@ Register Src="~/student/head.ascx" TagPrefix="uc1" TagName="head" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Student IA</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/ionicons.min.css" rel="stylesheet" type="text/css" />

    <link href="../css/admin-section.css" rel="stylesheet" type="text/css" />
    <link href="../css/custom.css" rel="stylesheet" type="text/css" />
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>
<body class="skin-black">
    <form id="form2" runat="server">
        <uc1:head runat="server" ID="head" />
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <uc1:sidemenu runat="server" ID="sidemenu" />
            <!-- This is the place to put all your content -->
            <aside class="right-side">
                <!-- Heading section of page -->
                <section class="content-header">
                    <h1>Marks Card
                        <br />
                        <asp:Label ID="msg" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></h3> 
                        <%--<small>Hotel at a glance</small>--%>
                    </h1>

                </section>

                <!-- Main content -->
                <section class="content">

                    <div class="col-lg-11">
                        <asp:Panel ID="pnl_rpt" runat="server">
                            <div class="box box-info">
                                <div class="box-header">
                                    <h3 class="box-title">Marks</h3>
                                </div>
                                <div class="box-body">
                                    <div class="box-body table-responsive">
                                        <asp:GridView ID="GridView1" runat="server" ItemStyle-HorizontalAlign="Right" BackColor="White" BorderColor="#999999" BorderStyle="Dashed" BorderWidth="1px" GridLines="Vertical" Width="727px" Height="188px">
                                            <AlternatingRowStyle BackColor="#DCDCDC" />
                                            <EditRowStyle BackColor="#3399FF" ForeColor="#00FF99" />
                                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                            <RowStyle HorizontalAlign="center" BackColor="#EEEEEE" ForeColor="Black" />
                                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#000065" />
                                        </asp:GridView>

                                        <br />
                                        <label style="font-size: 2em; color: green;">Grand Total :</label>
                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="XX-Large"></asp:Label>

                                    </div>




                                </div>
                            </div>
                        </asp:Panel>
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
