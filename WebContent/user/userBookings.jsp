<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Bookings</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../admin/libIncludes.jsp"></jsp:include>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="userSidebar.jsp"></jsp:include>
		<jsp:include page="userHeader.jsp"></jsp:include>
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container">
				</div>
			</section>
			
			
			<div class="modal fade" id="addNewBookingModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<legend>Book Hall</legend>
								</div>
								<div class="modal-body">
									<div class="container">
										<div class="row">
											<form class="form-horizontal" method="post" action="addEvent">
												<fieldset>
													
													<div class="form-group">
														<label class="col-md-2 control-label">User</label>
														<div class="col-md-4">
															<select class="form-control" name="event.user.id"
																required>
																<s:iterator value="userList">
																	<option value="<s:property value='id'/>">
																		<s:property value="userName" />
																	</option>
																</s:iterator>
															</select>
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-md-2 control-label">Marquee Name</label>
														<div class="col-md-4">
															<select class="form-control" name="event.marquee.id" required>
																<s:iterator value="marqueeList">
																	<option value="<s:property value="id" />"><s:property
																			value="marqueeName" /></option>
																</s:iterator>
															</select>
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-md-2 control-label">Select Menu</label>
														<div class="col-md-4">
															<select class="form-control" name="event.menu.id" required>
																<s:iterator value="menuList">
																	<option value="<s:property value="id" />"><s:property
																			value="menuName" /></option>
																</s:iterator>
															</select>
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-md-2 control-label">Event Status</label>
														<div class="col-md-4">
															<select class="form-control" name="event.status" required>
																<option value="1">Active</option>
																<option value="0">DeActive</option>
															</select>
														</div>
													</div>


													<div class="form-group row">
														<label class="col-md-4 control-label" for="submit"></label>
														<div class="col-md-8">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">Close</button>
															<button id="submit" name="submit" class="btn btn-success">Add</button>
														</div>
													</div>
												</fieldset>
											</form>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
			
			
			
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
					<button type="button" class="btn btn-info" data-toggle="modal"
							data-target="#addNewBookingModal">Book Hall</button>
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Menus</h3>
							</div>
							<div class="box-body">
								<table id="eventTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Marquee Name</th>
											<th>Hall Name</th>
											<th>Capacity</th>
											<th>Status</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="bookingsList">
											<tr>
												<td><s:property value="hall.marquee.marqueeName" /></td>
												<td><s:property value="hall.name" /></td>
												<td><s:property value="capacity" /></td>
												
												<s:if test="status==1">
													<td><span class="btn-sm btn-success glyphicon glyphicon-ok"> Active</span></td>
												</s:if>
												<s:else>
													<td><a href="#" class="btn btn-sm btn-danger">Inactive</a></td>
												</s:else>
												
												<s:if test="user.id==#session.userId">
													<td><a class="btn btn-sm btn-default editBooking"
													href="#" id="<s:property value="id" />"><span class="glyphicon glyphicon-edit"> Edit</span></a></td>
													<td><a class="btn btn-sm btn-danger deleteBooking" href="#" id="<s:property value="id" />"><span class="glyphicon glyphicon-remove"> Delete</span></a></td>
												</s:if>
												<s:else>
													<td></td>
													<td></td>
												</s:else>
												
											</tr>
										</s:iterator>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
		<div class="control-sidebar-bg"></div>
	</div>

	<div id="editBookingsModal"></div>

	<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
				</div>

				<div class="modal-body">
					<p>You are about to delete one track, this procedure is
						irreversible.</p>
					<p>Do you want to proceed?</p>
					<p class="debug-url"></p>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<a class="btn btn-danger btn-ok" id="modalDeleteBtn">Delete</a>
				</div>
			</div>
		</div>
	</div>

<script>

$('#eventTable').dataTable();

$(".editEvent").click(function() {
	var eventId = this.id;
	$.ajax({
		type : 'POST',
		url : "getEditEvent.action",
		data : {
			eventId : eventId
		},
		success : function(res) {
			$("#editBookingsModalDiv").html(res);
			$("#editBookingsModal").modal("show");
			$(".modal-backdrop").remove();
		}
	});
});


$(".deleteEvent").click(function() {
	var menuId = this.id;
	
	$("#confirm-delete").modal("show");
	$("#modalDeleteBtn").click(function(e){
		e.preventDefault();
		$.ajax({
			type : 'POST',
			url : "deleteMenu.action",
			data : {
				menuId : menuId
			},
			success : function(res) {
				toastr.success("Menu deleted successfully.", "Yay!!", {
					"timeOut" : "3000",
					"progressBar" : true,
					"extendedTImeout" : "0"
				});
				location.reload();
			}
		});
	});
});

</script>
</body>
</html>
