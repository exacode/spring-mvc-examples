<@layout.page>
	<div class="container">
		<div class="jumbotron"> 
			<h1>${fmsg('home.title')}</h1>
			<p>${fmsg('home.description')}</p>
			<p><a class="btn btn-primary btn-lg" href="https://github.com/mendlik/spring-mvc-examples">${fmsg('home.gitHubLink')}</a></p>
		</div>
		<dl class="dl-horizontal">
			<dt>${fmsg('home.currentTemplateEngine')}</dt>
			<dd><a href="http://freemarker.org">FreeMarker</a></dd>
			<dt>${fmsg('home.currentTimestamp')}</dt>
			<dd>${.now?datetime?string(fmsg('format.dateTime'))}</dd>
		</dl>
		<div class="text-center">
			<img src="${furl('/resources/img/logo.png')}" />
		</div>
	</div>
</@layout.page>