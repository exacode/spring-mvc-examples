<#include "/macro/util.ftl"/>

<#--
 * single
 *
 * Prints a single alert message.
 * 
 * @param message
 * @param type
 -->
<#macro single message type="info">
	<#if message??>
		<div class="alert alert-${type} alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<p>${fmsg(message)}</p>
		</div>
	</#if>
</#macro>

<#--
 * list
 *
 * Prints a list of alert messages.
 * 
 * @param messages
 * @param type
 -->
<#macro list messages type="info">
	<#if messages??>
		<div class="message-list"> 
		<#list messages as msg>
			<div class="alert alert-${type} alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<p>${fmsgArgs(msg.code, msg.arguments)}</p>
			</div>
		</#list>
		</div>
	</#if>
</#macro>

<#--
 * struct
 *
 * Prints a structure that contains wide range of alert messages.
 * 
 * @see Alerts
 * @param alerts
 -->
<#macro struct alerts>
	<#if (!alerts.isEmpty())>
		<div class="alerts">
			<#if alerts.errors?has_content>
				<div class="error-messages">
					<@list alerts.errors "danger"/>
				</div>
			</#if>
			<#if alerts.warnings?has_content>
				<div class="warning-messages">
					<@list alerts.warnings "warning"/>
				</div>
			</#if>
			<#if alerts.infos?has_content>
				<div class="info-messages">
					<@list alerts.infos "info"/>
				</div>
			</#if>
			<#if alerts.successes?has_content>
				<div class="success-messages">
					<@list alerts.successes "success"/>
				</div>
			</#if>
		</div>
	</#if>
</#macro>