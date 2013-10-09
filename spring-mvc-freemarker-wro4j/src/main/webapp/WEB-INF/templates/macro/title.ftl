<#macro page title icon="" spanClass="" text="">
<div class="wide-panel page-title-panel">
	<div class="container">
		<div class="row text-center">
			<div class="${spanClass}">
				<#if icon?has_content>
					<i class="${icon}"></i>
				</#if>
				<h1>${title}</h1>
				<#if text?has_content>
					<h2>${text}</h2>
				</#if>
			</div>
		</div>
	</div>
</div>
</#macro>


<#macro error title="error" icon="icon-remove-circle" spanClass="" text="">
<div class="wide-panel page-title-panel error-panel">
	<div class="container">
		<div class="row text-center">
			<div class="${spanClass}">
				<i class="${icon}"></i>
				<h1>${title}</h1>
				<#if text?has_content>
					<h2>${text}</h2>
				</#if>
			</div>
		</div>
	</div>
</div>
</#macro>
