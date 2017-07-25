<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Data Tables</title>
<!-- Tell the Marquees_ name to be responsive to screen width -->
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
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
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
										</tr>
									</thead>
									<tbody>
										<s:iterator value="marqueeList" status="varStatus">
											<tr>
												<td><s:property value="marqueeName" /></td>
												<td><s:property value="marqueeAddress" /></td>
												<td><s:property value="marqueeContact" /></td>
												<td><s:property value="marqueeEmailId" /></td>
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
