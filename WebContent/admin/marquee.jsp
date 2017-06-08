<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Data Tables</title>
<!-- Tell the Marquees_ name to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="libIncludes.jsp"></jsp:include>
<script src="http://localhost:8080/worthy/admin/js/jquery.dataTables.min.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<!-- Left side column. contains the logo and sidebar -->
		<jsp:include page="sidebar.jsp"></jsp:include>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<!-- modal -->
				<div class="container">
					<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-info btn-lg" id="createMarqueeBtn"
						data-toggle="modal" data-target="#createMarquee">Register
						Marquee</button>
					<!-- Modal -->
					<div class="modal" id="createMarquee" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<s:form class="form-horizontal" action="registerMarquee" method="post">
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

													<!-- Form Name -->


													<div class="form-group row">
														<label class="col-md-4 control-label" for="Name">Marquee
															name</label>
														<div class="col-md-8">
															<input id="marqueeName" name="marquee.marqueeName"
																type="text" placeholder="Marquee Name"
																class="form-control input-md" required>
														</div>
													</div>

													<!-- Textarea -->
													<div class="form-group row">
														<label class="col-md-4 control-label" for="address">Marquee
															Address</label>
														<div class="col-md-8">
															<textarea class="form-control" id="address"
																name="marquee.marqueeAddress"
																placeholder="Enter Address..."></textarea>
														</div>
													</div>

													<!-- Text input-->
													<div class="form-group row">
														<label class="col-md-4 control-label" for="marqueeContact">Mobile
															Number</label>
														<div class="col-md-8">
															<input id="marqueeContact" name="marquee.marqueeContact"
																type="number" placeholder="Contact Number"
																class="form-control input-md" required="">

														</div>
													</div>

													<!-- Text input-->
													<div class="form-group row">
														<label class="col-md-4 control-label" for="emailId">Email
															Id</label>
														<div class="col-md-8">
															<input id="emailId" name="marquee.marqueeEmailId"
																type="email" placeholder="marquee Email Id"
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

				<!-- modal ends here -->
</div>
				<h1>
					Data Tables <small>advanced tables</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Tables</a></li>
					<li class="active">Data tables</li>
				</ol>
			</section>
	
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Customer Data</h3>
								<div id="responseMessageDiv"></div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="marqueeListTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Marquee_ name</th>
											<th>Marquees_address</th>
											<th>Marquee contact no</th>
											<th>Marquee_email</th>
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
										<td><a class="btn btn-sm btn-default editMarquee" href="#" id="<s:property value="id" />">Edit</a></td>
										<td><a class="btn btn-sm btn-danger deleteMarquee" href="#" id="<s:property value="id" />">Delete</a></td>
									</s:iterator>
									</tbody>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.3.8
			</div>
			<strong>Copyright &copy; 2017 <a href="#">Worthy</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
						class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-user bg-yellow"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Frodo Updated His
										Profile</h4>

									<p>New phone +1(800)555-1234</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-envelope-o bg-light-blue"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Nora Joined Mailing
										List</h4>

									<p>nora@example.com</p>
								</div>
						</a></li>
						<li><a href="javascript:void(0)"> <i
								class="menu-icon fa fa-file-code-o bg-green"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Cron Job 254
										Executed</h4>

									<p>Execution time 5 seconds</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span
										class="label label-danger pull-right">70%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Update Resume <span class="label label-success pull-right">95%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-success"
										style="width: 95%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Laravel Integration <span
										class="label label-warning pull-right">50%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-warning"
										style="width: 50%"></div>
								</div>
						</a></li>
						<li><a href="javascript:void(0)">
								<h4 class="control-sidebar-subheading">
									Back End Framework <span class="label label-primary pull-right">68%</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-primary"
										style="width: 68%"></div>
								</div>
						</a></li>
					</ul>
				</div>
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Allow mail
								redirect <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Other sets of options are available</p>
						</div>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Expose author
								name in posts <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Allow the user to show his name in blog posts</p>
						</div>

						<h3 class="control-sidebar-heading">Chat Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Show me as
								online <input type="checkbox" class="pull-right" checked>
							</label>
						</div>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Turn off
								notifications <input type="checkbox" class="pull-right">
							</label>
						</div>
						<div class="form-group">
							<label class="control-sidebar-subheading"> Delete chat
								history <a href="javascript:void(0)" class="text-red pull-right"><i
									class="fa fa-trash-o"></i></a>
							</label>
						</div>
					</form>
				</div>
			</div>
		</aside>
		<div class="control-sidebar-bg"></div>
	</div>
	<div id="editMarqueeModalDiv"></div>
<script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/1.3.1/js/toastr.js"></script>
<script>
  $('#marqueeListTable').DataTable();
  
  //called on modal shown
  $("#createMarquee").on('shown.bs.modal', function(){
	  $(".modal-backdrop").remove();
	});	
  
  $("#createMarquee").on('hidden.bs.modal', function(){
	  $('#createMarquee').modal('hide');
	  $('#createMarquee').remove('.modal-backdrop');
	  //$('.modal-backdrop').remove();
	});
  
  $(".editMarquee").click(function(){
	var marqueeId=this.id;
	$.ajax({
	      type: 'POST',
	      url: "getEditMarquee.action",
	      data: {
	    	  marqueeId: marqueeId
	      },
	      success: function(res) {
	    	  $("#editMarqueeModalDiv").html(res);
    		  //alert(res);
    		  $("#editMarqueeModal").modal("show");
    		  $(".modal-backdrop").remove();
	    }
	});
  });
  
	$(".deleteMarquee").click(function() {
		var marqueeId = this.id;
		$.ajax({
			type : 'POST',
			url : "deleteMarquee.action",
			data : {
				marqueeId : marqueeId
			},
			success : function(res) {
				//alert(res);
				//$("#responseMessageDiv").html(res);
				toastr.success("Marquee deleted successfully.", "Yay!!", {
					"timeOut" : "3000",
					"progressBar" : true,
					"extendedTImeout" : "0"
				});
				location.reload();
				//alert(res);
				//$("#deleteMarqueeModal").modal("show");
				//  $(".modal-backdrop").removeClass("in");
			}
		});
	});
</script>
</body>
</html>
 