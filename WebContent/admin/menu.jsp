<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta charset="utf-8">
<title>Menus</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="libIncludes.jsp"></jsp:include>

<style>

.fa.fa-edit {
	color: #b1b1b1;
}

.fa.fa-edit:hover {
	color: #018971;
}

.fa.fa-remove {
	color: #b1b1b1;
}

.fa.fa-remove:hover {
	color: red;
}

.img-thumbnail.img-responsive.img-circle {
	width: 150px;
	height: 150px;
}

</style>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="sidebar.jsp"></jsp:include>
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container">
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
											<form class="form-horizontal" method="post" action="addMenu" enctype="multipart/form-data">
												<fieldset>

													<div class="form-group">
														<label class="col-md-2 control-label" for="Name">Menu
															Name</label>
														<div class="col-md-4">
															<input name="menu.menuName" type="text"
																placeholder="Enter Menu Name"
																class="form-control input-md" required>
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-md-2 control-label" for="Name">Menu
															Name</label>
														<div class="col-md-4">
															<textarea name="menu.description"
																placeholder="Enter Menu Description"
																class="form-control input-md" required></textarea>
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-md-2 control-label" for="Name">Upload Image</label>
														<div class="col-md-4">
															<input name="menuImage" type="file" required>
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-md-2 control-label" for="field1">Add
															Menu Items</label>
														<div class="controls col-md-4">
															<div class="entry">
																<div class="form-group">
																	<input class="form-control" name="menu.menuItems.name"
																		type="text" placeholder="Menu Item Name" />

																	<div class="form-group col-md-4">
																		<span class="input-group-btn">
																			<button class="btn btn-success btn-add" type="button">
																				<span class="glyphicon glyphicon-plus"></span>Add
																				New Menu Item
																			</button>
																		</span>
																	</div>
																</div>
															</div>
															<br>
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
							</div>
							
							<div class="col-md-12">
					            <input type="search" class="form-control" id="input-search" placeholder="Search..." >
					        </div>
					        <br><br>
							
							<div class="box-body searchable-container">
							<s:iterator value="menuList" var="menu" status="varStatus">
								<div class="col-md-4 items">
									<div class="panel panel-info">
										<div class="panel-body">
												<div class="panel-header pull-right">
													<a href="#" class="editMenu" id="<s:property value="id" />"><span class="fa fa-edit"></span></a>&nbsp;
													<a href="#" class="deleteMenu" id="<s:property value="id" />"><span class="fa fa-remove"></span></a>
												</div>
												<br>
												<div class="text-center">
													<img src="<s:property value="imageName" />" class="img-thumbnail img-responsive img-circle">
												</div>
											</div>
										<br>
										<div class="row">
											<div class="col-sm-10 col-sm-offset-1">
												<h3 class="text-center">
													<s:property value="menuName" />
												</h3>
												<p class="text-center">
													<s:property value="description" />
												</p>
												<hr>
												<h4 class="text-center">
													Menu Items
												</h4>
												<s:iterator value="menuItems" var="menuItem">
													<hr>
													<h4>
														<s:property value="name" />
													</h4>
												</s:iterator>
												<br>
											</div>
											<div class="col-md-1"></div>
										</div>
										<!--/row-->
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
					<p>You are about to delete one Menu, this cannot be undone.</p>
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

$("body").mCustomScrollbar({
	theme:"inset-2-dark"
});

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
    		  //$(".modal-backdrop").remove();
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

   
   $(document).on('click', '.btn-add', function(e)
	     {
	         e.preventDefault();
	         var controlForm = $('.controls div:first'),
	             currentEntry = $(this).parents('.entry:first'),
	             newEntry = $(currentEntry.clone()).appendTo(controlForm);
	         newEntry.find('input').val('');
	         controlForm.find('.entry:not(:last) .btn-add')
	             .removeClass('btn-add').addClass('btn-remove')
	             .removeClass('btn-success').addClass('btn-danger')
	             .html('<span class="glyphicon glyphicon-minus"></span>');
	     }).on('click', '.btn-remove', function(e)
	     {
	 		$(this).parents('.entry:first').remove();
	 		e.preventDefault();
	 		return false;
	 	});
   
   $('#input-search').on('keyup', function() {
	      var rex = new RegExp($(this).val(), 'i');
	        $('.searchable-container .items').hide();
	        $('.searchable-container .items').filter(function() {
	            return rex.test($(this).text());
	        }).show();
	    });
   

</script>
</body>
</html>
