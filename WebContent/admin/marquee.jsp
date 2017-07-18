<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Marquee Management</title>
<!-- Tell the Marquees_ name to be responsive to screen width -->
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
					<div class="modal" id="createMarquee" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<s:form class="form-horizontal" action="registerMarquee"
								method="post">
								<div class="modal-content">
									<div class="modal-header">
										<div class="row">
											<div class="col-md-9">
												<h3 style="margin-top: 0px;">Marquee Registration Form</h3>
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

													<div class="form-group row">
														<label class="col-md-4 control-label" for="Name">Marquee
															name</label>
														<div class="col-md-8">
															<input id="marqueeName" name="marquee.marqueeName"
																type="text" placeholder="Marquee Name"
																class="form-control input-md" required>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-4 control-label" for="address">Marquee
															Address</label>
														<div class="col-md-8">
															<textarea class="form-control" id="address"
																name="marquee.marqueeAddress"
																placeholder="Enter Address..."></textarea>
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-md-4 control-label">City</label>
														<div class="col-md-8">
															<select name="marquee.city.name" class="form-control">
																<s:iterator value="cities">
																	<option value="<s:property value="name" />"><s:property value="name" /></option>
																</s:iterator>
															</select>
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-md-4 control-label" for="marqueeContact">Mobile
															Number</label>
														<div class="col-md-8">
															<input id="marqueeContact" name="marquee.marqueeContact"
																type="number" placeholder="Contact Number"
																class="form-control input-md" required="">

														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-4 control-label" for="emailId">Email
															Id</label>
														<div class="col-md-8">
															<input id="emailId" name="marquee.marqueeEmailId"
																type="email" placeholder="marquee Email Id"
																class="form-control input-md" required>
														</div>
													</div>

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
						<button type="button" class="btn btn-info" id="createMarqueeBtn"
						data-toggle="modal" data-target="#createMarquee">Register Marquee</button>
						
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Customer Data</h3>
								<div id="responseMessageDiv"></div>
							</div>
							<div class="box-body">
								<table id="marqueeListTable"
									class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Marquee Name</th>
											<th>Marquees Address</th>
											<th>Marquee Contact No.</th>
											<th>Marquee Email</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="marqueeList" status="varStatus">
											<tr>
												<td><s:property value="marqueeName" /></td>
												<td><s:property value="marqueeAddress" /></td>
												<td><s:property value="marqueeContact" /></td>
												<td><s:property value="marqueeEmailId" /></td>
												<td><a class="btn btn-sm btn-default editMarquee"
													href="#" id="<s:property value="id" />"><span class="glyphicon glyphicon-edit"> Edit</span></a></td>
												<td><a class="btn btn-sm btn-danger deleteMarquee"
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
	<div id="editMarqueeModalDiv"></div>
	
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

$(".editMarquee").click(function() {
	var marqueeId = this.id;
	$.ajax({
		type : 'POST',
		url : "getEditMarquee.action",
		data : {
			marqueeId : marqueeId
		},
		success : function(res) {
			$("#editMarqueeModalDiv").html(res);
			$("#editMarqueeModal").modal("show");
			$(".modal-backdrop").remove();
		}
	});
});

$(".deleteMarquee").click(function() {
	var marqueeId = this.id;
	
	$("#confirm-delete").modal("show");
	$("#modalDeleteBtn").click(function(e){
		e.preventDefault();
		
		$.ajax({
			type : 'POST',
			url : "deleteMarquee.action",
			data : {
				marqueeId : marqueeId
			},
			success : function(res) {
				//alert(res);
				//$("#responseMessageDiv").html(res);
				/*
				toastr.success("Marquee deleted successfully.", "Yay!!", {
					"timeOut" : "3000",
					"progressBar" : true,
					"extendedTImeout" : "0"
				});
				*/
				location.reload();
				//$("#deleteMarqueeModal").modal("show");
				//  $(".modal-backdrop").removeClass("in");
			}
		});
	});
});
	</script>
</body>
</html>
