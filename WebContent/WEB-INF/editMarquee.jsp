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