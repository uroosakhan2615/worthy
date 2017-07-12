<%@taglib uri="/struts-tags" prefix="s"%>
	<select name="marquee.name.id" class="form-control">
		<s:iterator value="marquees">
			<option value="<s:property value="id" />"><s:property value="marqueeName" /></option>
		</s:iterator>
	</select>