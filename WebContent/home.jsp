<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Worthy | online marquee system</title>
<meta name="description"
	content="Worthy a Bootstrap-based, Responsive HTML5 Template">
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
	<div class="scrollToTop">
		<i class="icon-up-open-big"></i>
	</div>

	<!-- header start -->
	<!-- ================ -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header end -->
<body class="no-trans">
	<!-- scrollToTop -->
	<!-- ================ -->
	<div class="scrollToTop">
		<i class="icon-up-open-big"></i>
	</div>

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
				<div class="col-md-8 col-md-offset-2 object-non-visible"
					data-animation-effect="fadeIn">
					<h1 class="text-center">
						We are <span>Worthy</span>
					</h1>
					<p class="lead text-center">TO PROVIDE & DELIVER EVENT
						SOLUTIONS & SERVICES WITH THE HIGHEST STANDARD OF
						PROFESSIONALISM, CREATIVITY UPHOLDING AT ALL TIMES QUALITY,
						INTEGRITY AND INNOVATION.</p>
					&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;
					
					<div class="col-md-2"></div>
						<%
							if (session.getAttribute("userId") == null) {
						%>
							<button class="btn btn-primary" data-toggle="modal"
							data-target="#loginModal">Login</button>
						<%
							} else {
						%>
							
						<%
							}
						%>

						&nbsp;&nbsp;
						<button class="btn btn-primary" data-toggle="modal"
							data-target="#bookMarquee">Book a marquee</button>

						<div class="modal fade" id="loginModal" tabindex="-1"
							role="dialog" aria-labelledby="myLargeModalLabel"
							aria-hidden="true" style="display: none;">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel">Login/Registration</h4>
									</div>
									<div class="modal-body">
										<div class="container">
											<div class="row">
												<div class="col-md-12 span12">
													<div class="" id="loginModal">
														<div class="modal-body">
															<div class="col-md-8">
																<ul class="nav nav-tabs">
																	<li class="active"><a href="#login"
																		data-toggle="tab">Login</a></li>
																	<li><a href="#create" data-toggle="tab">Create
																			Account</a></li>
																</ul>
																<div id="myTabContent" class="tab-content">
																	<div class="tab-pane active in" id="login">
																		<form class="form-horizontal" action='loginPost'
																			method="POST">
																			<fieldset>
																				<div class="form-group" id="legend">
																					<h3>Login</h3>
																				</div>
																				<div class="form-group">
																					<!-- Username -->
																					<label class="control-label" for="username">Username</label>
																					<div class="controls">
																						<input type="text" id="username" name="userId"
																							placeholder="Enter username"
																							class="form-control input-xlarge">
																					</div>
																				</div>

																				<div class="form-group">
																					<!-- Password-->
																					<label class="control-label" for="password">Password</label>
																					<div class="controls">
																						<input type="password" name="userPass"
																							placeholder="Enter password"
																							class="form-control input-xlarge">
																					</div>
																				</div>

																				<div class="control-group">
																					<!-- Button -->
																					<div class="form-group">
																						<input type="submit" class="btn btn-success"
																							value="Login">
																					</div>
																				</div>
																			</fieldset>
																		</form>
																	</div>
																	<div class="tab-pane fade" id="create">
																		<form id="tab">
																			<label>Username</label> <input type="text" value=""
																				class="form-control input-xlarge"> <label>First
																				Name</label> <input type="text" value=""
																				class="form-control input-xlarge"> <label>Last
																				Name</label> <input type="text" value=""
																				class="form-control input-xlarge"> <label>Email</label>
																			<input type="text" value=""
																				class="form-control input-xlarge"> <label>Address</label>
																			<textarea value="Smith" rows="3"
																				class="form-control input-xlarge"></textarea>
																			<div class="form-group">
																				<button class="btn btn-primary">Create
																					Account</button>
																			</div>
																		</form>
																	</div>
																</div>
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

						</div>
					</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="bookMarquee" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true"
	style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Book a Marquee</h4>
			</div>
		<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<form class="form-horizontal" method="post" action="bookHall">
							<div class="form-group row">
								<label for="marquee name" class="col-sm-2 control-label">City</label>
								<div class="col-md-10">
								<select name="marquee.city.id" class="form-control" id="cityId">
								<option selected value="">Select City</option>
								<s:iterator value="cities">
												<option value="<s:property value="id" />">
													<s:property value="name" /></option>
											</s:iterator>
										</select>
								</div>
							</div>
								<div class="form-group row">
									<label for="marquee name" class="col-sm-2 control-label">Marquee
										Name</label>
									<div class="col-md-10" id="marquees">
										<select name="marquee.name.id" class="form-control" id="marqueeId">
										<option>Select A Marquee</option>
											<s:iterator value="Marquee Name">
												<option value="<s:property value="id" />">
													<s:property value="name" /></option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label for="marquee name" class="col-sm-2 control-label">Hall
										</label>
									<div class="col-md-10" id="halls">
										<select name="hall.name.id" class="form-control">
											<s:iterator value="Hall Name">
												<option value="<s:property value="id" />">
													<s:property value="name" /></option>
											</s:iterator>
										</select>
									</div>
								</div>
							<div class="form-group">
								<label for="location" class="col-sm-2 control-label">
									Location</label>
								<div class="col-sm-10">
									<input type="location" class="form-control" id="location"
										placeholder="location">
								</div>
							</div>

							<div class="bootstrap-iso">
								<div class="container-fluid">
									<div class="row">
										<div class="form-group">
											<!-- Date input -->
											<label for="date" class="col-sm-2 control-label">Date</label>
											<div class="col-sm-10">
												<input class="form-control" id="date" name="date"
													placeholder="MM/DD/YYY" type="text" />
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="capacity" class="col-sm-2 control-label">
									Capacity </label>
								<div class="col-sm-10">
									<input type="capacity" class="form-control" id="capacity"
										placeholder="capacity">
								</div>
							</div>

								<div class="control-group">
									<!-- Button -->
									<div class="form-group">
										<div class="col-sm-2">
										</div>
										<div class="col-sm-6">
											<input type="submit" class="btn btn-success"
												value="Booking Done">
												
												<input type="button" class="btn btn-success"
												value="Cancel Booking">
										</div>
									</div>
								</div>
							</form>
				</div>
			</div>
		</div>
	</div>
</div>

	<script type="text/javascript">
		$('#date').datepicker();
		
		$('#bookMarquee, #loginModal').on('shown.bs.modal', function() {
			$(".modal-backdrop").remove(); 
		});
		
		$("#cityId").change(function (){
			var cityId= this.value;

			$.ajax({
				type : 'POST',
				url : "getMarqueesByCity.action",
				data : {
					cityId : cityId
				},
				success : function(res) {
					$("#marquees").html(res);
				}
			});
		});
		
	</script>

	<footer id="footer">
		<!-- ================ -->
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>
</html>
