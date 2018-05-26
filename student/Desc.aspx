<%@ Page Language="C#" MasterPageFile="Master1.master" AutoEventWireup="true" CodeFile="Desc.aspx.cs" Inherits="Desc" %>




<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <link rel="stylesheet" href="../css/m.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../css/c_Pointer.css" type="text/css" media="screen" />
    <script src="js/countdown.js"></script>
    <script src="js/count.js"></script>
   <style type="text/css">
       .time
       {
           color:red;
       }
   </style>
    <br />
    <div>
    


    <br />
        <div>
                 </div>
    <div style="background-color:violet; text-align: right; width:800px;">
        <asp:Panel ID="Panel1" runat="server" Height="61px">
            <table style="width: 159%; float: left; height: 66px">
                <tr>
                    <td style="text-align: right; width: 120px">Select Dept :&nbsp;</td>
                    <td style="width: 179px; text-align: center;">
                        <asp:DropDownList ID="DropDownList2" runat="server" Height="31px" Width="150px">
                        </asp:DropDownList><br />
                    </td>
                     <td style="width: 179px; text-align: center;">Select Subject :
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="31px" Width="150px">
                        </asp:DropDownList><br />
                    </td>
                      <td style="width: 179px; text-align: center;">Select IA Version :
                        <asp:DropDownList ID="DropDownList3" runat="server" Height="31px" Width="136px">
                            <asp:ListItem>First</asp:ListItem>
                              <asp:ListItem>Second</asp:ListItem>
                        </asp:DropDownList><br />
                    </td>
                    <td style="text-align: left">
                        <asp:Button ID="btnGo" runat="server" OnClick="btnGo_Click1" style="margin-left: 0px" Text="Go" Height="30px" Width="120px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>



    <br />
    <br />
<table style="width: 99%; float: left; height: 301px;">
        <tr>
            <td style="width: 20px">&nbsp;</td>
            <asp:MultiView ID="MultiView1" runat="server">
               
                <asp:View ID="View2" runat="server">
            <td style="width: 954px">
       
            
         <div style="color:black">
              <asp:ScriptManager ID="sp" runat="server"></asp:ScriptManager>
        <asp:Timer ID="timer" runat="server" Interval="1000" OnTick="timer_Tick"></asp:Timer>
        <asp:UpdatePanel ID="up" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Literal   ID="litmsg" runat="server"></asp:Literal>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="timer" EventName="tick" />
            </Triggers>
        </asp:UpdatePanel>

    

             <asp:Label ID="Label7" runat="server" Font-Bold="True" style="text-decoration: underline"></asp:Label><br />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" style="text-decoration: underline"></asp:Label><br /><br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>CL Type :</strong> <asp:Label ID="cl" runat="server"></asp:Label>
        <br /><br /> <hr />
        <br />
             <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server"></asp:TextBox>
        

        <table style="width: 169px"><tr><td>
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Next" /></td>
       <td> </td>
                    </tr>
                    </table><br /><hr />
        <asp:Label ID="Label6" runat="server" BorderStyle="None" style="font-weight: 700"></asp:Label>
        <br />
        <br />
                
        <asp:Label ID="Label2" runat="server" BorderStyle="None"></asp:Label>
               <br />
               <br />
               <a style="color:red;" href="dashboard.aspx">Exit </a>
               <br /><br />
                     
               
                <br />
          
               
         
              
                    <br />
                <br />
                <br />
                <br />
                <br />
                <br />
               </asp:View>
                
            </asp:MultiView>
            <td>&nbsp;</td>
        </tr>
    </table>
    
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
   
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    
       
    <br />
    <br />
    </div>

  </asp:Content>


