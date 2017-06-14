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
<jsp:include page="libIncludes.jsp"></jsp:include>
<style type="text/css">
        * {
  .border-radius(0) !important;
}

#field {
    margin-bottom:20px;
}
    </style>

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
					<div class="row">
						<button type="button" class="btn btn-info" data-toggle="modal"
							data-target="#myModal">Add Menu</button>
					</div>
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
														<label class="col-md-2 control-label" for="Name">Menu
															Name</label>
														<div class="col-md-4">
															<input id="Name" name="menu.menuName" type="text"
																placeholder="Enter Menu Name"
																class="form-control input-md" required>
														</div>
													</div>

													<div class="form-group">
														<label class="col-md-2 control-label" for="address">Event
															Name</label>
														<div class="col-md-4">
															<select class="form-control" name="menu.event.id"
																required>
																<s:iterator value="eventList">
																	<option value="<s:property value="id" />"><s:property
																			value="eventName" /></option>
																</s:iterator>
															</select>
														</div>
													</div>
 <div class="container">
	<div class="row">
	
		<input type="hidden" name="count" value="1" />
        <div class="control-group" id="fields">
            <label class="control-label" for="field1">Menu List</label>
            <div class="controls" id="profs"> 
                <form class="input-append">
                    <div id="field" class="col-md-4"><input autocomplete="off" class="input" id="field1" name="menuList[]" type="text" placeholder="Type something" data-items="8"/><button id="b1" class="btn add-more" type="button">+</button></div>
                </form>
            
            <small>Press + to add another form menu </small>
            </div>
        </div>
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
								<table id="menuTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Menu Name</th>
											<th>Event Name</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="menuList" status="varStatus">
											<tr>
												<td><s:property value="menuName" /></td>
												<td><s:property value="event.eventName" /></td>
												<td><a class="btn btn-sm btn-default editMenu" href="#"
													id="<s:property value="id" />"><span class="glyphicon glyphicon-edit"> Edit</span></a></td>
												<td><a class="btn btn-sm btn-danger deleteMenu"
													href="#" id="<s:property value="id" />"><span class="glyphicon glyphicon-remove"> Delete</span></a></td>
 										</tr>
										</s:iterator>
									</tbody>
								</table>
								
								<s:iterator value="menuList" status="varStatus">
									<div class="col-md-4">
										<div class="thumbnail" style="padding: 0">
											<div style="padding: 4px">
												<img alt="300x200" style="width: 100%"
													src="http://placehold.it/200x150">
											</div>
											<div class="caption">
												<h2>
													<s:property value="menuName" />
												</h2>
												<p>
													<s:property value="description" />
												</p>
											</div>
											<div class="modal-footer" style="text-align: left">
												<div class="progress progress-striped active"
													style="background: #ddd">
													<div class="bar" style="width: 60%;"></div>
												</div>
												<div class="row-fluid"></div>
											</div>
										</div>
									</div>
								</s:iterator>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
		<div class="control-sidebar-bg"></div>
	</div>

	<div id="editMenuModalDiv"></div>

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

//$('#menuTable').dataTable();

$(".editMenu").click(function(){
	var menuId=this.id;
	$.ajax({
	      type: 'POST',
	      url: "getEditMenu.action",
	      data: {
	    	  menuId: menuId
	      },
	      success: function(res) {
	    	  $("#editMenuModalDiv").html(res);
    		  $("#editMenuModal").modal("show");
    		  $(".modal-backdrop").remove();
	    }
	});
  });

 $(".deleteMenu").click(function() {
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

 $(document).ready(function(){
	    var next = 1;
	    $(".add-more").click(function(e){
	        e.preventDefault();
	        var addto = "#field" + next;
	        var addRemove = "#field" + (next);
	        next = next + 1;
	        var newIn = '<input autocomplete="off" class="input form-control" id="field' + next + '" name="field' + next + '" type="text">';
	        var newInput = $(newIn);
	        var removeBtn = '<button id="remove' + (next - 1) + '" class="btn btn-danger remove-me" >-</button></div><div id="field">';
	        var removeButton = $(removeBtn);
	        $(addto).after(newInput);
	        $(addRemove).after(removeButton);
	        $("#field" + next).attr('data-source',$(addto).attr('data-source'));
	        $("#count").val(next);  
	        
	            $('.remove-me').click(function(e){
	                e.preventDefault();
	                var fieldNum = this.id.charAt(this.id.length-1);
	                var fieldID = "#field" + fieldNum;
	                $(this).remove();
	                $(fieldID).remove();
	            });
	    });
	    

	    
	});

</script>
</body>
</html>
