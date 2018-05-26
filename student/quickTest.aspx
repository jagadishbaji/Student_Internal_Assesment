<%@ Page Title="Quick Test" Language="C#" MasterPageFile="~/student/Master1.master" AutoEventWireup="true" CodeFile="quickTest.aspx.cs" Inherits="quickTest" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <link rel="stylesheet" href="../css/m.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../css/c_Pointer.css" type="text/css" media="screen" />
    
    <br />
    <div>
    


    <br />
        <div>
            <asp:Button ID="btnHome" CssClass="pointer" runat="server" Text="Home" OnClick="btnHome_Click" style="color: #FFFFFF; font-weight: 700; background-color: #666666" Width="92px" />
        </div>
    <div style="background-color:violet; text-align: right; width: 800px;">
        <asp:Panel ID="Panel1" runat="server" Height="61px">
            <table style="width: 76%; float: left; height: 71px">
                <tr>
                    <td style="text-align: right; width: 93px">Dept.    </td>
                    <td style="width: 209px; text-align: center;">
                        <asp:DropDownList ID="DropDownList2" runat="server" Height="31px" Width="136px">
                            <asp:ListItem>CS</asp:ListItem>
                             <asp:ListItem>Mech.</asp:ListItem>
                        </asp:DropDownList><br />
                    </td>
                    &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;
                    <td style="text-align: right; width: 93px"> Subject</td>
                    <td style="width: 179px; text-align: center;">
                        <asp:DropDownList ID="dd_sub" runat="server" Height="31px" Width="136px">
                            

                        </asp:DropDownList><br />
                    </td>
                       &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;
                    <td style="text-align: right; width: 93px">Sem:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td style="width: 179px; text-align: center;">
                        <asp:DropDownList ID="dd_sem" runat="server" Height="31px" Width="136px">
                            <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList><br />
                    </td>
                       &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;
                    <td style="text-align: left">
                        <asp:Button ID="btnGo" runat="server" OnClick="btnGo_Click1" style="margin-left: 0px" Text="Go" Height="30px" Width="102px" />
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


             <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>


             <asp:Label ID="Label7" runat="server" Font-Bold="True" style="text-decoration: underline"></asp:Label><br />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" style="text-decoration: underline"></asp:Label><br /><br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>
        <br /><br /> <hr />
        <br />
        <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" GroupName="a" OnCheckedChanged="show" /><br />
        <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" GroupName="a" OnCheckedChanged="show" />
        <br />
        <asp:RadioButton ID="RadioButton3" runat="server" AutoPostBack="True" GroupName="a" OnCheckedChanged="show" /><br />
        <asp:RadioButton ID="RadioButton4" runat="server" AutoPostBack="True" GroupName="a" OnCheckedChanged="show" /></div>
        <br /><br />
        

        <table style="width: 169px"><tr><td>
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Next" /></td>
       <td> <asp:Button ID="btnSkip" runat="server" OnClick="btnSkip_Click" Text="Skip" /></td>
                    </tr>
                    </table><br /><hr />
        <asp:Label ID="Label6" runat="server" BorderStyle="None" style="font-weight: 700"></asp:Label>
        <br />
        <br />
                
        <asp:Label ID="Label2" runat="server" BorderStyle="None"></asp:Label>
               <br />
               <br />
                <asp:Label ID="Label4" runat="server" BorderStyle="None"></asp:Label>
               <br /><br />
                     <asp:Label ID="Label3" runat="server" BorderStyle="None"></asp:Label>
               
                <br />
                <br />
               
                <br />  
              
                
                <asp:LinkButton ID="btnTryAgain" runat="server" OnClick="btnTryAgain_Click">Back To Home Page</asp:LinkButton>
                &nbsp;
                    
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="btnBackToHomePage" runat="server" OnClick="btnBackToHomePage_Click">Try Again</asp:LinkButton>
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
    <br />
    </div>
  </asp:Content>



