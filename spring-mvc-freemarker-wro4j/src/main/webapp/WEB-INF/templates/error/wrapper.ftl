<#include "/macro/fun.ftl">
<#macro wrapper header>
	<@layout.page>
		<@title.error title="${header}"/>
		<div class="container">
			<div class="row text-center">
				<div class="offset3 span6">
					<#nested>
				</div>
			</div>
		</div>
	</@layout.page>
</#macro>