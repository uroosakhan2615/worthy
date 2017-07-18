<%@taglib uri="/struts-tags" prefix="s"%>
	<select name="marquee.name.id" class="form-control" id="marqueeId">
		<option>Select A Marquee</option>
		<s:iterator value="marquees">
			<option value="<s:property value="id" />"><s:property value="marqueeName" /></option>
		</s:iterator>
	</select>

<script>
$("#marqueeId").change(function (){
	var marqueeId= this.value;
	$.ajax({
		type : 'POST',
		url : "getHallsByMarquee.action",
		data : {
			marqueeId : marqueeId
		},
		success : function(res) {
			$("#halls").html(res);
		}
	});
});
</script>