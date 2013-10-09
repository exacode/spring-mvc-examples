<#import "/error/wrapper.ftl" as error>
<#if header??>
	<#assign title=fmsg(header)/>
<#else>
	<#assign title=fmsg('error.general.title')/>
</#if> 
<@error.wrapper title>
	<#if (content?? && content?has_content)>
		<p class="lead">
			<#list content as msg>
				<#if (msg?? && msg?has_content)>
					${fmsg(msg)?replace(";", "<br/>")}
				</#if>
			</#list>
		</p>
	<#else>
		<p class="lead">${fmsg('error.general.content')}</p>
	</#if>
</@error.wrapper>
