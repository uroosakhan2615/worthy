<%@taglib uri="/struts-tags" prefix="s"%>
<select id="hallId" name="hall.id" class="form-control" required>
	<option selected>Select A Marquee First</option>
	<s:iterator var="obj" value="hall">
		<option id="<s:property value="id" />" value="<s:property value="id" />"><s:property value="name" /></option>
	</s:iterator>
</select>


<script>

$('#hallId').change(function(){
	var hallId = $(this).children(":selected").attr("id");
	
	$.ajax({
		type : 'POST',
		url : "getHallById.action",
		data : {
			hallId : hallId
		},
		success : function(res) {
			$("#RentNcapacity").html(res);
		}
	});
});
</script>