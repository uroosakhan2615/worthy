<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal" id="editEventModal">
	<div class="modal-dialog">
		<!-- Modal content-->
		<s:form class="form-horizontal" action="editEvent" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<div class="row">
						<div class="col-md-9">
							<h3 style="margin-top: 0px;">Event Registration Form</h3>
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
								<input type="hidden" name="event.id" value="${editEvent.id}"/>
								
								<div class="form-group row">
									<label class="col-md-4 control-label">Event name</label>
									<div class="col-md-8">
										<input id="marqueeName" name="marquee.marqueeName" type="text"
											placeholder="Marquee Name" class="form-control input-md" value="${editEvent.eventName}"
											required>
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-md-4 control-label">User</label>
									<div class="col-md-8">
										<select class="form-control" name="event.user.id" required>
											<s:iterator value="userList">
												<option value="<s:property value='id'/>">
													<s:property value="userName" />
												</option>
											</s:iterator>
										</select>
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-md-4 control-label">Marquee</label>
									<div class="col-md-8">
										<select class="form-control" name="event.marquee.id" required>
											<s:iterator value="marqueeList">
												<option value="<s:property value='id'/>">
													<s:property value="marqueeName" />
												</option>
											</s:iterator>
										</select>
									</div>
								</div>

								<div class="form-group row">
									<label class="col-md-4 control-label">Event Status</label>
									<div class="col-md-8">
										<select class="form-control" name="event.status" required>
											<option value="1">Active</option>
											<option value="0">DeActive</option>
										</select>
									</div>
								</div>

								<div class="form-group row">
									<label class="col-md-4 control-label" for="submit"></label>
									<div class="col-md-8">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button id="submit" name="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"> Update</span></button>
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