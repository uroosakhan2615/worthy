<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Data Tables</title>
<!-- Tell the Email to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="libIncludes.jsp"></jsp:include>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<!-- Left side column. contains the logo and sidebar -->
		<jsp:include page="sidebar.jsp"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<!-- modal -->
				<div class="container">
					<div class="row">
					<button type="button" class="btn btn-info"
						data-toggle="modal" data-target="#createMarquee">Register
						User</button>
					</div>
					<div class="modal fade" id="createMarquee" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<s:form class="form-horizontal" action="registerUser" method="post">
								<div class="modal-content">
									<div class="modal-header">
										<div class="row">
											<div class="col-md-9">
												<h3 style="margin-top: 0px;">Register User</h3>
											</div>
											<div class="col-md-3">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
										</div>
									</div>
									<div class="modal-body">

										<div class="row">
											<div class="col-md-12">
												<fieldset>

													<!-- Form Name -->


													<div class="form-group row">
														<label class="col-md-4 control-label" for="Name">User
															name</label>
														<div class="col-md-8">
															<input id="marqueeName" name="user.userName"
																type="text" placeholder="User Name"
																class="form-control input-md" required>
														</div>
													</div>

													<!-- Text input-->
													<div class="form-group row">
														<label class="col-md-4 control-label" for="emailId">Password
															</label>
														<div class="col-md-8">
															<input id="emailId" name="user.email"
																type="password" placeholder="user Password"
																class="form-control input-md" required>
														</div>
													</div>				 

													<!-- Button -->
													<div class="form-group row">
														<label class="col-md-4 control-label" for="submit"></label>
														<div class="col-md-8">
															<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
														<button id="submit" name="submit" class="btn btn-success">Submit</button>
														</div>
													</div>

												</fieldset>

											</div>
										</div>

									</div>
								</div>
							</s:form>
						</div>
					</div>
				</div>
			</section>

			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Customer Data</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="userListTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Name</th>
											<th>Email</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="userList" status="varStatus">
											<tr>
											<td><s:property value="userName" /></td>
											<td><s:property value="email" /></td>
											<td><a class="btn btn-sm btn-default editUser" href="#" id="<s:property value="id" />"><span class="glyphicon glyphicon-edit"> Edit</span></a></td>
											<td><a class="btn btn-sm btn-danger deleteUser" href="#" id="<s:property value="id" />"><span class="glyphicon glyphicon-remove"> Delete</span></a></td>
										</s:iterator>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<div id="editUserModalDiv"></div>
<script>

$('#userListTable').dataTable();

  $(".editUser").click(function(){
		var userId=this.id;
		$.ajax({
		      type: 'POST',
		      url: "getEditUser.action",
		      data: {
		    	  userId: userId
		      },
		      success: function(res) {
		    	  $("#editUserModalDiv").html(res);
	    		  $("#editUserModal").modal("show");
		    }    
		});  
	  });
  
  $(".deleteUser").click(function() {
		var userId = this.id;
		$.ajax({
			type : 'POST',
			url : "deleteUser.action",
			data : {
				userId : userId
			},
			success : function(res) {
				toastr.success("User deleted successfully.", "Yay!!", {
					"timeOut" : "3000",
					"progressBar" : true,
					"extendedTImeout" : "0"
				});
				location.reload();
			}
		});
	});
  
</script>
</body>
</html>
