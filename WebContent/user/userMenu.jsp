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
		<jsp:include page="userSidebar.jsp"></jsp:include>
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
								<s:iterator value="menuList" var="menu" status="varStatus">
									<div class="col-md-4 items">
										<div class="panel panel-info">
											<div class="panel-body">
												<div class="panel-header">
													<br>
													<div class="text-center">
														<img src="<s:property value="imageName" />"
															class="img-thumbnail img-responsive img-circle">
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
														<h4 class="text-center">Menu Items</h4>
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

		<jsp:include page="../footer.jsp"></jsp:include>
		<div class="control-sidebar-bg"></div>

	</div>
	<script>
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
