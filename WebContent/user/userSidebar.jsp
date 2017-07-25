<%@taglib uri="/struts-tags" prefix="s"%>
<aside class="main-sidebar"  >
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><s:property value="#session.username" /></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>        
       <!-- 
        <li>
          <a href="userList">
            <i class="fa fa-th"></i> <span>User</span>            
          </a>
        </li>
       -->
        <li>
          <a href="userMarqueeList">
            <i class="fa fa-th"></i> <span>Marquees</span>            
          </a>
        </li> 
        <li>
          <a href="userBookings">
            <i class="fa fa-th"></i> <span>My Bookings</span>            
          </a>
        </li>
        <li>
          <a href="userMenuList">
            <i class="fa fa-th"></i> <span>Menus</span>            
          </a>
        </li> 
        <li>
          <a href="userEvents">
            <i class="fa fa-th"></i> <span>My Events</span>            
          </a>
        </li>
        
        <%-- <li>
          <a href="profile">
            <i class="fa fa-th"></i> <span>Profile</span>            
          </a>
        </li> --%>
        
      </ul>
      
    </section>
  </aside>