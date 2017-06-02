<div class="container">
	<div class="row">
		<form class="form-horizontal">
			<fieldset>
				<!-- Form Name -->
				<legend>Marquee Registration Form</legend>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="Name">Marquee name</label>
					<div class="col-md-5">
						<input id="marqueeName" name="marquee.marqueeName" type="text"
							placeholder="username" class="form-control input-md" required>
					</div>
				</div>

				<!-- Textarea -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address">Marquee
						Address</label>
					<div class="col-md-4">
						<textarea class="form-control" id="address" name="marquee.marqueeAddress">default text</textarea>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="marqueeContact">Mobile
						Number</label>
					<div class="col-md-5">
						<input id="marqueeContact" name="marquee.marqueeContact" type="text"
							placeholder="Contact Number" class="form-control input-md"
							required="">

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="emailId">Email
						Id</label>
					<div class="col-md-6">
						<input id="emailId" name="marquee.marqueeEmailId" type="text"
							placeholder="marquee Email Id" class="form-control input-md"
							required>
					</div>
				</div>

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="submit"></label>
					<div class="col-md-4">
						<button id="submit" name="submit" class="btn btn-success">Submit</button>
					</div>
				</div>

			</fieldset>
		</form>
	</div>
</div>