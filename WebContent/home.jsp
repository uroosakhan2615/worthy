<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Worthy | online marquee system</title>
		<meta name="description" content="Worthy a Bootstrap-based, Responsive HTML5 Template">
		<meta name="author" content=" htmlcoder.me">

		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- Favicon -->
		<link rel="shortcut icon" href="images/favicon.ico">
		
		<jsp:include page="styles.jsp"></jsp:include>
		<jsp:include page="admin/libIncludes.jsp"></jsp:include>
	</head>
	<body class="no-trans">
		<!-- scrollToTop -->
		<!-- ================ -->
		<div class="scrollToTop"><i class="icon-up-open-big"></i></div>

		<!-- header start -->
		<!-- ================ --> 
		<jsp:include page="header.jsp"></jsp:include>
		<!-- header end -->
		<body class="no-trans">
		<!-- scrollToTop -->
		<!-- ================ -->
		<div class="scrollToTop"><i class="icon-up-open-big"></i></div>

		<!-- header start -->
		<!-- ================ --> 
		<jsp:include page="header.jsp"></jsp:include>
		<!-- header end -->

		<!-- banner start -->
		<!-- ================ -->
		<div id="banner" class="banner">
			<div class="banner-image"></div>
			<div class="banner-caption">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 object-non-visible" data-animation-effect="fadeIn">
							<h1 class="text-center">We are <span>Worthy</span></h1>
							<p class="lead text-center">TO PROVIDE & DELIVER EVENT SOLUTIONS & SERVICES WITH THE HIGHEST STANDARD OF PROFESSIONALISM, CREATIVITY UPHOLDING AT ALL TIMES QUALITY, INTEGRITY AND INNOVATION.</p>
						&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
			<button class="btn btn-primary" data-toggle="modal" data-target="#myModal"> Login </button>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×</button>
                <h4 class="modal-title" id="myModalLabel">
                    Login/Registration - <a href="http://www.jquery2dotnet.com">jquery2dotnet.com</a></h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-8" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class=""><a href="#Login" data-toggle="tab" aria-expanded="false">Login</a></li>
                            <li class="active"><a href="#Registration" data-toggle="tab" aria-expanded="true">Registration</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane" id="Login">
                                <form role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="email1" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="exampleInputPassword1" placeholder="Email">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            Submit</button>
                                        <a href="javascript:;">Forgot your password?</a>
                                    </div>
                                </div>
                                </form>
                            </div>
                            <div class="tab-pane active" id="Registration">
                                <form role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Name</label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <select class="form-control">
                                                    <option>Mr.</option>
                                                    <option>Ms.</option>
                                                    <option>Mrs.</option>
                                                </select>
                                            </div>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" placeholder="Name">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="email" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="mobile" class="col-sm-2 control-label">
                                        Mobile</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="mobile" placeholder="Mobile">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="password" placeholder="Password">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10">
                                        <button type="button" class="btn btn-primary btn-sm">
                                            Save &amp; Continue</button>
                                        <button type="button" class="btn btn-default btn-sm">
                                            Cancel</button>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                        <div id="OR" class="hidden-xs">
                            OR</div>
                    </div>
                    <div class="col-md-4">
                        <div class="row text-center sign-with">
                            <div class="col-md-12">
                                <h3>
                                    Sign in with</h3>
                            </div>
                            <div class="col-md-12">
                                <div class="btn-group btn-group-justified">
                                    <a href="#" class="btn btn-primary">Facebook</a> <a href="#" class="btn btn-danger">
                                        Google</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <button class="btn btn-primary" data-toggle="modal" data-target="#bookMarquee"> Book a marquee </button>
          
          <div class="modal fade" id="bookMarquee" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×</button>
                <h4 class="modal-title" id="myModalLabel">
                    Book a Marquee
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
	                    <form class="form-horizontal">
	                        <div class="form-group">
	                             <label for="city" class="col-sm-2 control-label">
	                                 City</label>
	                             <div class="col-sm-10">
	                                 <input type="city" class="form-control input-sm datepicker" id="city" placeholder="city">
	                             </div>
	                         </div>
	                         <div class="form-group">
	                             <label for="marquee name" class="col-sm-2 control-label">
	                                 Marquee Name</label>
	                             <div class="col-sm-10">
	                                 <input type="marquee name" class="form-control input-sm datepicker" id="calander" placeholder="marquee name">
	                             </div>
	                         </div>
	                         <div class="form-group">
	                             <label for="hall" class="col-sm-2 control-label">
	                                 Hall</label>
	                             <div class="col-sm-10">
	                                 <input type="hall" class="form-control input-sm datepicker" id="hall" placeholder="hall">
	                             </div>
	                         </div>
	                         <div class="form-group">
	                             <label for="location" class="col-sm-2 control-label">
	                                 Location</label>
	                             <div class="col-sm-10">
	                                 <input type="location" class="form-control" id="location" placeholder="location">
	                             </div>
	                         </div>
	                         
	                        <div class="bootstrap-iso">
                     <div class="container-fluid">
                         <div class="row">
                           <div class="form-group"> <!-- Date input -->
            <label for="date" class="col-sm-2 control-label">Date</label>
            <div class="col-sm-10">
            	<input class="form-control" id="date" name="date" placeholder="MM/DD/YYY" type="text"/>
           </div>
            </div>
              </div>
                </div>    
               </div>
                <div class="form-group">
	                             <label for="capacity" class="col-sm-2 control-label"> Capacity
	                                 </label>
	                             <div class="col-sm-10">
	                                 <input type="capacity" class="form-control" id="capacity" placeholder="capacity">
	                             </div>
	                         </div>
                    </div>
	                    </form>                        
	                </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
 	$('#date').datetimepicker();
</script> 
		<footer id="footer">
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</body>
</html>
		