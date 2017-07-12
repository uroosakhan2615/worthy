<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta charset="utf-8">
<title>Profile</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../admin/libIncludes.jsp"></jsp:include>

<style>
.img-thumbnail.img-responsive.img-circle {
	width: 150px;
	height: 150px;
}
</style>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="userSidebar.jsp"></jsp:include>
		<div class="content-wrapper">
			<div class="container">
			<br><br>
				<div class="row">
					<div class="col-md-1">
					</div>
					<div class="col-md-9 toppad">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title"><s:property value="user.profile.fullName" /></h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-3 col-lg-3 " align="center">
										<img alt="User Pic"
											src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png"
											class="img-circle img-responsive">
									</div>

									<div class=" col-md-9 col-lg-9 ">
										<table class="table table-user-information">
											<tbody>
											
												<tr>
													<td><i class="fa fa-user" aria-hidden="true"></i> Username</td>
													<td><s:property value="user.userName" /></td>
												</tr>
											
												<tr>
													<td><i class="fa fa-mars-stroke" aria-hidden="true"></i> Gender</td>
													<td><s:property value="user.profile.gender" /></td>
												</tr>
												<tr>
													<td><i class="fa fa-birthday-cake" aria-hidden="true"></i> Date of Birth</i></td>
													<td><s:property value="user.profile.dob" /></td>
												</tr>
												<tr>
													<td><i class="fa fa-home"></i> Home Address</td>
													<td><s:property value="user.profile.address" /></td>
												</tr>
												<tr>
													<td><i class="fa fa-envelope" aria-hidden="true"></i> Email</td>
													<td><a href="mailto:info@support.com"><s:property value="user.email" /></a></td>
												</tr>
												<tr>
													<td><i class="fa fa-id-card" aria-hidden="true"></i> NIC No.</td>
													<td><s:property value="user.nic" /></td>
												</tr>
												<tr>
													<td><i class="fa fa-phone" aria-hidden="true"></i> Phone Number</td>
													<td><i class="fa fa-phone-square" aria-hidden="true"></i> <s:property value="user.profile.phoneNo" /><br>
													<br><i class="fa fa-mobile" aria-hidden="true"></i> <s:property value="user.profile.mobileNo" /> (Mobile)
													</td>
												</tr>

											</tbody>
										</table>

										<a href="#" class="btn btn-primary">My Sales Performance</a> <a
											href="#" class="btn btn-primary">Team Sales Performance</a>
									</div>
								</div>
							</div>
							<div class="panel-footer">
								<a data-original-title="Broadcast Message" data-toggle="tooltip"
									type="button" class="btn btn-sm btn-primary"><i
									class="glyphicon glyphicon-envelope"></i></a> <span
									class="pull-right"> 
									<a href="#" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a> <a
									data-original-title="Remove this user" data-toggle="tooltip"
									type="button" class="btn btn-sm btn-danger"><i
										class="glyphicon glyphicon-remove"></i></a>
								</span>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>








<div class="tab-pane" id="settings">
	<form class="form-horizontal">
		<div class="form-group">
			<label for="inputName" class="col-sm-2 control-label">Name</label>

			<div class="col-sm-10">
				<input type="email" class="form-control" id="inputName"
					placeholder="Name">
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail" class="col-sm-2 control-label">Email</label>

			<div class="col-sm-10">
				<input type="email" class="form-control" id="inputEmail"
					placeholder="Email">
			</div>
		</div>
		<div class="form-group">
			<label for="inputName" class="col-sm-2 control-label">Name</label>

			<div class="col-sm-10">
				<input type="text" class="form-control" id="inputName"
					placeholder="Name">
			</div>
		</div>
		<div class="form-group">
			<label for="inputExperience" class="col-sm-2 control-label">Experience</label>

			<div class="col-sm-10">
				<textarea class="form-control" id="inputExperience"
					placeholder="Experience"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputSkills" class="col-sm-2 control-label">Skills</label>

			<div class="col-sm-10">
				<input type="text" class="form-control" id="inputSkills"
					placeholder="Skills">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<div class="checkbox">
					<label> <input type="checkbox"> I agree to the <a
						href="#">terms and conditions</a>
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-danger">Submit</button>
			</div>
		</div>
	</form>
</div>

		<jsp:include page="../footer.jsp"></jsp:include>
		<div class="control-sidebar-bg"></div>

	</div>
	<script>
	$("body").mCustomScrollbar({
		theme:"inset-2-dark"
	});

	</script>
</body>
</html>
