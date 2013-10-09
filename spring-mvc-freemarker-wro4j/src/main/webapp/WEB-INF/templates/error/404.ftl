<#import "/error/wrapper.ftl" as error>
<@error.wrapper "${fmsg('error.404.title')}">
	<p class="lead">${fmsg('error.404.content')}</p>
</@error.wrapper>
