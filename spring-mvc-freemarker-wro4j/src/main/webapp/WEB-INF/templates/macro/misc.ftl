<#include "/macro/fun.ftl"/>

<#macro lazyImg src width height="" title="" alt="" htmlClass="">
	<#assign widthNum=width?number/>
	<#if height?has_content>
		<#assign heightNum=height?number/>
	<#else>
		<#assign heightNum=width?number/>
	</#if>
	<#assign gcd=fgcd(widthNum, heightNum)/>
	<#assign gcd=fgcd(widthNum, heightNum)/>
	<#assign holderWidth=(widthNum/gcd)/>
	<#assign holderHeight=(heightNum/gcd)/>
	<#if (title?has_content && !alt?has_content)>
		<#assign alt=title>
	</#if>
	<#if (alt?has_content && !title?has_content)>
		<#assign title=alt>
	</#if>
	<img title="${title}" alt="${alt}" data-original="${src}" src="http://placehold.it/${holderWidth?c}x${holderHeight?c}/eee/eee&text=+" width="${widthNum?c}" class="lazy ${htmlClass}" />
	<noscript><img title="${title}" alt="${alt}" src="${src}" class="${htmlClass}" /></noscript>
</#macro>

<#macro appImgStruct imgStruct width height title="" alt="" htmlClass="">
	<div class="app-img-wrapper text-center img-polaroid">
		<#if imgStruct?? && imgStruct?has_content>
			<@misc.lazyImg src="${furl(imgStruct.getImageUrl(width, height))}" width="${width}" height="${height}" title="${title}" alt="${alt}"  htmlClass="hide-dims ${htmlClass}"/>
		<#else>
			<@misc.lazyImg src="${furl('/images/default.png?width=' + width + '&height=' + height)}" width="${width}" height="${height}" title="${title}" alt="${alt}"  htmlClass="hide-dims ${htmlClass}"/>
		</#if>
	</div>
</#macro>

<#macro appImg imgId width height title="" alt="" htmlClass="" wrapperHtmlClass="img-polaroid">
	<div class="app-img-wrapper text-center ${wrapperHtmlClass}">
		<#if imgId?? && imgId?has_content>
			<@misc.lazyImg src="${furl('/images/' + imgId + '.png?width=' + width + '&height=' + height)}" width="${width}" height="${height}" title="${title}" alt="${alt}"  htmlClass="hide-dims ${htmlClass}"/>
		<#else>
			<@misc.lazyImg src="${furl('/images/default.png?width=' + width + '&height=' + height)}" width="${width}" height="${height}" title="${title}" alt="${alt}"  htmlClass="hide-dims ${htmlClass}"/>
		</#if>
	</div>
</#macro>

<#macro anonymousUserImg width title="${fmsg('global.anonymousUser')}" wrapperHtmlClass="" htmlClass="">
	<span class="${wrapperHtmlClass}">
		<@misc.lazyImg src="https://secure.gravatar.com/avatar?d=mm&s=${width}" title="${title}" width=width htmlClass="${htmlClass}"/>
	</span>
</#macro>

<#macro userHeaderImage userHeader width wrapperHtmlClass="" htmlClass="" nolink=false>
	<#if userHeader.image??>
		<#if userHeader['nickname']??>
			<a href="${furl('/users/' + userHeader.nickname)}" class="${wrapperHtmlClass}">
				<@misc.lazyImg src="${userHeader.image.getImageUrl(width)}" title="${userHeader.fullname}" width=width htmlClass="${htmlClass}"/>
			</a>
		<#else>
			<span class="${wrapperHtmlClass}">
				<@misc.anonymousUserImg width=width htmlClass="${htmlClass}"/>
			</span>
		</#if>
	<#else>
		<span class="${wrapperHtmlClass}">
			<@misc.anonymousUserImg width=width htmlClass="${htmlClass}"/>
		</span>
	</#if>	
</#macro>

<#macro printAutoredirect title="${fmsg('application.homeRedirect')}" url="${furl('/')}" seconds="5">
	<span class="autoredirect-wrapper"><a href="${url}">${title}</a> <span id="autoredirect" data-redirect-url="${url}" >5</span><span>
</#macro>

<#macro printDateTime dateTime format="format.timestamp" htmlClass="">
	<#if (dateTime?? && dateTime?has_content)>
		<date class="${htmlClass}">${dateTime.toDate()?string(fmsg(format))}</date>
	</#if>
</#macro>

<#macro printCreationDateTime dateTime format="format.timestamp">
	<#if (dateTime?? && dateTime?has_content)>
		<div class="creation-time">
	    	<i class="icon-calendar"></i> ${fmsg('global.creationTime')}: 
	    	<date><@printDateTime dateTime format/></date>
	    </div>
	</#if>
</#macro>

<#macro printUpdateDateTime dateTime format="format.timestamp">
	<#if (dateTime?? && dateTime?has_content)>
		<div class="update-time">
	    	<i class="icon-calendar-empty"></i> ${fmsg('global.updateTime')}:
	    	<date><@printDateTime dateTime format/></date>
	    </div>
	</#if>
</#macro>

<#macro printTags tags>
	<#if (tags?? && tags?has_content)>
	    <div class="tags">
	    	<i class="icon-tags"></i> ${fmsg('global.tags.title')}: 
		    <#list tags as tag>
		    	<a href="${furl('/tags/' + tag)}">${tag}</a>
		    	<#if tag_has_next>${fmsg('global.tags.separator')} </#if>
		    </#list>
	    </div>
	</#if>
</#macro>

<#macro printBoolean value>
	<#if value>
		${fmsg('boolean.true')}
	<#else>
		${fmsg('boolean.false')}
	</#if>
</#macro>

<#macro printUserHeader userHeader imgWidth=80 title="" layout="right" htmlClass="">
    <#if layout="right">
    	<#assign imgHtmlClass="pull-right">
    	<#assign textHtmlClass="text-right">
    <#elseif layout="left">
    	<#assign imgHtmlClass="pull-left">
    	<#assign textHtmlClass="text-left">
    <#else>
    	<#assign imgHtmlClass="text-center">
    	<#assign textHtmlClass="text-center">
    </#if>
    <div class="media ${textHtmlClass} ${htmlClass}">
		<@misc.userHeaderImage userHeader=userHeader width=imgWidth wrapperHtmlClass="${imgHtmlClass}" htmlClass="hide-dims"/>
		<div class="media-body">
			<strong><small>${title}</small></strong>
			<h4 class="media-heading">
				<#if userHeader['nickname']??>
					<a href="${furl('/users/' + userHeader.nickname)}">
						${userHeader.fullname}
					</a>
				<#elseif userHeader.fullname??>
					${userHeader.fullname}
				<#else>
					${fmsg('global.anonymousUser')}
				</#if>
			</h4>
			<#nested>
		</div>
    </div>
</#macro>

