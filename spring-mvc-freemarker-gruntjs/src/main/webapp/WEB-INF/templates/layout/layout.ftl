<#include "/macro/util.ftl">
<#macro page title="" view="" ngApp="">
	<#setting locale="${fmsg('application.locale')}">
	<!DOCTYPE html>
	<html lang="${fmsg('application.locale')}">
		<head> 
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">

			<title>${(title)!fmsg('application.title')}</title> 

			<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
			<!--[if lt IE 9]>
				<script src="${furl('/assets/js/application-ie8.js')}"></script>
			<![endif]-->
			<link href="${furl('/assets/css/main.css')}" rel="stylesheet" />
			<link href="${furl('/assets/img/favicon.png')}" rel="shortcut icon" />
		</head>
		<body>
		
			<!-- Page content -->
			<#include "/layout/navbar.ftl">
			<#nested>
			<#include "/layout/footer.ftl">

			<script src="${furl('/assets/js/require.js')}"></script>
			<script>
				<#if ngApp?has_content>
					require([
						"require",
						"${furl('/assets/js/basic.js')}",
						"${furl('/assets/js/common.js')}"
					], function (require) {
		                require(["${furl('/assets/js/modules/${ngApp}/loader.js')}"]);
		            });
		        <#else>
					require(["${furl('/assets/js/basic.js')}"]);
	            </#if>
            </script>
		</body>
	</html>
</#macro>