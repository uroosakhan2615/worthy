<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal" id="editMenuModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<legend>Menu selection Form</legend>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="row">
						<form class="form-horizontal" method="post" action="editMenu">
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label" for="Name">Menu
										Name</label>
									<div class="col-md-4">
									<input type="hidden" name="menu.id" value="${editMenu.id}"/>
									
										<input id="Name" name="menu.menuName" type="text"
											value="${editMenu.menuName}" placeholder="Enter Menu Name"
											class="form-control input-md" required>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-2 control-label" for="address">Event
										Name</label>
									<div class="col-md-4">
										<select class="form-control" name="menu.event.id" required>
											<s:iterator value="eventList">
												<option value="<s:property value='id'/>">
													<s:property value="eventName" />
												</option>
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