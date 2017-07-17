<%@taglib uri="/struts-tags" prefix="s"%>
	<select name="marquee.name.id" class="form-control">
		<s:iterator value="hall">
			<option value="<s:property value="id" />"><s:property value="name" /></option>
		</s:iterator>
	</select>