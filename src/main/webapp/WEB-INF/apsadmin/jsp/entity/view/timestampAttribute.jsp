<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="%{#lang.default || #attributeTracer.listElement}">
	<s:property value="#attribute.getFormattedDate('dd/MM/yyyy')" />&ndsh;
	<s:property value="#attribute.getFormattedDate('HH')" />:<s:property value="#attribute.getFormattedDate('mm')" />
</s:if>
<s:else>
	<s:text name="EntityAttribute.monolang.defaultValue" />
</s:else>