<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/aps-core" prefix="wp" %>
<%@ taglib uri="/apsadmin-core" prefix="wpsa" %>
<%@ taglib uri="/apsadmin-form" prefix="wpsf" %>

<s:set var="categoryTreeStyleVar" ><wp:info key="systemParam" paramName="treeStyle_category" /></s:set>
<s:set var="targetNS" value="%{'/do/jacms/Resource'}" />
<s:set var="targetParamName" value="%{'resourceTypeCode'}" />
<s:set var="targetParamValue" value="resourceTypeCode" />

<h1 class="panel title-page"><span class="panel-body display-block">
<s:property value="%{getText('title.' + resourceTypeCode + 'Management')}" />&#32;/&#32;
<s:text name="title.resourceManagement.resourceTrash" />
<s:include value="/WEB-INF/apsadmin/jsp/common/inc/operations-context-general.jsp" /></span></h1>

<s:form action="delete">
	<p class="sr-only">
		<s:hidden name="resourceId" />
		<s:hidden name="text" value="%{#parameters['text']}" />
		<s:hidden name="categoryCode" value="%{#parameters['categoryCode']}" />
		<s:hidden name="resourceTypeCode" />
		<s:hidden name="fileName" value="%{#parameters['fileName']}" />
		<s:hidden name="ownerGroupName" value="%{#parameters['ownerGroupName']}" />
		<s:if test="#categoryTreeStyleVar == 'request'">
			<s:iterator value="%{#parameters['treeNodesToOpen']}" var="treeNodeToOpenVar"><s:hidden name="treeNodesToOpen" value="%{#treeNodeToOpenVar}"/></s:iterator>
		</s:if>
	</p>
	<div class="alert">
		<a href="<s:url action="list" namespace="/do/jacms/Resource"><s:param name="resourceTypeCode"><s:property value="resourceTypeCode" /></s:param></s:url>" 
		title="<s:text name="note.goToSomewhere" />: <s:text name="title.resourceManagement" />"><span class="icon icon-reply"></span></a>
		<s:text name="note.deleteResource.areYouSure" />:&#32;<code><s:property value="%{loadResource(resourceId).descr}" /></code>?
	<div class="text-center margin-small-top">
		<s:submit value="%{getText('label.remove')}" cssClass="btn btn-default" />
	</div>
	</div>
</s:form>

</div>