<#include "/macro/util.ftl"/>

<#--
 * bind
 *
 * Exposes a BindStatus object for the given bind path, which can be
 * a bean (e.g. "person") to get global errors, or a bean property
 * (e.g. "person.name") to get field errors. Can be called multiple times
 * within a form to bind to multiple command objects and/or field names.
 *
 * Producing no output, the following context variable will be available
 * each time this macro is referenced (assuming you import this library in
 * your templates with the namespace 'form'):
 *
 *   form.status : a BindStatus instance holding the command object name,
 *   expression, value, and error messages and codes for the path supplied
 *
 * @param path : the path (string value) of the value required to bind to.
 *   Spring defaults to a command name of "command" but this can be overridden
 *   by user config.
 -->
<#macro bind path>
    <#assign status = springMacroRequestContext.getBindStatus(path, true)>
</#macro> 

<#--
 * printErrors
 *
 * Prints error for a field related to current form.status.
 -->
<#macro printErrors>
	<#if status.errorMessages?has_content>
		<span class="help-block">
			<ul class="unstyled">
				<#list status.errorMessages as error>
					<li>${fmsg(error)}</li>
				</#list>
			</ul>
		</span>
	</#if>
</#macro>
 
<#--
 * onErrors
 *
 * Checks if a field related to current form.status has some binding errors.
 * 
 * @param onTrue parameter returned on field binding errors
 * @param onFalse parameter returned when field has no binding errors (default value is an empty string)
 * @return onTrue parameter if field has binding errors, onFalse otherwise
 -->
<#function onErrors onTrue onFalse=''>
	<#if (status?? && status.errorMessages?has_content)>
    	<#return onTrue />
    </#if>
    <#return onFalse/>
</#function>