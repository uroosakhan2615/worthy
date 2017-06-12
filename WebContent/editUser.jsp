<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal" id="editUserModal">
	<div class="modal-dialog">
		<!-- Modal content-->
		<s:form class="form-horizontal" action="editUser" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<div class="row">
						<div class="col-md-9">
							<h3 style="margin-top: 0px;">Edit User</h3>
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

								<input type="hidden" name="user.id" value="${editUser.id}"/>
								
								<div class="form-group row">
									<label class="col-md-4 control-label">User name</label>
									<div class="col-md-8">
										<input id="marqueeName" name="user.userName" type="text"
											placeholder="User Name" class="form-control input-md" value="${editUser.userName}"
											required>
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-md-4 control-label" for="marqueeContact">Email Address</label>
									<div class="col-md-8">
										<input id="marqueeContact" name="user.email"
											type="text" placeholder="Email Address" value="${editUser.email}"
											class="form-control input-md" required>
									</div>
								</div>

								<!-- Button -->
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