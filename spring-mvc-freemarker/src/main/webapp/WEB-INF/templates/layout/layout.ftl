<#include "/macro/util.ftl">
<#macro page title="" view="">
	<#setting locale="${fmsg('application.locale')}">
	<!DOCTYPE html>
	<html lang="${fmsg('application.locale')}">
		<head> 
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">

			<title>${(title)!fmsg('application.title')}</title> 

			<!-- Twitter bootstrap - Latest compiled and minified CSS and optional theme -->
			<link href="${furl('/resources/css/bootstrap.min.css')}" rel="stylesheet"/>
			<link href="${furl('/resources/css/bootstrap-theme.min.css')}" rel="stylesheet">
			
			<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
			<!--[if lt IE 9]>
				<script src="${furl('/resources/js/html5shiv.js')}"></script>
				<script src="${furl('/resources/js/respond.min.js')}"></script>
			<![endif]-->
			
			<link href="${furl('/resources/css/application.css')}" rel="stylesheet" />
			<link href="${furl('/resources/img/favicon.png')}" rel="shortcut icon" />
		</head>
		<body>
		
			<!-- Page content -->
			<#include "/layout/navbar.ftl">
			<#nested>
			<#include "/layout/footer.ftl">
			
			<!-- Titter Bootstrap - Latest compiled and minified JavaScript -->
			<script src="${furl('/resources/js/jquery.min.js')}"></script>
			<script src="${furl('/resources/js/bootstrap.min.js')}"></script>
		</body>
	</html>
</#macro>