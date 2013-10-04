<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wp" uri="/aps-core" %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core" %>
<%@ taglib prefix="wpsf" uri="/apsadmin-form" %>

<s:set var="categoryTreeStyleVar" ><wp:info key="systemParam" paramName="treeStyle_category" /></s:set>

<s:if test="#categoryTreeStyleVar == 'request'">
<p class="noscreen">
<s:iterator value="treeNodesToOpen" var="treeNodeToOpenVar"><wpsf:hidden name="treeNodesToOpen" value="%{#treeNodeToOpenVar}"></wpsf:hidden></s:iterator>
</p>
</s:if>

<fieldset class="margin-base-vertical">
	<legend><span class="icon icon-tags"></span>&#32;<s:text name="title.categoriesManagement"/></legend>
<ul id="categoryTree" class="icons-ul list-unstyled">
	<s:set name="inputFieldName" value="'categoryCode'" />
	<s:set name="selectedTreeNode" value="categoryCode" />
	<s:set name="liClassName" value="'category'" />
	<s:set name="treeItemIconName" value="'icon-folder-close'" />

	<s:if test="#categoryTreeStyleVar == 'classic'">
		<s:set name="currentRoot" value="categoryRoot" />
	 	<s:include value="/WEB-INF/apsadmin/jsp/common/treeBuilder.jsp" />
	</s:if>
	<s:elseif test="#categoryTreeStyleVar == 'request'">
		<s:set name="currentRoot" value="showableTree" />
		<s:set name="openTreeActionName" value="'entryContent'" />
		<s:set name="closeTreeActionName" value="'entryContent'" />
		<s:include value="/WEB-INF/apsadmin/jsp/common/treeBuilder-request-submits.jsp" />
	</s:elseif>
</ul>
<div id="actions-container">
	<s:submit useTabindexAutoIncrement="true" action="joinCategory" type="button" value="%{getText('label.join')}" cssClass="btn btn-default btn-small">
		<span class="icon icon-plus"></span>&nbsp;&nbsp;<s:text name="label.join" />
	</s:submit>
</div>
<s:set var="contentCategories" value="content.categories" />

<s:if test="#contentCategories != null && #contentCategories.size() > 0">

<table class="generic" summary="<s:text name="note.contentCategories.summary"/>: <s:property value="content.descr" />">
<caption><span><s:text name="title.contentCategories.list"/></span></caption>
<tr>
	<th><s:text name="label.category"/></th>
	<th class="icon"><abbr title="<s:text name="label.remove" />">&ndash;</abbr></th>
</tr>
<s:iterator value="#contentCategories" id="contentCategory">
<tr>
	<td><s:property value="#contentCategory.getFullTitle(currentLang.code)"/></td>
	<td class="icon">
		<wpsa:actionParam action="removeCategory" var="actionName" >
			<wpsa:actionSubParam name="categoryCode" value="%{#contentCategory.code}" />
		</wpsa:actionParam>
		<s:set name="iconImagePath" id="iconImagePath"><wp:resourceURL />administration/common/img/icons/delete.png</s:set>
		<wpsf:submit useTabindexAutoIncrement="true" type="image" src="%{#iconImagePath}" action="%{#actionName}" value="%{getText('label.remove')}" title="%{getText('label.remove') + ' ' + #contentCategory.defaultFullTitle}" />
	</td>
</tr>
</s:iterator>
</table>
</s:if>
</fieldset>