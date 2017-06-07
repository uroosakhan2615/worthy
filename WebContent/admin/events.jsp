<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Data Tables</title>
  <!-- Tell the Marquees_ name to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
    <div class="container">
  <!-- Trigger the modal with a button -->
  
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Add Event</button>

					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<legend>Menu selection Form</legend>
								</div>
								<div class="modal-body">
									<div class="container">
										<div class="row">
											<form class="form-horizontal" method="post" action="addMenu">
												<fieldset>
													<div class="form-group">
														<label class="col-md-2 control-label" for="Name">Event Name</label>
														<div class="col-md-4">
															<input id="Name" name="event.eventName" type="text"
																placeholder="Enter Menu Name" class="form-control input-md"
																required>
														</div>
													</div>

													<div class="form-group">
														<label class="col-md-2 control-label" for="address">Event Name</label>
														<div class="col-md-4">
															<select class="form-control" name="event.status" required>
																<option value="">Active</option>
																<option value="">DeActive</option>
															</select>
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-md-2 control-label">Marquee Name</label>
														<div class="col-md-4">
															<select class="form-control" name="event.marquee.id" required>
																<s:iterator value="marqueeList">
																	<option value="<s:property value="id" />"><s:property value="marqueeName" /></option>
																</s:iterator>
															</select>
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
											</form>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
    <h1>
        Data Tables
        <small>advanced tables</small>
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
              <h3 class="box-title">Menus</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Event Name</th>
                  <th>Status</th>
                  <th>Edit</th>
                  <th>Delete</th>
                </tr>
                </thead>
               <tbody>
					<s:iterator value="eventList" status="varStatus">
						<tr>
							<td><s:property value="eventName" /></td>
							<td><s:property value="status" /></td>
							<td><a class="btn btn-sm btn-default editEvent" href="#" id="<s:property value="id" />">Edit</a></td>
							<td><a class="btn btn-sm btn-danger deleteEvent" href="#" id="<s:property value="id" />">Delete</a></td>
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
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.8
    </div>
    <strong>Copyright &copy; 2017 <a href="#">Worthy</a>.</strong> All rights
    reserved.
  </footer>

  <div class="control-sidebar-bg"></div>
</div>

<script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/1.3.1/js/toastr.js"></script>
<script>

$(".deleteMenu").click(function() {
	var menuId = this.id;
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

</script>
</body>
</html>
