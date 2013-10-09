<#macro hasPermissionById id type permission>
	<#if permissionEvaluator.hasPermission(id, type, permission)>
		<#nested>
	</#if>
</#macro>

<#macro hasPermission type permission>
	<#if permissionEvaluator.hasPermission(type, permission)>
		<#nested>
	</#if>
</#macro>

<#macro isAuthenticated>
	<#if authUser??>
		<#nested>
	</#if>
</#macro>