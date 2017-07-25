<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Booking Management</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="libIncludes.jsp"></jsp:include>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="sidebar.jsp"></jsp:include>
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container">
					<div class="modal" id="bookHall" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<s:form class="form-horizontal" action="bookHall"
								method="post">
								<div class="modal-content">
									<div class="modal-header">
										<div class="row">
											<div class="col-md-9">
												<h3 style="margin-top: 0px;">Book Hall</h3>
											</div>
											<div class="col-md-3">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
										</div>
									</div>
									<div class="modal-body">
										<div class="row">
											<div class="col-md-12">
												<form class="form-horizontal" method="post"
													action="bookHall">
													<div class="form-group row">
														<label for="Booking name" class="col-sm-2 control-label">City</label>
														<div class="col-md-10">
															<select name="marquee.city.id" class="form-control" id="cityId">
																<option value="" selected>Select City</option>
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
															<select name="marquee.name.id" class="form-control"
																id="marqueeId">
																<option value="" selected>Select A City First</option>
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
															<select id="hallId" name="hall.id" class="form-control"required>
																<option value="" selected>Select A Marquee First</option>
																<s:iterator value="Hall Name">
																	<option value="<s:property value="id" />">
																		<s:property value="name" /></option>
																</s:iterator>
															</select>
														</div>
													</div>

													<div class="form-group row">
														<label for="date" class="col-sm-2 control-label">From (Date)</label>
														<div class="col-sm-10">
															<input class="form-control" id="fromDate" name="booking.fromDate"
																placeholder="MM/DD/YYY" type="text" />
														</div>
													</div>
													
													
													<div class="form-group row">
														<label for="date" class="col-sm-2 control-label">To (Date)</label>
														<div class="col-sm-10">
															<input class="form-control" id="toDate" name="booking.toDate"
																placeholder="MM/DD/YYY" type="text" />
														</div>
													</div>

													<div id="RentNcapacity">
														<div class="form-group row">
															<label for="capacity" class="col-sm-2 control-label">
																Hall Rent (Per Day) </label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="rent"
																	readonly>
															</div>
														</div>

														<div class="form-group row">
															<label for="capacity" class="col-sm-2 control-label">
																Hall Capacity </label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="capacity"
																	readonly>
															</div>
														</div>
													</div>

													<div class="control-group">
														<!-- Button -->
														<div class="form-group row">
															<div class="col-sm-2"></div>
															<div class="col-sm-6">
																<input type="submit" class="btn btn-success" value="Book Hall">
																	<input type="button" class="btn btn-danger" data-dismiss="modal" value="Cancel">
															</div>
														</div>
													</div>
												</form>
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
						<button type="button" class="btn btn-info" id="bookHallBtn"
						data-toggle="modal" data-target="#bookHall">Book Hall</button>
						
						<div class="box">
							<div class="box-header">
								<div id="responseMessageDiv"></div>
							</div>
							<div class="box-body">
								<table id="marqueeListTable"
									class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>User Name</th>
											<th>From (Date)</th>
											<th>To (Date)</th>
											<th>Hall Name</th>
											<th>Hall Capacity</th>
											<th>Hall Rent</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="bookingsList">
											<tr>
												<td><s:property value="user.userName" /></td>
												<td><s:property value="fromDate" /></td>
												<td><s:property value="toDate" /></td>
												<td><s:property value="hall.name" /></td>
												<td><s:property value="hall.capacity" /></td>
												<td><s:property value="rent" /></td>
												<td><a class="btn btn-sm btn-default editBooking"
													href="#" id="<s:property value="id" />"><span class="glyphicon glyphicon-edit"> Edit</span></a></td>
												<td><a class="btn btn-sm btn-danger deleteBooking"
													href="#" id="<s:property value="id" />"><span class="glyphicon glyphicon-remove"> Delete</span></a></td>
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
		<div class="control-sidebar-bg"></div>
	</div>
	<div id="editBookingModalDiv"></div>
	
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
		
$('#marqueeListTable').dataTable();

$(".editBooking").click(function() {
	var bookingId = this.id;
	$.ajax({
		type : 'POST',
		url : "getEditBooking.action",
		data : {
			marqueeId : marqueeId
		},
		success : function(res) {
			$("#editBookingModalDiv").html(res);
			$("#editBookingModal").modal("show");
			$(".modal-backdrop").remove();
		}
	});
});

$(".deleteBooking").click(function() {
	var BookingId = this.id;
	
	$("#confirm-delete").modal("show");
	$("#modalDeleteBtn").click(function(e){
		e.preventDefault();
		
		$.ajax({
			type : 'POST',
			url : "deleteBooking.action",
			data : {
				BookingId : BookingId
			},
			success : function(res) {
				//alert(res);
				//$("#responseMessageDiv").html(res);
				/*
				toastr.success("Booking deleted successfully.", "Yay!!", {
					"timeOut" : "3000",
					"progressBar" : true,
					"extendedTImeout" : "0"
				});
				*/
				location.reload();
			}
		});
	});
});

$('#fromDate, #toDate').datepicker();

$('#bookMarquee, #loginModal').on('shown.bs.modal', function() {
	$(".modal-backdrop").remove(); 
});

//get marquee on change of city select box
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
</body>
</html>