<#--
 * fmsg
 *
 * Prints an internationalized message.
 * 
 * @param code
 * @return internationlized message
 -->
<#function fmsg code>
	<#return springMacroRequestContext.getMessage(code, code!html) >
</#function>

<#--
 * fmsgArg
 *
 * Prints an internationalized message with a translation argument.
 * 
 * @param code
 * @param arg
 * @return internationlized message
 -->
<#function fmsgArg code arg>
	<#return springMacroRequestContext.getMessage(code, [arg]) >
</#function>

<#--
 * fmsgArgs
 *
 * Prints an internationalized message with some translation arguments.
 * 
 * @param code
 * @param args
 * @return internationlized message
 -->
<#function fmsgArgs code args>
	<#return springMacroRequestContext.getMessage(code, args) >
</#function>

<#--
 * furl
 *
 * Prints an url relative to servlet base uri.
 * 
 * @param url
 * @param extra
 * @return application relative url
 -->
<#function furl url extra...>
	<#if extra?? && extra?size!=0>
		<#return springMacroRequestContext.getContextUrl(url,extra) >
	<#else>
		<#return springMacroRequestContext.getContextUrl(url) >
	</#if>
</#function>

<#--
 * fcheck
 *
 * Simple function that enables inlining if... then... else...
 * It is a replacement for a Java 'ternary operator'.
 * 
 * @param condition
 * @param onTrue
 * @param onFalse
 * @return onTrue when condition is true, onFalse otherwise
 -->
<#function fcheck condition onTrue onFalse="">
	<#if condition>
		<#return onTrue>
	<#else>
		<#return onFalse>
	</#if>
</#function>