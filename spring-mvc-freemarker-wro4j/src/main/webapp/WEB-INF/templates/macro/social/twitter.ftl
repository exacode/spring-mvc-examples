<#include "/macro/fun.ftl"/>

<#macro signin text="${fmsg('social.twitter.signin')}" htmlClass="">
	<form id="twitter_signin" action="${furl('/signin/twitter')}" method="post">
		<button type="submit" class="twitter-bg social-submit btn ${htmlClass}">
			<i class="icon-twitter icon-large"></i> ${text}
		</button>
	</form>
</#macro>

<#macro connect text="${fmsg('social.twitter.connect')}" htmlClass="">
	<form id="twitter_signin" action="${furl('/connect/twitter')}" method="post">
		<button type="submit" class="twitter-bg social-submit btn ${htmlClass}">
			<i class="icon-twitter icon-large"></i> ${text}
		</button>
	</form>
</#macro>


<#macro disconnect providerUserId text="${fmsg('social.twitter.disconnect')}" htmlClass="">
	<form id="twitter_signin" action="${furl('/connect/twitter/' + providerUserId)}" method="post">
		<button type="submit" class="twitter-bg social-submit btn ${htmlClass}">
			<i class="icon-twitter icon-large"></i> ${text}
		</button>
		<input type="hidden" name="_method" value="delete" />
	</form>
</#macro>

