<@layout.page ngApp="home">
	<div class="container">
		<div class="jumbotron"> 
			<h1>${fmsg('home.title')}</h1>
			<p>${fmsg('home.description')}</p>
			<p><a class="btn btn-primary btn-lg" href="https://github.com/mendlik/spring-mvc-examples">${fmsg('home.gitHubLink')}</a></p>
		</div>
		<dl class="dl-horizontal">
			<dt>${fmsg('home.currentTemplateEngine')}</dt>
			<dd><a href="http://freemarker.org">FreeMarker</a> + <a href="http://code.google.com/p/wro4j/">Wro4j</a> + <a href="https://github.com/SomMeri/less4j">less4j</a></dd>
			<dt>${fmsg('home.currentTimestamp')}</dt>
			<dd>${.now?datetime?string(fmsg('format.dateTime'))}</dd>
		</dl>
		<div class="text-center">
			<img src="${furl('/assets/img/logo.png')}" />
		</div>
		<p>Nothing here {{'yet' + '!'}}</p>
		<p ng-controller="HomeCtrl">
		Random: {{ random }}
		<br/>
		2 * 2 = {{ multiply(2, 2) }}
		</p>
	</div>
</@layout.page>