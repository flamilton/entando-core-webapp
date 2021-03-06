<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="wp" uri="/aps-core" %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core" %>
<%@ taglib prefix="wpsf" uri="/apsadmin-form" %>

<%-- <h1><s:text name="document.title.main" /></h1> --%>

<div id="main" role="main">

<%--
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

<p class="sr-only"><s:text name="note.Entando.intro" />.</p>
<p class="sr-only"><s:text name="note.maxiButtons.intro" />:</p>

<s:set var="userConfigVar" value="userConfig" />

<s:iterator var="userShortcutCode" value="#userConfigVar" status="rowstatus">
<s:set var="userShortcut" value="%{getShortcut(#userShortcutCode)}"></s:set>

<dl class="maxiButton" id="fagiano_shortCut_<s:property value="#rowstatus.index"/>">

<s:if test="null != #userShortcut">

<s:set var="userShortcutSectionShortDescr"><s:if test="null != #userShortcut.menuSection.descriptionKey" ><s:text name="%{#userShortcut.menuSection.descriptionKey}" /></s:if><s:else><s:property value="%{#userShortcut.menuSection.description}" /></s:else></s:set>
<s:set var="userShortcutSectionLongDescr"><s:if test="null != #userShortcut.menuSection.longDescriptionKey" ><s:text name="%{#userShortcut.menuSection.longDescriptionKey}" /></s:if><s:else><s:property value="%{#userShortcut.menuSection.longDescription}" /></s:else></s:set>

<s:set var="userShortcutShortDescr"><s:if test="null != #userShortcut.descriptionKey" ><s:text name="%{#userShortcut.descriptionKey}" /></s:if><s:else><s:property value="%{#userShortcut.description}" /></s:else></s:set>
<s:set var="userShortcutLongDescr"><s:if test="null != #userShortcut.longDescriptionKey" ><s:text name="%{#userShortcut.longDescriptionKey}" /></s:if><s:else><s:property value="%{#userShortcut.longDescription}" /></s:else></s:set>

	<dt class="name <s:property value="#userShortcut.menuSectionCode" />">
		<%-- SCRIVERE TAG PER AGGIUNGERE MAPPA PARAMETRI ALLA URL
		<a class="shortcut-link"
				href="<s:url action="%{#userShortcut.actionName}" namespace="%{#userShortcut.namespace}"><wpsa:paramMap map="#userShortcut.parameters" /></s:url>"
				lang="en" title="<s:property value="%{#userShortcutShortDescr}" />">
			<span class="up"><s:property value="%{#userShortcutSectionShortDescr}" /></span>
			<span class="down"><s:property value="%{#userShortcutShortDescr}" /></span>
		</a>
		<span class="shortcut-toolbar">
		<a class="shortcut-clear" title="<s:text name="label.clear" />&#32;<s:text name="name.position" />&#32;<s:property value="%{#rowstatus.index + 1}" />" href="<s:url action="removeMyShortcut" namespace="/do/MyShortcut"><s:param name="position" value="%{#rowstatus.index}" /><s:param name="strutsAction" value="4" /></s:url>"><img src="<wp:resourceURL />administration/common/img/icons/22x22/shortcut-clear.png" width="19" height="22" alt="<s:text name="label.clear" />" /></a>
		<img src="<wp:resourceURL />administration/common/img/shortcut-pipe.png" width="2" height="22" alt=" " />
		<a rel="shortcut-configure" title="<s:text name="label.configure" />&#32;<s:text name="name.position" />&#32;<s:property value="%{#rowstatus.index + 1}" />" href="<s:url action="configPosition" namespace="/do/MyShortcut" anchor="shortcut-configure"><s:param name="position" value="%{#rowstatus.index}" /><s:param name="strutsAction" value="1" /></s:url>"><img src="<wp:resourceURL />administration/common/img/icons/22x22/shortcut-configure.png" width="19" height="22" alt="<s:text name="label.set" />" /></a>
		<img src="<wp:resourceURL />administration/common/img/shortcut-pipe.png" width="2" height="22" alt=" " />
		<a title="<s:text name="label.move" />&#32;<s:text name="name.position" />&#32;<s:property value="%{#rowstatus.index + 1}" />" href="<s:url action="configPosition" namespace="/do/MyShortcut"><s:param name="positionTarget" value="%{#rowstatus.index}" /><s:param name="strutsAction" value="2" /></s:url>"><img class="move" src="<wp:resourceURL />administration/common/img/icons/22x22/shortcut-move.png" width="19" height="22" alt="<s:text name="label.move" />" /></a>
		</span>
	</dt>
	<dd class="sr-only">
		<p><s:property value="%{#userShortcutLongDescr}" /></p>
	</dd>
</s:if>
<s:else>
	<dt class="name empty">
		<span class="up">&nbsp;</span>
		<span class="down">&nbsp;</span>
		<span class="shortcut-toolbar">
		<a rel="shortcut-configure" title="<s:text name="label.configure" />&#32;<s:text name="name.position" />&#32;<s:property value="%{#rowstatus.index + 1}" />" href="<s:url action="configPosition" namespace="/do/MyShortcut" anchor="shortcut-configure"><s:param name="position" value="%{#rowstatus.index}" /><s:param name="strutsAction" value="1" /></s:url>">
			<img src="<wp:resourceURL />administration/common/img/icons/22x22/shortcut-configure.png" width="19" height="22" alt="<s:text name="label.set" />" />
		</a>
		<img src="<wp:resourceURL />administration/common/img/shortcut-pipe.png" width="2" height="22" alt=" " />
		<a title="<s:text name="label.move" />&#32;<s:text name="name.position" />&#32;<s:property value="%{#rowstatus.index + 1}" />" href="<s:url action="configPosition" namespace="/do/MyShortcut" anchor="shortcut-swap"><s:param name="positionTarget" value="%{#rowstatus.index}" /><s:param name="strutsAction" value="2" /></s:url>"><img class="move" src="<wp:resourceURL />administration/common/img/icons/22x22/shortcut-move.png" width="19" height="22" alt="<s:text name="label.move" />" /></a>
		</span>
	</dt>
	<dd class="sr-only">
		<p>&#32;</p>
	</dd>
</s:else>

</dl>

</s:iterator>

<%-- shortucs available for the current user
<s:set var="allowedShortcutsVar" value="allowedShortcuts" />
<%-- if there are shortcuts and if position not null, so show the configuration form
<s:if test="((null != #allowedShortcutsVar) && (#allowedShortcutsVar.size() > 0) && (null != position)) || #myClient=='advanced'">
	<div class="subsection-light clear" id="shortcut-configure-container">
		<h2 class="margin-bit-bottom" id="shortcut-configure"><s:text name="label.configure" />&#32;<s:text name="name.position" />&#32;<span class="position-name"><s:property value="%{position + 1}" /></span></h2>
		<s:form namespace="/do/MyShortcut" action="joinMyShortcut">
			<p class="sr-only">
				<wpsf:hidden name="position" />
				<wpsf:hidden name="strutsAction" value="1" />
			</p>
			<p>
				<label for="shortcutCode" class="basic-mint-label"><s:text name="label.choose" />:</label>

				<select name="shortcutCode" id="shortcutCode" tabindex="<wpsa:counter />" >
				<s:set var="tmpShortcutGroup" value="null" />
				<s:iterator value="allowedShortcutSelectItems" var="allowedShortcutItem">
					<s:if test="null != #tmpShortcutGroup && !#allowedShortcutItem.optgroup.equals(#tmpShortcutGroup)">
					</optgroup>
					</s:if>
					<s:if test="null == #tmpShortcutGroup || !#allowedShortcutItem.optgroup.equals(#tmpShortcutGroup)">
					<optgroup label="<s:property value="#allowedShortcutItem.optgroup" />">
					</s:if>
						<option value="<s:property value="#allowedShortcutItem.key" />"><s:property value="#allowedShortcutItem.value" /></option>
					<s:set var="tmpShortcutGroup"><s:property value="#allowedShortcutItem.optgroup" /></s:set>
				</s:iterator>
				</optgroup>
				</select>

				<wpsf:submit useTabindexAutoIncrement="true" value="%{getText('label.set')}" cssClass="button" />
			</p>
		</s:form>
	</div>
</s:if>
<%-- else show the swap form
<s:elseif test="null != positionTarget">
	<div class="subsection-light clear" id="shortcut-swap-container">
	<h2 class="margin-bit-bottom" id="shortcut-swap"><s:text name="label.swap" />&#32;<s:text name="name.position" />: <s:property value="%{positionTarget + 1}" /> &ndash;
	<s:set var="userShortcutToMove" value="%{getShortcut(#userConfigVar[positionTarget])}" />
	<s:if test="null != #userShortcutToMove">
		<s:if test="null != #userShortcutToMove.descriptionKey"><s:text name="%{#userShortcutToMove.descriptionKey}" /></s:if><s:else><s:property value="%{#userShortcutToMove.description}" /></s:else>
	</s:if>
	<s:else><s:text name="label.empty.f" /></s:else>
	</h2>
	<s:form namespace="/do/MyShortcut" action="swapMyShortcut">
	<p class="sr-only">
		<wpsf:hidden name="positionTarget" />
		<wpsf:hidden name="strutsAction" value="2" />
	</p>

	<p>
	<label for="positionDest" class="basic-mint-label"><s:text name="label.choose" />:</label>
	<select name="positionDest" id="positionDest" tabindex="<wpsa:counter />" >
	<s:iterator var="userShortcutCodeDestVar" value="#userConfigVar" status="rowstatus">
		<s:set var="userShortcut" value="%{getShortcut(#userShortcutCodeDestVar)}"></s:set>
		<s:if test="null != #userShortcut">
			<s:set var="userShortcutShortDestDescr"><s:if test="null != #userShortcut.descriptionKey" ><s:text name="%{#userShortcut.descriptionKey}" /></s:if><s:else><s:property value="%{#userShortcut.description}" /></s:else></s:set>
		</s:if>
		<s:else>
			<s:set var="userShortcutShortDestDescr"><s:text name="label.empty.f" /></s:set>
		</s:else>
		<option value="<s:property value="#rowstatus.index" />"><s:property value="%{#rowstatus.index + 1}" /> &ndash; <s:property value="%{#userShortcutShortDestDescr}" /></option>
	</s:iterator>
	</select>

	<wpsf:submit useTabindexAutoIncrement="true" value="%{getText('label.set')}" cssClass="button" />
	</p>
	</s:form>
	</div>
</s:elseif>

--%>

<h1><s:text name="title.activityStream" /></h1>

<s:set var="currentUsernameVar"><c:out value="${sessionScope.currentUser.username}" /></s:set>

<wpsa:activityStream var="activityStreamVar" />

<s:if test="null != #activityStreamVar && #activityStreamVar.size() != 0">

	<ul class="list-unstyled" id="activity-stream">
	<s:iterator value="#activityStreamVar" var="actionLogRecordIdVar" status="currentEvent">
		<li class="media row padding-large-vertical">

		<wpsa:actionLogRecord key="%{#actionLogRecordIdVar}" var="actionLogRecordVar" />
		<c:set var="usernameVar"><s:property value="#actionLogRecordVar.username" /></c:set>
		<s:set var="fullnameVar"><wp:userProfileAttribute username="${usernameVar}" attributeRoleName="userprofile:fullname" /></s:set>
		<s:set var="emailAttributeVar"><wp:userProfileAttribute username="${usernameVar}" attributeRoleName="userprofile:email" /></s:set>

		<div class="col-xs-12 col-sm-2 col-lg-1 margin-small-bottom activity-stream-picture">
			<img alt=" " src="<s:url action="avatarStream" namespace="/do/user/avatar">
							<s:param name="gravatarSize">56</s:param>
							<s:param name="username" value="#actionLogRecordVar.username" />
						</s:url>" width="56" height="56" class="img-circle media-object" />
		</div>

		<div class="media-body col-xs-12 col-sm-10 col-lg-11 activity-stream-event <s:if test="#currentEvent.first">event-first</s:if>">
			<s:set var="activityStreamInfoVar" value="#actionLogRecordVar.activityStreamInfo" />
			<c:set var="authGroupNameVar"><s:property value="#activityStreamInfoVar.linkAuthGroup" /></c:set>
			<c:set var="authPermissionNameVar"><s:property value="#activityStreamInfoVar.linkAuthPermission" /></c:set>
			<wp:ifauthorized groupName="${authGroupNameVar}" permission="${authPermissionNameVar}" var="isAuthorizedVar" />

			<div class="popover right display-block">
				<div class="arrow"></div>
				<div class="popover-content">
				<c:choose>
					<c:when test="${isAuthorizedVar}">
					<a
						href="<s:url action="view" namespace="/do/userprofile"><s:param name="username" value="#actionLogRecordVar.username"/></s:url>"
						title="<s:text name="label.viewProfile" />: <s:property value="#actionLogRecordVar.username" />">
							<s:if test="null != #fullnameVar && #fullnameVar.length() > 0">
								<s:property value="#fullnameVar" />
							</s:if>
							<s:else>
								<s:property value="#actionLogRecordVar.username" />
							</s:else>
					</a>
					</c:when>
					<c:otherwise>
						<s:if test="null != #fullnameVar && #fullnameVar.length() > 0">
							<s:property value="#fullnameVar" />
						</s:if>
						<s:else>
							<s:property value="#actionLogRecordVar.username" />
						</s:else>
					</c:otherwise>
				</c:choose>
			<%--
			&nbsp;&dash;&nbsp;x<s:property value="#emailAttributeVar" />x&nbsp;
			--%>

			&#32;&middot;&#32;

			<wpsa:activityTitle actionName="%{#actionLogRecordVar.actionName}" namespace="%{#actionLogRecordVar.namespace}" actionType="%{#activityStreamInfoVar.actionType}" />:&#32;

			<%--
			<s:text name="%{#actionLogRecordVar.namespace + '_' + #actionLogRecordVar.actionName + '_' + #activityStreamInfoVar.actionType}" />
			--%>

			<s:set var="linkTitleVar" value="%{getTitle('view/edit', #activityStreamInfoVar.objectTitles)}" />
			<c:choose>
				<c:when test="${isAuthorizedVar}">
					<s:url action="%{#activityStreamInfoVar.linkActionName}"
						   namespace="%{#activityStreamInfoVar.linkNamespace}" var="actionUrlVar">
						<wpsa:paramMap map="#activityStreamInfoVar.linkParameters" />
					</s:url>
					<a href="<s:property value="#actionUrlVar" escape="false" />"><s:property value="#linkTitleVar" /></a>
				</c:when>
				<c:otherwise>
					<s:property value="#linkTitleVar" />
				</c:otherwise>
			</c:choose>

						<wpsa:activityStreamLikeRecords recordId="%{#actionLogRecordIdVar}" var="activityStreamLikeRecordsVar" />
						<p class="margin-small-vertical">
							<time datetime="<s:date name="#actionLogRecordVar.actionDate" format="yyyy-MM-dd HH:mm" />" title="<s:date name="#actionLogRecordVar.actionDate" format="yyyy-MM-dd HH:mm" />" class="text-info">
								<s:date name="#actionLogRecordVar.actionDate" nice="true" />
							</time>
							<s:if test="#activityStreamLikeRecordsVar.size() > 0">&#32;&middot;&#32;<s:property value="#activityStreamLikeRecordsVar.size()" />&#32;<s:text name="label.like.number" /></s:if>
							&#32;&middot;&#32;
							<s:set value="%{#activityStreamLikeRecordsVar.containsUser(#currentUsernameVar)}" var="likeRecordsContainsUserVar" />
							<s:if test="%{#likeRecordsContainsUserVar}" >
								<a href="<s:url namespace="/do/ActivityStream" action="unlikeActivity"><s:param name="recordId" value="%{#actionLogRecordIdVar}" /></s:url>"><s:text name="label.like.unlike" /></a>
							</s:if>
							<s:else>
								<a href="<s:url namespace="/do/ActivityStream" action="likeActivity"><s:param name="recordId" value="%{#actionLogRecordIdVar}" /></s:url>"><s:text name="label.like.like" /></a>
							</s:else>
						</p>

					</div>
				</div>
				<s:if test="#activityStreamLikeRecordsVar.size() > 0">
				<ul class="list-unstyled padding-base-top padding-base-bottom padding-base-left">
				<s:iterator value="#activityStreamLikeRecordsVar" var="activityStreamLikeRecordVar">
					<li class="margin-small-vertical">
						<a
							href="<s:url action="view" namespace="/do/userprofile"><s:param name="username" value="#activityStreamLikeRecordVar.username"/></s:url>"
							title="<s:text name="label.viewProfile" />: <s:property value="#activityStreamLikeRecordVar.username" />">
								<s:property value="#activityStreamLikeRecordVar.displayName" />
						</a>
						&#32;<s:text name="label.like.likesthis" />
					</li>
				</s:iterator>
				</ul>
				</s:if>
			</div>
		</li>
	</s:iterator>
		<li class="media row">
			<div class="media-body col-xs-12 col-sm-10 col-lg-11 col-sm-offset-2 col-lg-offset-1 activity-stream-event event-last">
			</div>
		</li>
	</ul>
</s:if>
<s:else>
	NO ONE ACTIVITY
</s:else>

</div>