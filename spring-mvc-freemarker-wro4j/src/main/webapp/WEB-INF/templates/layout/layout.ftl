<#include "/macro/util.ftl">
<#macro page title="" view="">
	<#setting locale="${fmsg('application.locale')}">
	<!DOCTYPE html>
	<html lang="${fmsg('application.locale')}">
		<head> 
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">

			<title>${(title)!fmsg('application.title')}</title> 

			<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
			<!--[if lt IE 9]>
				<script src="${furl('/resources/wro4j/js/application-ie8.js')}"></script>
			<![endif]-->
			<link href="${furl('/resources/wro4j/css/application-' + environment + '.css')}" rel="stylesheet" />
			<link href="${furl('/resources/img/favicon.png')}" rel="shortcut icon" />
		</head>
		<body>
		
			<!-- Page content -->
			<#include "/layout/navbar.ftl">
			<#nested>
			<#include "/layout/footer.ftl">
			
			<script src="${furl('/resources/wro4j/js/application-' + environment + '.js')}"></script>
		</body>
	</html>
</#macro>