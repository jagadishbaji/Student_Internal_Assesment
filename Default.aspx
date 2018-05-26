<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet"/>
    <style type="text/css">
        body{
    background: url(http://mymaplist.com/img/parallax/back.png);
	background-color: #444;
    background: url(http://mymaplist.com/img/parallax/pinlayer2.png),url(http://mymaplist.com/img/parallax/pinlayer1.png),url(http://mymaplist.com/img/parallax/back.png);    
}

.vertical-offset-100{
    padding-top:100px;
}
    </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    
<div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4">
            <h2>Online Student Assisment </h2>
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Please sign in</h3>
			 	</div>
			  	<div class="panel-body">
                      <div id="server-message"></div>
			    	
			    	  	<div class="form-group">
			    		    <asp:TextBox ID="txt_emailid" runat="server" class="form-control" placeholder="Email ID"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic"  ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter EmailID" ControlToValidate="txt_emailid"></asp:RequiredFieldValidator>

			    		</div>
			    		<div class="form-group">
			    			 <asp:TextBox ID="txt_password" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>                            
                            <asp:RequiredFieldValidator  Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password" ControlToValidate="txt_password"></asp:RequiredFieldValidator>
                        
			    		</div>
			    		
                           <label>Select Login Type</label>
                            <div class="form-group">
                            <asp:DropDownList ID="dd_login" runat="server">
                                <asp:ListItem>Select-type</asp:ListItem>
                                 <asp:ListItem>Student</asp:ListItem>
                                <asp:ListItem>Faculty</asp:ListItem>
                            
                              
                                <asp:ListItem>Admin</asp:ListItem>
                            </asp:DropDownList>
                                </div>
                      <asp:LinkButton class="btn btn-lg btn-success btn-block" ID="login" runat="server" OnClick="login_Click">Login</asp:LinkButton>
			    		
			    	
			    </div>
                <a href="index.html">Home</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $(document).mousemove(function (e) {
            TweenLite.to($('body'),
               .5,
               {
                   css:
                     {
                         backgroundPosition: "" + parseInt(event.pageX / 8) + "px " + parseInt(event.pageY / '12') + "px, " + parseInt(event.pageX / '15') + "px " + parseInt(event.pageY / '15') + "px, " + parseInt(event.pageX / '30') + "px " + parseInt(event.pageY / '30') + "px"
                     }
               });
        });
    });
</script>
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
             function validate() {
                 if ($("#txt_emailid").val() == "" || $("#txt_pwd").val() == "") {
                     showalert("error", "Please enter login credentials.");
                     return false;
                 }
             }
        </script>    
        <script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>
    </form>
</body>
</html>
