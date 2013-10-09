<header class="navbar navbar-inverse navbar-fixed-top" role="banner">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button> 
			<a href="${furl('/')}" class="navbar-brand">${fmsg('navbar.brand')}</a>
		</div>
		<nav class="collapse navbar-collapse" role="navigation">
			<ul class="nav navbar-nav">
				<li ${fcheck(urlInfo.servletPath=="/register", "class='active'")}><a href="${furl('/register')}">${fmsg('navbar.register')}</a></li>
			</ul>
		</nav>
	</div> 
</header>   