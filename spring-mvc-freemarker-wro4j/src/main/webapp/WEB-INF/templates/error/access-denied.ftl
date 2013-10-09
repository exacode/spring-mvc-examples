<#import "/error/wrapper.ftl" as error>
<@error.wrapper "${fmsg('error.denied.title')}">
	<p class="lead">${fmsg('error.denied.content')}</p>
</@error.wrapper>
