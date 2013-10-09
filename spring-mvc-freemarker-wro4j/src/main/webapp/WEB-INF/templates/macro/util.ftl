<#include "/macro/fun.ftl"/>

<#macro msg code><#if code?has_content>${fmsg(code)}</#if></#macro>

<#macro msgTxt code, text>${fmsgTxt(code, text)}</#macro>

<#macro msgArg code, args>${fmsgArg(code, args)}</#macro>

<#macro msgArgTxt code, args, text>${fmsgArgTxt(code, args, text)}</#macro>

<#macro url relativeUrl>${furl(relativeUrl)}</#macro>

<#macro check exp thenVal elseVal="">${fcheck(exp, thenVal, elseVal)}</#macro>

<#macro default exp><#if exp?has_content>exp<#else><#nested></#if></#macro>
