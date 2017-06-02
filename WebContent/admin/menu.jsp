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
  
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Add Menu</button>

					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<legend>Marquee Registration Form</legend>
								</div>
								<div class="modal-body">
									<div class="container">
										<div class="row">
											<form class="form-horizontal">
												<fieldset>
													<!-- Form Name -->
													<!-- Text input-->
													<div class="form-group">
														<label class="col-md-2 control-label" for="Name">Marquee_name</label>
														<div class="col-md-3">
															<input id="Name" name="Name" type="text"
																placeholder="username" class="form-control input-md"
																required="">
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-2 control-label" for="textinput">Marquee_id</label>
														<div class="col-md-3">
															<input id="passwordinput" name="passwordinput"
																type="number" placeholder=""
																class="form-control input-md" required=""> <span
																class="help-block">max 16 characters</span>
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-2 control-label" for="address">Marquee
															Address</label>
														<div class="col-md-3">
															<textarea class="form-control" id="address"
																name="address">default text</textarea>
														</div>
													</div>
													<!-- Select Basic -->
													<div class="form-group">
														<label class="col-md-2 control-label" for="country">city</label>
														<div class="col-md-3">
															<select id="city" name="city" class="form-control">
																<option value="Rawalpindi">Rawalpindi</option>
																<option value="Islamabad">Islamabad</option>
																<option value="Lahore">Lahore</option>
																<option value="Faisalabad">Faislabad</option>
																<option value="">Murree</option>
															</select>
														</div>
													</div>
													<!-- Text input-->
													<div class="form-group">
														<label class="col-md-2 control-label" for="mobilenumber">Mobile
															Number</label>
														<div class="col-md-3">
															<input id="mobilenumber" name="mobilenumber" type="text"
																placeholder="Mobile Number"
																class="form-control input-md" required="">
														</div>
													</div>

													<!-- Text input-->
													<div class="form-group">
														<label class="col-md-2 control-label" for="emailId">Email
															Id</label>
														<div class="col-md-3">
															<input id="emailId" name="emailId" type="text"
																placeholder="user@domain.com"
																class="form-control input-md" required="">

														</div>
													</div>
													<div class="form-group">
														<label class="col-md-2 control-label" for="submit"></label>
														<div class="col-md-4">
															<button id="submit" name="submit" class="btn btn-success">Submit</button>
														</div>
													</div>

												</fieldset>
											</form>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
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
                  <th>Menu Name</th>
                  <th>Edit</th>
                  <th>Delete</th>
                </tr>
                </thead>
               <tbody>
					<s:iterator value="menuList" status="varStatus">
						<tr>
						<td><s:property value="name" /></td>
						<td><a class="btn btn-sm btn-default editMarquee" href="#" id="<s:property value="id" />">Edit</a></td>
						<td><a class="btn btn-sm btn-danger deleteMarquee" href="#" id="<s:property value="id" />">Delete</a></td>
					</s:iterator>
				</tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.8
    </div>
    <strong>Copyright &copy; 2017 <a href="#">Worthy</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
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
	    		  //alert(res);
	    		  $("#editUserModal").modal("show");
	    		 //$(".modal-backdrop").remove();
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
