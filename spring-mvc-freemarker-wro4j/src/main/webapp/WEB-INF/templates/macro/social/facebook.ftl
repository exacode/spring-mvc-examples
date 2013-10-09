<#include "/macro/fun.ftl"/>

<#macro signin text="${fmsg('social.facebook.signin')}" htmlClass="">
	<form id="facebook_signin" action="${furl('/signin/facebook')}" method="post">
		<input type="hidden" name="scope" value="publish_stream,user_photos,offline_access,email" />
		<button type="submit" class="facebook-bg social-submit btn ${htmlClass}">
			<i class="icon-facebook icon-large"></i> ${text}
		</button>
	</form>
</#macro>

<#macro connect text="${fmsg('social.facebook.connect')}" htmlClass="">
	<form id="facebook_signin" action="${furl('/connect/facebook')}" method="post">
		<input type="hidden" name="scope" value="publish_stream,user_photos,offline_access,email" />
		<button type="submit" class="facebook-bg social-submit btn ${htmlClass}">
			<i class="icon-facebook icon-large"></i> ${text}
		</button>
	</form>
</#macro>

<#macro disconnect providerUserId text="${fmsg('social.facebook.disconnect')}" htmlClass="">
	<form id="facebook_signin" action="${furl('/connect/facebook/' + providerUserId)}" method="post">
		<input type="hidden" name="scope" value="publish_stream,user_photos,offline_access,email" />
		<button type="submit" class="facebook-bg social-submit btn ${htmlClass}">
			<i class="icon-facebook icon-large"></i> ${text}
		</button>
		<input type="hidden" name="_method" value="delete" />
	</form>
</#macro>
