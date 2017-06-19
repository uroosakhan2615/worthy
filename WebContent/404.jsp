<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta charset="utf-8">
<title>Menus</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../admin/libIncludes.jsp"></jsp:include>

<style>
.img-thumbnail.img-responsive.img-circle {
	width: 150px;
	height: 150px;
}
</style>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper">

			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">Menus</div>

							<div class="col-md-12">
								<input type="search" class="form-control" id="input-search" placeholder="Search...">
							</div>
							<br>
							<br>

							<div class="box-body searchable-container">
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

		<jsp:include page="../footer.jsp"></jsp:include>
		<div class="control-sidebar-bg"></div>
	</div>
</body>
</html>
