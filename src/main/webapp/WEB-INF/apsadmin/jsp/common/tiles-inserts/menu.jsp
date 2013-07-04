<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core" %>
<%@ taglib prefix="wp" uri="/aps-core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2 id="manage" class="noscreen"><s:text name="note.userbar.intro" />:</h2>

<!-- <h3 id="menubar-components"><span><s:text name="menu.componentsAdmin" /></span></h3> -->
<ul class="nav nav-pills nav-stacked" id="backoffice-menu-main">
	<wp:ifauthorized permission="superuser">
		<li><a href="<s:url action="intro" namespace="/do/Group" />"><s:text name="menu.accountAdmin.groups" /></a></li>
	</wp:ifauthorized>

	<wp:ifauthorized permission="manageCategories">
		<li><a href="<s:url action="viewTree" namespace="/do/Category" />"><s:text name="menu.categoryAdmin" /></a></li>
	</wp:ifauthorized>

	<wpsa:pluginsSubMenu objectName="pluginsSubMenus" />

		<s:if test="#pluginsSubMenus.size > 0">
			<li class="accordion">
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" href="#submenu-plugins">
							<s:text name="menu.plugins" />&#32;
							<span class="icon icon-chevron-down pull-right"></span>
						</a>
					</div>
					<div id="submenu-plugins" class="accordion-body collapse">
						<ul class="accordion-inner nav nav-pills nav-stacked">
							<s:iterator value="#pluginsSubMenus" id="pluginSubMenu">
								<wpsa:include value="%{#pluginSubMenu.subMenuFilePath}"></wpsa:include>
							</s:iterator>
						</ul>
					</div>
				</div>
			</li>
		</s:if>
		<s:else>
			<li><a href="#"><s:text name="menu.plugins" /></a></li>
		</s:else>

<wp:ifauthorized permission="managePages" var="isEditPages" />
<wp:ifauthorized permission="superuser" var="isSuperuser" />

<c:if test="${isEditPages || isSuperuser}">
<!-- <h3 id="menubar-portal"><span><s:text name="menu.portalAdmin" /></span></h3> -->

<wp:ifauthorized permission="managePages">
	<li><a href="<s:url action="viewTree" namespace="/do/Page" />"><s:text name="menu.pageAdmin" /></a></li>
	<li><a href="<s:url action="viewShowlets" namespace="/do/Portal/ShowletType" />"><s:text name="menu.showletAdmin" /></a></li>
</wp:ifauthorized>
<wp:ifauthorized permission="superuser">
	<li class="accordion">
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse" href="#submenu-api">
					<s:text name="menu.apisAdmin" />&#32;
					<span class="icon icon-chevron-down pull-right"></span>
				</a>
			</div>
			<div id="submenu-api" class="accordion-body collapse">
				<ul class="accordion-inner nav nav-pills nav-stacked">
					<li><a href="<s:url action="list" namespace="/do/Api/Resource" />" ><s:text name="menu.apisAdmin.resources" /></a></li>
					<li><a href="<s:url action="list" namespace="/do/Api/Service" />" ><s:text name="menu.apisAdmin.services" /></a></li>
					<li><a href="<s:url action="list" namespace="/do/Api/Consumer" />" ><s:text name="menu.apisAdmin.consumers" /></a></li>
				</ul>
			</div>
		</div>
	</li>
</wp:ifauthorized>

</c:if>

<wp:ifauthorized permission="editContents" var="isEditContents" />
<wp:ifauthorized permission="manageResources" var="isManageResources" />

<c:if test="${isEditContents || isManageResources}">
<!-- <h3 id="menubar-cms"><span><s:text name="jacms.menu.cmsAdmin" /></span></h3> -->
	<wp:ifauthorized permission="editContents">

		<li class="accordion">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" href="#submenu-contents">
						<s:text name="jacms.menu.contentAdmin" />&#32;
						<span class="icon icon-chevron-down pull-right"></span>
					</a>
				</div>
				<div id="submenu-contents" class="accordion-body collapse">
					<ul class="accordion-inner nav nav-pills nav-stacked">
						<li><a href="<s:url action="intro" namespace="/do/jacms/Content" />"><s:text name="jacms.menu.contentAdmin" /></a></li>
						<li><a href="<s:url action="createNewVoid" namespace="/do/jacms/Content" />?contentTypeCode=CNG&amp;contentMainGroup=free&amp;contentDescription=lorem+ipsum+description">New Generic Content</a></li>
						<wp:ifauthorized permission="superuser">
						<li><a href="<s:url action="intro" namespace="/do/jacms/ContentModel" />"><s:text name="jacms.menu.contentModelAdmin" /></a></li>
						<li><a href="<s:url action="initViewEntityTypes" namespace="/do/Entity"><s:param name="entityManagerName">jacmsContentManager</s:param></s:url>"><s:text name="jacms.menu.contentTypeAdmin" /></a></li>
						</wp:ifauthorized>
					</ul>
				</div>
			</div>
		</li>

	</wp:ifauthorized>
	<wp:ifauthorized permission="manageResources">

		<li class="accordion">
			<div class="accordion-group">
				<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" href="#submenu-resources">
						<s:text name="jacms.menu.resourceAdmin" />&#32;
						<span class="icon icon-chevron-down pull-right"></span>
					</a>
				</div>
				<div id="submenu-resources" class="accordion-body collapse">
					<ul class="accordion-inner nav nav-pills nav-stacked">
						<li><a href="<s:url action="intro" namespace="/do/jacms/Resource"><s:param name="resourceTypeCode" >Image</s:param></s:url>"><s:text name="jacms.menu.imageAdmin" /></a></li>
						<li><a href="<s:url action="intro" namespace="/do/jacms/Resource"><s:param name="resourceTypeCode" >Attach</s:param></s:url>"><s:text name="jacms.menu.attachAdmin" /></a></li>
					</ul>
				</div>
			</div>
		</li>

	</wp:ifauthorized>

</c:if>
</ul>