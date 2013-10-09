<#include "/macro/fun.ftl">
<#macro page title="" bodyAttr="" css=[] js=[] jsInline="" metaEntries=[]>
	<!DOCTYPE html>
	<html>
		<head>
			<title><#if title?length gt 0>${title}<#else><@util.msg 'application.title'/></#if></title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<link rel="stylesheet" type="text/css" media="all" href="//netdna.bootstrapcdn.com/bootswatch/2.3.1/cosmo/bootstrap.min.css" />
			<link rel="stylesheet" type="text/css" media="all" href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" />
			<link rel="stylesheet" type="text/css" media="all" href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" />
			<link rel="stylesheet" type="text/css" media="all" href="${furl('/resources/css/bootstrap-tag.css')}" />
			<link rel="stylesheet" type="text/css" media="all" href="${furl('/resources/css/style.css')}" />
			<!--[if lt IE 9]>
				<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome-ie7.css"/>
				<script src="${furl('/resources/js/html5shiv.js')}"</script>
			<![endif]-->
			<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${furl('resources/icon/favicon144.png')}" />
			<link rel="apple-touch-icon-precomposed" sizes="114x114" href="${furl('resources/icon/favicon114.png')}"  />
			<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${furl('resources/icon/favicon72.png')}" />
			<link rel="apple-touch-icon-precomposed" sizes="57x57" href="${furl('resources/icon/favicon57.png')}" />
			<link rel="apple-touch-icon-precomposed" sizes="32x32" href="${furl('resources/icon/favicon32.png')}" />
			<link rel="shortcut icon" href="${furl('/resources/icon/favicon16.png')}" />
			<!-- Additional meta entries -->
			<#list metaEntries as metaEntry>
				${metaEntry}   		
			</#list>
			<!-- Additional css files -->	          		
			<#list css as file>
				<link rel="stylesheet" type="text/css" media="all" href=${file}/>
			</#list>
			<script>
				var appurl = {
					anchor: "${anchor!}",
					contextPath: "${contextPath!}",
					serverUrl: "${serverUrl!}",
					contextUrl: "${contextUrl!}",
					requestUrl: "${requestUrl!}"
				}
			</script>
		</head>
		<body ${bodyAttr}>
			<div id="top"></div>
			<div id="wrap">
				<#include "/part/navbar.ftl">
				<section>
					<#nested>
				</section>
				<div id="push"></div>
			</div>
			<div id="footer">
				<#include "/part/footer.ftl">
			</div>
			<div id="bottom"></div>
			<noscript>
				<div id="noscript-warning">
					<span><@util.msg "warning.noscript"/></span><img src="${furl('/resources/img/pixel.gif')}" alt="" class="pixel" />
				</div>
			</noscript>
			<script src="${furl('/resources/js/holder.js')}"></script>
			<script src="${furl('/resources/js/json2.js')}"></script>
			<script src="//code.jquery.com/jquery-1.9.1.min.js"></script>
			<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
			<script src="${furl('/resources/js/jstorage.js')}"></script>
			<script src="${furl('/resources/js/jquery.lazyload.min.js')}"></script>
			<script src="${furl('/resources/js/bootstrap-tag.js')}"></script>
			<!-- Additional js scripts -->	
			<#list js as file>
				<script src="${file}"></script>   		
			</#list>
			<#if jsInline?has_content>
				<script>${jsInline}</script>   		
			</#if>
			<script src="${furl('/resources/js/bootstrap-custom.js')}"></script>
		</body>
	</html>
</#macro>