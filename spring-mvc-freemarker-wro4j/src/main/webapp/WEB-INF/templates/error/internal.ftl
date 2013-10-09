<#import "/error/wrapper.ftl" as error>
<@error.wrapper "${fmsg('error.internal.title')}">
	<p class="lead">
		${fmsg('error.internal.content')?replace(";", "<br/>")}
	</p>
	<#if exceptionId??> 
		${fmsg('error.internal.exceptionWithId')}  <strong>${exceptionId}</strong>
	</#if>
</@error.wrapper>
