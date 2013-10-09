<#macro simple currentPage pages anchor="" htmlClass="" pageParamName="page">
	<#if (pages > 1)>	
		<div class="pagination ${htmlClass}">
			<#if anchor?? && anchor?has_content>
				<#assign pageUrlBuilder=urlBuilder.setAnchor(anchor).build().builder()/>
			<#else>
				<#assign pageUrlBuilder=urlBuilder.build().builder()/>
			</#if>
			<#assign prevPage=currentPage-1/>
			<#assign nextPage=currentPage+1/>
			<#assign prevPageUrl="${pageUrlBuilder.addUniqueQueryParameter(pageParamName, prevPage).build().url}">
			<#assign nextPageUrl="${pageUrlBuilder.addUniqueQueryParameter(pageParamName, nextPage).build().url}">
			
			<#assign firstPageUrl="${pageUrlBuilder.addUniqueQueryParameter(pageParamName, 1).build().url}">
			<#assign lastPageUrl="${pageUrlBuilder.addUniqueQueryParameter(pageParamName, pages).build().url}">
			<ul>
				<#if (currentPage <= 1)>
					<li class="disabled"><a href="#">&laquo;</a></li>
				<#else>
					<li><a href="${prevPageUrl}">&laquo;</a></li>
				</#if>
				
				<#if (currentPage > 2)><li><a href="${firstPageUrl}">1</a></li></#if>
				<#if (prevPage > 2)><li class="disabled"><a href="#">...</a></li></#if>
				<#if (prevPage >= 1)><li><a href="${prevPageUrl}">${prevPage}</a></li></#if>
				
				<li class="disabled"><a href="#">${currentPage}</a></li>
				
				<#if (nextPage <= pages)><li><a href="${nextPageUrl}">${nextPage}</a></li></#if>
				<#if (nextPage < pages - 1)><li class="disabled"><a href="#">...</a></li></#if>
				<#if (currentPage < pages-1)><li><a href="${lastPageUrl}">${pages}</a></li></#if>
				
				<#if (currentPage >= pages)>
					<li class="disabled"><a href="#">&raquo;</a></li>
				<#else>
					<li><a href="${nextPageUrl}">&raquo;</a></li>
				</#if>
			</ul>
		</div>
	</#if>
</#macro>

<#macro struct pageStruct anchor="" htmlClass="" pageParamName="page">
	<@simple pageStruct.number+1 pageStruct.totalPages anchor htmlClass pageParamName />
</#macro>