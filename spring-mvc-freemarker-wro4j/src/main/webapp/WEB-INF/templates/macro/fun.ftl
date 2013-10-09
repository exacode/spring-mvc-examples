<#function fnoparam name>
	<#return !(RequestParameters[name]?? && RequestParameters[name]?has_content)>
</#function>

<#function fhasparam name param>
	<#if (RequestParameters[name]?? 
		&& RequestParameters[name]?has_content 
		&& RequestParameters[name] == param)>
		<#return true/>
	</#if>
	<#return false/>
</#function>

<#function fquery name="" param="">
	<#if name?? && name?has_content>
		<#return urlBuilder.build().builder().addUniqueQueryParameter(name, param).build().query/>
	<#else>
		<#return urlBuilder.build().query/>
	</#if>
</#function>

<#function fqueryurl url name="" param="">
	<#return furl(url) + fquery(name, param)/>
</#function>

<#function furlquery newurl>
	<#assign copiedUrlBuilder=urlBuilder.build().builder()/>
	<#return copiedUrlBuilder.addUniqueQueryParameter(name, param).build().url/>
</#function>

<#function fmsg code>
	<#return springMacroRequestContext.getMessage(code, code!html) >
</#function>

<#function fmsgTxt code text>
	<#return springMacroRequestContext.getMessage(code, text) >
</#function>

<#function fmsgArg code arg>
	<#return springMacroRequestContext.getMessage(code, [arg]) >
</#function>

<#function fmsgArgs code args>
	<#return springMacroRequestContext.getMessage(code, args) >
</#function>

<#function fmsgTxtArg code, arg, text>
	<#return springMacroRequestContext.getMessage(code, [arg], text) >
</#function>

<#function fmsgTxtArgs code, args, text>
	<#return springMacroRequestContext.getMessage(code, args, text) >
</#function>

<#function furl relativeUrl extra...>
	<#if (relativeUrl?starts_with("http://") 
		|| relativeUrl?starts_with("https://")
		|| relativeUrl?starts_with("//")) >
		<#return relativeUrl >
	</#if>
	<#if extra?? && extra?size!=0>
		<#return springMacroRequestContext.getContextUrl(relativeUrl,extra) >
	<#else>
		<#return springMacroRequestContext.getContextUrl(relativeUrl) >
	</#if>
</#function>

<#function fcheck exp thenVal elseVal="">
	<#if (exp && exp?has_content)>
		<#return thenVal >
	<#else>
		<#return elseVal >
	</#if>
</#function>

<#function fgcd a b>
	<#if (a>b)>
		<#return fgcd(a-b, b) >
	<#elseif (a<b)>
		<#return fgcd(a, b-a) >
	<#else>	
		<#return a >
	</#if>
</#function>