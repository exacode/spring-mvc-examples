<#include "/macro/fun.ftl"/>

<#macro removeCriteria param>
	<a href="${fquery(param, '')}" data-toggle="tooltip" data-placement="bottom" title="${fmsg('criteria.delete')}"><i class="icon-remove"></i></a>
</#macro>

<#macro info empty searchParam="search" tagParam="tags" >
	<#if (RequestParameters[searchParam]?? && RequestParameters[searchParam]?has_content) 
	|| (RequestParameters[tagParam]?? && RequestParameters[tagParam]?has_content) 
	||  empty>
		<div class="well text-center">
			<#if (RequestParameters[searchParam]?? && RequestParameters[searchParam]?has_content)>
				<#assign searchQuery=RequestParameters[searchParam]/>
				<#if (!empty)>
					<p>
						${fmsgArg('criteria.search.results', searchQuery)} <@removeCriteria searchParam />
					<p>
				<#else>
					<p>
						${fmsgArg('criteria.search.notFound', searchQuery)} <@removeCriteria searchParam />
					<p>
				</#if>
			</#if>
			<#if (RequestParameters[tagParam]?? && RequestParameters[tagParam]?has_content)>
				<#assign tagQuery=RequestParameters[tagParam]/>
				<#if (!empty)>
					<p>
						${fmsgArg('criteria.tag.results', tagQuery)} <@removeCriteria tagParam />
					<p>
				<#else>
					<p>
						${fmsgArg('criteria.tag.notFound', tagQuery)} <@removeCriteria tagParam />
					<p>
				</#if>
			</#if>
			<#if empty>
				<p>
					${fmsg('criteria.result.empty')}
				<p>
			</#if>
		</div>
	</#if>
</#macro>

<#macro query searchParam="search" tagParam="tags">
	<form  method="get" accept-charset="UTF-8">
		<div>
			<input type="text" name="tags" placeholder="${fmsg('criteria.form.tags')}" value="${RequestParameters[tagParam]!}" data-provide='tag' autocomplete='false'/>
		</div>
		<div>
			<input type="text" name="search" placeholder="${fmsg('criteria.form.search')}" value="${RequestParameters[searchParam]!}"/>
		</div>
		<button class="btn" type="submit">${fmsg('criteria.form.submit')}</button>
	</form>
</#macro>

<#macro searchquery searchParam="search" tagParam="tags">
	<form class="form-inline" method="get" accept-charset="UTF-8">
		<div class="input-append">
			<input type="text" name="search" placeholder="${fmsg('criteria.form.search')}" value="${RequestParameters[searchParam]!}"/>
			<button class="btn" type="submit">${fmsg('criteria.form.submit')}</button>
		</div>
	</form>
</#macro>

<#macro nav sortParam="sort" popularParam="popular" yourParam="your">
	<ul class="nav nav-tabs">
		<li class="${fcheck(fhasparam(sortParam, 'recent')  || fnoparam(sortParam), 'active')}"><a href=${fquery(sortParam, 'recent')}>${fmsg('criteria.nav.recent')}</a></li>
		<li class="${fcheck(fhasparam(sortParam, 'popular'), 'active')}"><a href=${fquery(sortParam, 'popular')}>${fmsg('criteria.nav.popular')}</a></li>
		<@sec.isAuthenticated>
			<li class="${fcheck(fhasparam(sortParam, 'your'), 'active')}"><a href=${fquery(sortParam, 'your')}>${fmsg('criteria.nav.your')}</a></li>
		</@>
	</ul>
	<#if fhasparam(sortParam, 'popular')>
		<ul class="nav nav-pills">
			<li class="${fcheck(fhasparam(popularParam, 'week') || fnoparam(popularParam), 'active')}"><a href=${fquery(popularParam, 'week')}>${fmsg('criteria.nav.popular.week')}</a></li>
			<li class="${fcheck(fhasparam(popularParam, 'month'), 'active')}"><a href=${fquery(popularParam, 'month')}>${fmsg('criteria.nav.popular.month')}</a></li>
			<li class="${fcheck(fhasparam(popularParam, 'year'), 'active')}"><a href=${fquery(popularParam, 'year')}>${fmsg('criteria.nav.popular.year')}</a></li>
			<li class="${fcheck(fhasparam(popularParam, 'all'), 'active')}"><a href=${fquery(popularParam, 'all')}>${fmsg('criteria.nav.popular.all')}</a></li>
		</ul>
	<#elseif fhasparam(sortParam, 'your')>
		<ul class="nav nav-pills"> 
			<li class="${fcheck(fhasparam(yourParam, 'all') || fnoparam(yourParam), 'active')}"><a href=${fquery(yourParam, 'all')}>${fmsg('criteria.nav.your.all')}</a></li>
			<li class="${fcheck(fhasparam(yourParam, 'participated'), 'active')}"><a href=${fquery(yourParam, 'participated')}>${fmsg('criteria.nav.your.participated')}</a></li>
			<li class="${fcheck(fhasparam(yourParam, 'started'), 'active')}"><a href=${fquery(yourParam, 'started')}>${fmsg('criteria.nav.your.started')}</a></li>
		</ul>
	</#if>
</#macro>