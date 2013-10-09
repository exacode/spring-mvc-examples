<#include "/macro/fun.ftl"/>

<#macro msglist msgs  type="info" htmlClass="">
	<#if msgs??>
		<div class="message-list">
		<#list msgs as msg>
			<div class="alert alert-block alert-${type} ${htmlClass}">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<p>${fmsgTxtArgs(msg.code, msg.arguments, msg.code)}</p>
			</div>
		</#list>
		</div>
	</#if>
</#macro>

<#macro msgstruct msgss htmlClass="">
	<#if (!msgss.isEmpty())>
		<div class="message-struct">
			<#if msgss.errors?has_content>
				<div class="error-messages">
					<@msglist msgss.errors "error" htmlClass/>
				</div>
			</#if>
			<#if msgss.warnings?has_content>
				<div class="warning-messages">
					<@msglist msgss.warnings "warning" htmlClass/>
				</div>
			</#if>
			<#if msgss.infos?has_content>
				<div class="info-messages">
					<@msglist msgss.infos "info" htmlClass/>
				</div>
			</#if>
			<#if msgss.successes?has_content>
				<div class="success-messages">
					<@msglist msgss.successes "success" htmlClass/>
				</div>
			</#if>
		</div>
	</#if>
</#macro>