<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal" id="editMenuModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<legend>Edit Menu</legend>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="row">
						<form class="form-horizontal" method="post" action="editMenu">
							<fieldset>
								<input type="hidden" name="menu.id" value="${editMenu.id}"/>	
								
								<div class="form-group">
									<label class="col-md-2 control-label">Menu
										Name</label>
									<div class="col-md-4">
										<input name="menu.menuName" type="text"
											value="${editMenu.menuName}" placeholder="Enter Menu Name"
											class="form-control input-md" required>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-2 control-label">Menu Description</label>
									<div class="col-md-4">
										<textarea name="menu.description" type="text" placeholder="Enter Menu Description"
											class="form-control input-md" required>${editMenu.description}</textarea>
									</div>
								</div>
								
								<s:iterator value="editMenu.menuItems" var="menuItem" status="varStatus">
								<div class="form-group">
										<label class="col-md-2 control-label">Menu Item ${varStatus.index+1}</label>
									<div class="col-md-4">
										<input class="form-control" type="hidden" name="menu.menuItems[${varStatus.index}].id" value="${menuItem.id}">
										<input class="form-control" type="text" name="menu.menuItems[${varStatus.index}].name" value="${menuItem.name}">
									</div>
								</div>
								</s:iterator>
								
								<div class="form-group row">
									<label class="col-md-4 control-label" for="submit"></label>
									<div class="col-md-8">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button id="submit" name="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"> Update</span></button>
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