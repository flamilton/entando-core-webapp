<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="/aps-core" prefix="wp" %>
<%@ taglib uri="/apsadmin-core" prefix="wpsa" %>
<s:set var="targetNS" value="%{'/do/jacms/Content'}" />
<h1 class="panel title-page"><s:text name="jacms.menu.contentAdmin" />&#32;/&#32;<s:text name="label.new" /></h1>
<%-- TODO new | edit --%>

	<s:if test="hasFieldErrors()">
<div class="message message_error">
<h2><s:text name="message.title.FieldErrors" /></h2>	
	<ul>
	<s:iterator value="fieldErrors">
		<s:iterator value="value">
		<li><s:property escape="false" /></li>
		</s:iterator>
	</s:iterator>
	</ul>
</div>
	</s:if>
<p class="noscreen"><s:text name="note.editContent" /></p> 	

<%--
<h3 class="noscreen" id="quickmenu"><s:text name="title.quickMenu" /></h3>
<ul class="menu horizontal tab-toggle-bar"><li><a href="#info" id="info_tab_quickmenu" class="tab-toggle"><abbr title="<s:text name="title.contentInfo" />"><s:text name="label.general" /></abbr></a></li><s:iterator value="langs" id="lang"><li><a href="#<s:property value="#lang.code" />_tab" class="tab-toggle"><s:property value="#lang.descr" /></a></li></s:iterator></ul>
--%>

<s:set name="removeIcon" id="removeIcon"><wp:resourceURL/>administration/common/img/icons/delete.png</s:set>

<s:form cssClass="tab-container action-form">

<s:set var="myNameIsJack" value="true" />
<s:include value="/WEB-INF/plugins/jacms/apsadmin/jsp/content/include/snippet-content.jsp" />

<p class="noscreen">
	<s:hidden name="contentOnSessionMarker" />
</p>

<!-- START CICLO LINGUA -->
<s:iterator value="langs" var="lang">

<%-- TEMP FOR RAW PROTOTYPE --%>
<s:if test="#lang.code == 'en'">

	<div id="<s:property value="#lang.code" />_tab" class="tab">
	<%--
	<h3 class="js_noscreen"><s:property value="#lang.descr" /> (<a class="backLink" href="#quickmenu" id="<s:property value="#lang.code" />_tab_quickmenu"><s:text name="note.goBackToQuickMenu" /></a>)</h3>
	--%>

	<!-- START CICLO ATTRIBUTI -->
	<s:iterator value="content.attributeList" var="attribute">
	<div class="margin-base-vertical" id="<s:property value="%{'contentedit_'+#lang.code+'_'+#attribute.name}" />">
	<%-- INIZIALIZZAZIONE TRACCIATORE --%> 
	<wpsa:tracerFactory var="attributeTracer" lang="%{#lang.code}" />

	<s:if test="null != #attribute.description"><s:set var="attributeLabelVar" value="#attribute.description" /></s:if>
	<s:else><s:set var="attributeLabelVar" value="#attribute.name" /></s:else>

	<s:if test="#attribute.type == 'List' || #attribute.type == 'Monolist'">
	<p class="important">
		<span class="basic-mint-label"><span class="attribute-main-label"><s:property value="#attributeLabelVar" /></span></span><s:include value="/WEB-INF/apsadmin/jsp/entity/modules/include/attributeInfo.jsp" /><span class="monospace">&#32;(<s:text name="label.list" />)</span>:
	</p>
	</s:if>
	<s:elseif test="#attribute.type == 'Image' || #attribute.type == 'CheckBox' || #attribute.type == 'Boolean' || #attribute.type == 'ThreeState' || #attribute.type == 'Composite'">
	<p>
		<span class="important basic-mint-label"><span class="attribute-main-label"><s:property value="#attributeLabelVar" /></span><s:include value="/WEB-INF/apsadmin/jsp/entity/modules/include/attributeInfo.jsp" />:</span>

	</s:elseif>
	<s:elseif test="#attribute.type == 'Monotext' || #attribute.type == 'Text' || #attribute.type == 'Longtext' || #attribute.type == 'Hypertext' || #attribute.type == 'Attach' || #attribute.type == 'Number' || #attribute.type == 'Date' || #attribute.type == 'Timestamp' || #attribute.type == 'Link' || #attribute.type == 'Enumerator'">
	<p>
		<label class="display-block" for="<s:property value="%{#attributeTracer.getFormFieldName(#attribute)}" />"><s:property value="#attributeLabelVar" />&#32;<s:include value="/WEB-INF/apsadmin/jsp/entity/modules/include/attributeInfo.jsp" /></label>
	</s:elseif>

	<s:if test="#attribute.type == 'Monotext'">
	<!-- ############# ATTRIBUTO TESTO MONOLINGUA ############# -->
	<s:include value="/WEB-INF/apsadmin/jsp/entity/modules/monotextAttribute.jsp" />
	</p>
	</s:if>

	<s:elseif test="#attribute.type == 'Text'">
	<!-- ############# ATTRIBUTO TESTO SEMPLICE MULTILINGUA ############# -->
	<s:include value="/WEB-INF/apsadmin/jsp/entity/modules/textAttribute.jsp" />
	</p>
	</s:elseif>

	<s:elseif test="#attribute.type == 'Longtext'">
	<!-- ############# ATTRIBUTO TESTOLUNGO ############# -->
	<s:include value="/WEB-INF/apsadmin/jsp/entity/modules/longtextAttribute.jsp" />
	</p>
	</s:elseif>

	<s:elseif test="#attribute.type == 'Hypertext'">
	<!-- ############# ATTRIBUTO HYPERTEXT ############# -->
	<s:include value="/WEB-INF/apsadmin/jsp/entity/modules/hypertextAttribute.jsp" />
	</p>
	</s:elseif>

	<s:elseif test="#attribute.type == 'Image'">
	<!-- ############# ATTRIBUTO Image ############# -->
	<s:include value="/WEB-INF/plugins/jacms/apsadmin/jsp/content/modules/imageAttribute.jsp" />
	</p>
	</s:elseif>

	<s:elseif test="#attribute.type == 'Attach'">
	<!-- ############# ATTRIBUTO Attach ############# -->
	<s:include value="/WEB-INF/plugins/jacms/apsadmin/jsp/content/modules/attachAttribute.jsp" />
	</p>
	</s:elseif>

	<s:elseif test="#attribute.type == 'CheckBox'">
	<!-- ############# ATTRIBUTO CheckBox ############# -->
	<s:include value="/WEB-INF/apsadmin/jsp/entity/modules/checkBoxAttribute.jsp" />
	</p>
	</s:elseif>

	<s:elseif test="#attribute.type == 'Boolean'">
	<!-- ############# ATTRIBUTO Boolean ############# -->
	<s:include value="/WEB-INF/apsadmin/jsp/entity/modules/booleanAttribute.jsp" />
	</p>
	</s:elseif>

	<s:elseif test="#attribute.type == 'ThreeState'">
	<!-- ############# ATTRIBUTO ThreeState ############# -->
	<s:include value="/WEB-INF/apsadmin/jsp/entity/modules/threeStateAttribute.jsp" />
	</p>
	</s:elseif>

	<s:elseif test="#attribute.type == 'Number'">
	<!-- ############# ATTRIBUTO Number ############# -->
	<s:include value="/WEB-INF/apsadmin/jsp/entity/modules/numberAttribute.jsp" />
	</p>
	</s:elseif>

	<s:elseif test="#attribute.type == 'Date'">
	<!-- ############# ATTRIBUTO Date ############# -->
	<s:include value="/WEB-INF/apsadmin/jsp/entity/modules/dateAttribute.jsp" />
	</p>
	</s:elseif>

	<s:elseif test="#attribute.type == 'Timestamp'">
	<!-- ############# ATTRIBUTO Timestamp ############# -->
	<s:include value="/WEB-INF/apsadmin/jsp/entity/modules/timestampAttribute.jsp" />
	</p>
	</s:elseif>

	<s:elseif test="#attribute.type == 'Link'">
	<!-- ############# ATTRIBUTO Link ############# -->
	<s:include value="/WEB-INF/plugins/jacms/apsadmin/jsp/content/modules/linkAttribute.jsp" />
	</p>
	</s:elseif>

	<s:elseif test="#attribute.type == 'Enumerator'">
	<!-- ############# ATTRIBUTO TESTO Enumerator ############# -->
	<s:include value="/WEB-INF/apsadmin/jsp/entity/modules/enumeratorAttribute.jsp" />
	</p>
	</s:elseif>
	 
	<s:elseif test="#attribute.type == 'Monolist'">
	<!-- ############# ATTRIBUTO Monolist ############# -->
	<s:include value="/WEB-INF/plugins/jacms/apsadmin/jsp/content/modules/monolistAttribute.jsp" />
	</s:elseif>

	<s:elseif test="#attribute.type == 'List'">
	<!-- ############# ATTRIBUTO List ############# -->
	<s:include value="/WEB-INF/apsadmin/jsp/entity/modules/listAttribute.jsp" />
	</s:elseif> 	 

	<s:elseif test="#attribute.type == 'Composite'">
	<!-- ############# ATTRIBUTO Composite ############# -->
	<s:include value="/WEB-INF/plugins/jacms/apsadmin/jsp/content/modules/compositeAttribute.jsp" />
	</p>
	</s:elseif>

	<wpsa:hookPoint key="jacms.entryContent.attributeExtra" objectName="hookPointElements_jacms_entryContent_attributeExtra">
	<s:iterator value="#hookPointElements_jacms_entryContent_attributeExtra" var="hookPointElement">
		<wpsa:include value="%{#hookPointElement.filePath}"></wpsa:include>
	</s:iterator>
	</wpsa:hookPoint>

	</div>
	</s:iterator>
	<!-- END CICLO ATTRIBUTI -->

	<s:set var="showingPageSelectItems" value="showingPageSelectItems"></s:set>
	<s:set name="iconImagePath" id="iconImagePath"><wp:resourceURL/>administration/common/img/icons/32x32/content-preview.png</s:set>
	<wpsa:actionParam action="preview" var="previewActionName" >
		<wpsa:actionSubParam name="%{'jacmsPreviewActionLangCode_' + #lang.code}" value="%{#lang.code}" />
	</wpsa:actionParam>
	<div class="margin-base-vertical">
	<s:if test="!#showingPageSelectItems.isEmpty()">
		<s:set var="previewActionPageCodeLabelId">jacmsPreviewActionPageCode_<s:property value="#lang.code" /></s:set>
		<p><label for="<s:property value="#previewActionPageCodeLabelId" />"><s:text name="name.preview.page" /></label>
		<s:select useTabindexAutoIncrement="true" name="%{'jacmsPreviewActionPageCode_' + #lang.code}" id="%{#previewActionPageCodeLabelId}" list="#showingPageSelectItems" listKey="key" listValue="value" />
		<%-- <s:select useTabindexAutoIncrement="true" name="jacmsPreviewActionPageCode" id="%{#previewActionPageCodeLabelId}" list="#showingPageSelectItems" listKey="key" listValue="value" /></p>  --%>
		<s:submit useTabindexAutoIncrement="true" cssClass="button" action="%{#previewActionName}" value="%{getText('label.preview')}" title="%{getText('note.button.previewContent')}" /></p>
	</s:if>
	<s:else>
		<p><s:text name="label.preview.noPreviewPages" /></p>
		<p><s:submit useTabindexAutoIncrement="true" cssClass="button" disabled="true" action="%{#previewActionName}" value="%{getText('label.preview')}" title="%{getText('note.button.previewContent')}" /></p>
	</s:else>
	</div>

	</div>
</s:if>
<%-- END TEMP RAW PROTOTYPE --%>

</s:iterator>
<!-- END CICLO LINGUA -->


<div id="info" class="tab">
<h3 class="js_noscreen"><s:text name="title.contentInfo" /> <a href="#quickmenu" id="info_content_goBackToQuickMenu" title="<s:text name="note.goBackToQuickMenu" />"><span class="icon icon-circle-arrow-up"></span></a></h3>

<div class="subsection">
<!--  INIZIO BLOCCO SELEZIONE GRUPPI SUPPLEMENTARI ABILITATI ALLA VISUALIZZAZIONE -->
<fieldset>
	<legend><s:text name="label.extraGroups" /></legend>
<s:if test="content.groups.size != 0">
<ul>
<s:iterator value="content.groups" id="groupName">
	<li>
		<wpsa:actionParam action="removeGroup" var="actionName" >
			<wpsa:actionSubParam name="extraGroupName" value="%{#groupName}" />
		</wpsa:actionParam>
		<s:submit useTabindexAutoIncrement="true" action="%{#actionName}" type="image" src="%{#removeIcon}" value="%{getText('label.remove')}" title="%{getText('label.remove')}" />: <s:property value="%{getGroupsMap()[#groupName].getDescr()}"/>
	</li>
</s:iterator>
</ul>
</s:if>
<p>
	<label for="extraGroups" class="basic-mint-label"><s:text name="label.join" />&#32;<s:text name="label.group" /></label>
	<s:select useTabindexAutoIncrement="true" name="extraGroupName" id="extraGroups" list="groups"
		listKey="name" listValue="descr" cssClass="text" />
	<s:submit useTabindexAutoIncrement="true" action="joinGroup" value="%{getText('label.join')}" cssClass="button" />
</p>
</fieldset>
<!-- FINE BLOCCO SELEZIONE GRUPPI SUPPLEMENTARI ABILITATI ALLA VISUALIZZAZIONE -->

<!-- INIZIO CATEGORIE -->
<s:action name="showCategoryBlockOnEntryContent" namespace="/do/jacms/Content" executeResult="true"><s:param name="contentOnSessionMarker" value="contentOnSessionMarker" /></s:action>
<!-- FINE CATEGORIE -->
</div>

<wpsa:hookPoint key="jacms.entryContent.tabGeneral" objectName="hookPointElements_jacms_entryContent_tabGeneral">
<s:iterator value="#hookPointElements_jacms_entryContent_tabGeneral" var="hookPointElement">
	<wpsa:include value="%{#hookPointElement.filePath}"></wpsa:include>
</s:iterator>
</wpsa:hookPoint>

</div>

<h3 class="noscreen"><s:text name="title.contentActionsIntro" /></h3>

<wpsa:hookPoint key="jacms.entryContent.actions" objectName="hookPointElements_jacms_entryContent_actions">
<s:iterator value="#hookPointElements_jacms_entryContent_actions" var="hookPointElement">
	<wpsa:include value="%{#hookPointElement.filePath}"></wpsa:include>
</s:iterator>
</wpsa:hookPoint>

</s:form>
