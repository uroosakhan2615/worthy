<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal" id="editMarqueeModal">
	<div class="modal-dialog">
		<!-- Modal content-->
		<s:form class="form-horizontal" action="editMarquee" method="post">
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

								<input type="hidden" name="marquee.id" value="${editMarquee.id}"/>
								
								<div class="form-group row">
									<label class="col-md-4 control-label" for="Name">Marquee
										name</label>
									<div class="col-md-8">
										<input id="marqueeName" name="marquee.marqueeName" type="text"
											placeholder="Marquee Name" class="form-control input-md" value="${editMarquee.marqueeName}"
											required>
									</div>
								</div>

								<!-- Textarea -->
								<div class="form-group row">
									<label class="col-md-4 control-label" for="address">Marquee
										Address</label>
									<div class="col-md-8">
										<textarea class="form-control" id="address"
											name="marquee.marqueeAddress" placeholder="Enter Address...">${editMarquee.marqueeAddress}</textarea>
									</div>
								</div>
								
								<div class="form-group row">
										<label class="col-md-4 control-label">City</label>
										<div class="col-md-8">
											<select name="marquee.city.id" class="form-control">
												<s:iterator value="cities">
													<option value="<s:property value="id" />"><s:property value="name" /></option>
												</s:iterator>
											</select>
										</div>
									</div>
								
								<!-- Text input-->
								<div class="form-group row">
									<label class="col-md-4 control-label" for="marqueeContact">Mobile
										Number</label>
									<div class="col-md-8">
										<input id="marqueeContact" name="marquee.marqueeContact"
											type="number" placeholder="Contact Number" value="${editMarquee.marqueeContact}"
											class="form-control input-md" required>

									</div>
								</div>

								<!-- Text input-->
								<div class="form-group row">
									<label class="col-md-4 control-label" for="emailId">Email
										Id</label>
									<div class="col-md-8">
										<input id="emailId" name="marquee.marqueeEmailId" type="email" value="${editMarquee.marqueeEmailId}"
											placeholder="marquee Email Id" class="form-control input-md"
											required>
									</div>
								</div>
								
								<s:iterator value="editMarquee.halls" var="item" status="varStatus">
									<div class="form-group row">
										<div class="col-md-2">
											<label class="control-label">Hall ${varStatus.index+1}</label>
										</div>
										<br>
										<div class="col-md-8">
											<input class="form-control" type="hidden" name="marquee.halls[${varStatus.index}].id" value="${item.id}">
											<label class="col-md-4 control-label">Hall name</label>
											<input class="form-control" type="text" name="marquee.halls[${varStatus.index}].name" value="${item.name}">
											<label class="col-md-4 control-label">Hall capacity</label>
											<input class="form-control" type="number" name="marquee.halls[${varStatus.index}].capacity" value="${item.capacity}">
											<label class="col-md-4 control-label">Hall Rent</label>
											<input class="form-control" type="number" name="marquee.halls[${varStatus.index}].rent" value="${item.rent}">
										</div>
									</div>
									<br>
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
						</div>
					</div>
				</div>
			</div>
		</s:form>
	</div>
</div>