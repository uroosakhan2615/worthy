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
      
      <!--  <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>        
        <li>
          <a href="userList">
            <i class="fa fa-th"></i> <span>User Management</span>            
          </a>
        </li>
        <li>
          <a href="marqueeList">
            <i class="fa fa-th"></i> <span>Marquee Management</span>            
          </a>
        </li>
          <li>
          <a href="bookings">
            <i class="fa fa-th"></i> <span>Bookings</span>            
          </a>
        </li>
        <li>
          <a href="menuList">
            <i class="fa fa-th"></i> <span>Menu Management</span>            
          </a>
        </li> 
        <li>
          <a href="eventList">
            <i class="fa fa-th"></i> <span>Event Management</span>            
          </a>
        </li>
         <%-- <li>
          <a href="adminProfile">
            <i class="fa fa-th"></i> <span>Profile</span>            
          </a>
        </li> --%>
      </ul>
    </section>
  </aside>