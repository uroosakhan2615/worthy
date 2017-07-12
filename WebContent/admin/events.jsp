<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Events</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="libIncludes.jsp"></jsp:include>


<style>

   @import url("http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,400italic");
   
   .event-list {
	list-style: none;
	font-family: 'Lato', sans-serif;
	margin: 0px;
	padding: 0px;
}
.event-list > li {
	background-color: rgb(255, 255, 255);
	box-shadow: 0px 0px 5px rgb(51, 51, 51);
	box-shadow: 0px 0px 5px rgba(51, 51, 51, 0.7);
	padding: 0px;
	margin: 0px 0px 20px;
}
.event-list > li > time {
	display: inline-block;
	width: 100%;
	color: rgb(255, 255, 255);
	background-color: rgb(197, 44, 102);
	padding: 5px;
	text-align: center;
	text-transform: uppercase;
}

.event-list > li:nth-child(even) > time {
	background-color: rgb(165, 82, 167);
}

.event-list > li > time > .day {
	display: block;
	font-size: 36pt;
	font-weight: 100;
	line-height: 1;
}
.event-list > li time > .month {
	display: block;
	font-size: 24pt;
	font-weight: 900;
	line-height: 1;
}

.event-list > li time > .year {
	display: block;
	font-size: 16pt;
	font-weight: 200;
	line-height: 1;
}

.event-list > li > img {
	width: 100%;
}
.event-list > li > .info {
	padding-top: 5px;
	text-align: center;
	margin-top: -20px;
}
.event-list > li > .info > .title {
	font-size: 17pt;
	font-weight: 700;
	margin: 0px;
}
.event-list > li > .info > .desc {
	font-size: 13pt;
	font-weight: 300;
	margin: 0px;
}
.event-list > li > .info > ul,
.event-list > li > .social > ul {
	display: table;
	list-style: none;
	margin: 10px 0px 0px;
	padding: 0px;
	width: 100%;
	text-align: center;
}
.event-list > li > .social > ul {
	margin: 0px;
}
.event-list > li > .info > ul > li,
.event-list > li > .social > ul > li {
	display: table-cell;
	cursor: pointer;
	color: rgb(30, 30, 30);
	font-size: 11pt;
	font-weight: 300;
       padding: 3px 0px;
}
   .event-list > li > .info > ul > li > a {
	display: block;
	width: 100%;
	color: rgb(30, 30, 30);
	text-decoration: none;
} 
   .event-list > li > .social > ul > li {    
       padding: 0px;
   }
   .event-list > li > .social > ul > li > a {
       padding: 3px 0px;
} 
.event-list > li > .info > ul > li:hover,
.event-list > li > .social > ul > li:hover {
	color: rgb(30, 30, 30);
	background-color: rgb(200, 200, 200);
}
.facebook a,
.twitter a,
.google-plus a {
	display: block;
	width: 100%;
	color: rgb(75, 110, 168) !important;
}
.twitter a {
	color: rgb(79, 213, 248) !important;
}
.google-plus a {
	color: rgb(221, 75, 57) !important;
}
.facebook:hover a {
	color: rgb(255, 255, 255) !important;
	background-color: rgb(75, 110, 168) !important;
}
.twitter:hover a {
	color: rgb(255, 255, 255) !important;
	background-color: rgb(79, 213, 248) !important;
}
.google-plus:hover a {
	color: rgb(255, 255, 255) !important;
	background-color: rgb(221, 75, 57) !important;
}

@media (min-width: 768px) {
	.event-list > li {
		position: relative;
		display: block;
		width: 100%;
		height: 140px;
		padding: 0px;
	}
	.event-list > li > time,
	.event-list > li > img  {
		display: inline-block;
	}
	.event-list > li > time,
	.event-list > li > img {
		width: 120px;
		float: left;
	}
	.event-list > li > .info {
		overflow: hidden;
	}
	.event-list > li > time,
	.event-list > li > img {
		width: 120px;
		height: 140px;
		padding: 0px;
		margin: 0px;
	}
	.event-list > li > .info {
		position: relative;
		height: 140px;
		text-align: left;
		padding-right: 40px;
	}	
	.event-list > li > .info > .title, 
	.event-list > li > .info > .desc {
		padding: 0px 10px;
	}
	.event-list > li > .info > ul {
		position: absolute;
		left: 0px;
		bottom: 0px;
	}
	.event-list > li > .social {
		position: absolute;
		top: 0px;
		right: 0px;
		display: block;
		width: 40px;
	}
       .event-list > li > .social > ul {
           border-left: 1px solid rgb(230, 230, 230);
       }
	.event-list > li > .social > ul > li {			
		display: block;
           padding: 0px;
	}
	.event-list > li > .social > ul > li > a {
		display: block;
		width: 40px;
		padding: 10px 0px 9px;
	}
}

</style>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<!-- Left side column. contains the logo and sidebar -->
		<jsp:include page="sidebar.jsp"></jsp:include>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container">
					<div class="modal fade" id="addEventModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								
								<div class="modal-body">
									<div class="container">
										<div class="row">
											<form class="form-horizontal" method="post" action="addEvent">
												<fieldset>
													<div class="form-group">
														<label class="col-md-2 control-label">Event
															Name</label>
														<div class="col-md-4">
															<input id="Name" name="event.eventName" type="text"
																placeholder="Enter Menu Name"
																class="form-control input-md" required>
														</div>
													</div>

													<div class="form-group">
														<label class="col-md-2 control-label" for="address">Marquee
															Address</label>
														<div class="col-md-4">
															<textarea class="form-control"
																name="event.description"
																placeholder="Enter Description..."></textarea>
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-md-2 control-label">User</label>
														<div class="col-md-4">
															<select class="form-control" name="event.user.id"
																required>
																<s:iterator value="userList">
																	<option value="<s:property value='id'/>">
																		<s:property value="userName" />
																	</option>
																</s:iterator>
															</select>
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-md-2 control-label">Marquee Name</label>
														<div class="col-md-4">
															<select class="form-control" name="event.marquee.id" required>
																<s:iterator value="marqueeList">
																	<option value="<s:property value="id" />"><s:property
																			value="marqueeName" /></option>
																</s:iterator>
															</select>
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-md-2 control-label">Select Menu</label>
														<div class="col-md-4">
															<select class="form-control" name="event.menu.id" required>
																<s:iterator value="menuList">
																	<option value="<s:property value="id" />"><s:property
																			value="menuName" /></option>
																</s:iterator>
															</select>
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-md-2 control-label">Event Status</label>
														<div class="col-md-4">
															<select class="form-control" name="event.status" required>
																<option value="true">Active</option>
																<option value="false">DeActive</option>
															</select>
														</div>
													</div>

													<div class="form-group">
														<label class="col-md-2 control-label">Start Date</label>
														<div class="col-md-4">
															<input id="startDate" name="startDateStr" type="text"
																placeholder="Select Start Date"
																class="form-control input-md" readonly>
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-md-2 control-label">End Date</label>
														<div class="col-md-4">
															<input id="endDate" name="endDateStr" type="text"
																placeholder="Select End Date"
																class="form-control input-md" readonly>
														</div>
													</div>
													
													<div class="form-group row">
														<label class="col-md-4 control-label" for="submit"></label>
														<div class="col-md-8">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">Close</button>
															<button id="submit" name="submit" class="btn btn-success">Add</button>
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

			<section class="content">
				<div class="row">
					<div class="col-xs-12">
					<div>
						<button type="button" class="btn btn-info" data-toggle="modal"
							data-target="#addEventModal">Add Event</button>
					</div>
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Menus</h3>
							</div>
							<div class="box-body">
								<table id="eventTable" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Event Name</th>
											<th>User</th>
											<th>Marquee</th>
											<th>Status</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="eventList" status="varStatus">
											<tr>
												<td><s:property value="eventName" /></td>
												<td><s:property value="user.userName" /></td>
												<td><s:property value="marquee.marqueeName" /></td>
												
												<s:if test="status==1">
													<td><span class="btn-sm btn-success glyphicon glyphicon-ok"> Active</span></td>
												</s:if>
												<s:else>
													<td><a href="#" class="btn btn-sm btn-danger">Inactive</a></td>
												</s:else>
													<td><a class="btn btn-sm btn-default editEvent"
													href="#" id="<s:property value="id" />"><span class="glyphicon glyphicon-edit"> Edit</span></a></td>
													<td><a class="btn btn-sm btn-danger deleteEvent" href="#" id="<s:property value="id" />"><span class="glyphicon glyphicon-remove"> Delete</span></a></td>
											</tr>
										</s:iterator>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
</section>
			
			
<!-- New event Layout -->

<div class="container">
	<div class="row">
		<div class="col-xs-11">
			<ul class="event-list">
				<s:iterator value="eventList" var="event">
					<li><time>
							<p>Start Date</p>
							<span class="day"><s:date name="startDate" format="dd" /></span>
							<span class="month"><s:date name="startDate" format="MMM" /></span>
							<span class="year"><s:date name="startDate" format="yyyy" /></span>
						</time> &nbsp; <time>
							<p>End Date</p>
							<span class="day"><s:date name="endDate" format="dd" />
							</span><span class="month"><s:date name="endDate" format="MMM" /></span>
							<span class="year"><s:date name="endDate" format="yyyy" /></span>
						</time>
						<img src="" />
						<div class="info">
							<h2 class="title">
								<s:property value="eventName" />
							</h2>
							<p class="desc">
								<s:property value="description" />
							</p>
							<ul>
								<li style="width: 50%;"><a
									href="userProfile/${event.user.id}"> <span
										class="fa fa-user"></span> ${event.user.profile.fullName}
								</a></li>
								<li style="width: 50%;"><span class="fa fa-home">${event.marquee.marqueeName}</span></li>
							</ul>
						</div>

						<div class="social">
							<ul>
								<li class="facebook" style="width: 33%;"><a
									href="#facebook"><span class="fa fa-edit"></span></a></li>
								<li class="google-plus" style="width: 33%;"><a
									href="#google-plus"><span class="fa fa-remove"></span></a></li>
							</ul>
						</div></li>
				</s:iterator>
				</ul>
			</div>
		</div>
	</div>

</div>

		<jsp:include page="footer.jsp"></jsp:include>
		<div class="control-sidebar-bg"></div>
	</div>

	<div id="editEventModalDiv"></div>

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
					<p>You are about to delete one Event, this procedure is
						irreversible.</p>
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

$('#eventTable').dataTable();

$('#startDate, #endDate').datepicker({
	format: 'dd/mm/yyyy',
	todayHighlight: true,
	autoclose: true
});

$(".editEvent").click(function() {
	var eventId = this.id;
	$.ajax({
		type : 'POST',
		url : "getEditEvent.action",
		data : {
			eventId : eventId
		},
		success : function(res) {
			$("#editEventModalDiv").html(res);
			$("#editEventModal").modal("show");
			$(".modal-backdrop").remove();
		}
	});
});


$(".deleteEvent").click(function() {
	var eventId = this.id;
	
	$("#confirm-delete").modal("show");
	$("#modalDeleteBtn").click(function(e){
		e.preventDefault();
		$.ajax({
			type : 'POST',
			url : "deleteEvent.action",
			data : {
				eventId : eventId
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

</script>
</body>
</html>
