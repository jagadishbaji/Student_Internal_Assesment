<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sidemenu.ascx.cs" Inherits="faculty_sidemenu" %>
<aside class="left-side sidebar-offcanvas">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../img/avatar.png" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
                <p>Hello,<%= (Session["faculty_details"] as Faculty_details).name%></p>

            </div>
        </div>
        <!-- search form -->
        
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
       <ul class="sidebar-menu">
            <li>
                <a href="dashboard.aspx">
                    <i class="fa fa-dashboard"></i><span>Dashboard</span>
                </a>
            </li>    
               <li class="treeview">
                <a href="#">
                    <i class="fa fa-plus"></i>
                    <span>Add</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="add-questions.aspx"><i class="fa fa-angle-double-right"></i>Add Questions</a></li>
                   
                      <li><a href="add-assignment.aspx"><i class="fa fa-angle-double-right"></i>Add Assignment</a></li>
                           
                </ul>
            </li>          
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-gears"></i>
                    <span>My Settings</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                   
                    <li><a href="change-password.aspx"><i class="fa fa-angle-double-right"></i>Change Password</a></li>                    
                </ul>
            </li>  
<li class="treeview">
                <a href="#">
                    <i class="fa fa-bar-chart-o"></i>
                    <span>View</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                   
                    <li><a href="view-faculty.aspx"><i class="fa fa-angle-double-right"></i>Faculties</a></li>
                     <li><a href="view-students.aspx"><i class="fa fa-angle-double-right"></i>Students</a></li>
                 
                 
                </ul>
            </li>   
           

<li >
                <a href="Add-marks.aspx">
                    <i class="fa fa-bar-chart-o"></i>
                    ADD MARKS
                   
                </a>
                
            </li>   
          
             
          
        </ul>
           
       
    </section>
    <!-- /.sidebar -->
</aside>