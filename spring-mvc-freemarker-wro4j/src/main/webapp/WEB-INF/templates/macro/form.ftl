<#include "/macro/fun.ftl"/>

<#macro bind path>
    <#if htmlEscape?exists>
        <#assign status = springMacroRequestContext.getBindStatus(path, htmlEscape)>
    <#else>
        <#assign status = springMacroRequestContext.getBindStatus(path)>
    </#if>
    <#if status.value?exists && status.value?is_boolean>
        <#assign stringStatusValue=status.value?string>
    <#else>
        <#assign stringStatusValue=status.value?default("")>
    </#if>
</#macro>

<#macro bindEscaped path, htmlEscape>
    <#assign status = springMacroRequestContext.getBindStatus(path, htmlEscape)>
    <#if status.value?exists && status.value?is_boolean>
        <#assign stringStatusValue=status.value?string>
    <#else>
        <#assign stringStatusValue=status.value?default("")>
    </#if>
</#macro>


<#macro showErrors wide=false errStatus=status>
	<#if errStatus.errorMessages?has_content>
		<span class="<#if wide>help-block<#else>help-inline</#if> help-component">
			<ul class="form-errors">
				<#list errStatus.errorMessages as error>
					<li>${error}</li>
				</#list>
			</ul>
		</span>
	</#if>
</#macro>


<#macro link text url title="" remote=false>
	<div class="link-component">
		<div class="control-group ">
			<div class="controls">
				<#if title?has_content>
					<#assign title="data-toggle='tooltip' title='${title}'"/>
				</#if>
				<#if remote>
					<a href="${url}" ${title}>${fmsg(text)}</a>
				<#else>
					<a href="${furl(url)}" ${title}>${fmsg(text)}</a>
				</#if>
			</div>
		</div>
	</div>
</#macro>

<#macro messageStruct msgs htmlClass="">
	<#if ( !msgs.isEmpty() )>
		<div class="control-group ">
			<div class="controls ">
				<@message.msgstruct msgs htmlClass/>
			</div>	
		</div>
	</#if>
</#macro>


<#macro submit text htmlClass="" wide=false title="">
	<div class="submit-component">
		<div class="control-group">
			<div class="controls">
				<input type="submit" 
				name="save" 
				class="btn btn-primary ${fcheck(wide,'btn-block')} ${htmlClass}" 
				value="${fmsg(text)}" 
				<#if title?has_content>data-toggle="tooltip" title="${fmsg(title)}"</#if>
				/>
			</div>
		</div>
	</div>
</#macro>


<#macro hiddenVal path value>
	<@bind path/>
	<#assign id="${status.expression?replace('[','')?replace(']','')}" />
	<input type="hidden"
	id="${id}"
	name="${status.expression}"
	value="${value}" />
</#macro>


<#macro hidden path value="">
	<@bind path/>
	<#assign id="${status.expression?replace('[','')?replace(']','')}" />
	<input type="hidden"
	id="${id}"
	name="${status.expression}"
	value="${stringStatusValue}${value}" />
</#macro>


<#macro textfield path placeholder="" label="" htmlClass="" wide=false title="" attr="" value="" wrapperClass="" wrapperAttr="">
    <@bind path/>
    <#assign id="${status.expression?replace('[','')?replace(']','')}" />
    <div class="textfield-component">
		<div class="control-group ${checkErrors('error')}">
			<#if label?has_content>
				<label class="control-label" for="${id}">${fmsg(label)}</label>
			</#if>
			<div class="controls">
				<div class="${wrapperClass}" ${wrapperAttr}>
					<input type="text" class="${fcheck(wide, 'input-block-level')} ${htmlClass}" 
					<#if placeholder?has_content> placeholder="${fmsg(placeholder)}" </#if>
					<#if title?has_content>data-toggle="tooltip" title="${fmsg(title)}"</#if>
					id="${id}"
					name="${status.expression}"
					value="${stringStatusValue}${value}" ${attr} /> 
					<#nested>
				</div>
				<@showErrors wide/>
			</div>
		</div>
	</div>
</#macro>

<#macro tags path placeholder="" label="" label="" wide=false title="" attr="">
    <@textfield path=path placeholder=placeholder label=label label=label wide=wide title=title attr="data-provide='tag' autocomplete='false' ${attr}" />
</#macro>

<#macro fileupload path placeholder="" label="" htmlClass="" wide=false title="" attr="">
    <@bind path/>
    <#assign id="${status.expression?replace('[','')?replace(']','')}" />
    <div class="control-group ${checkErrors('error')}">
		<#if label?has_content>
			<label class="control-label" for="${id}">${fmsg(label)}</label>
		</#if>
		<div class="controls">
			<div class="fileupload fileupload-new" data-provides="fileupload">
				<div class="input-append">
					<div class="uneditable-input span3">
						<i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span>
					</div>
					<span class="btn btn-file">
						<span class="fileupload-new">${fmsg('fileupload.select')}</span>
						<span class="fileupload-exists">${fmsg('fileupload.change')}</span>
						<input type="file" id="${id}" name="${status.expression}" 
							<#if placeholder?has_content> placeholder="${fmsg(placeholder)}" </#if>
							<#if title?has_content>data-toggle="tooltip" title="${fmsg(title)}"</#if>
							${attr} 
							value="${stringStatusValue}" />
					</span>
					<a href="#" class="btn fileupload-exists fileupload-remove" data-dismiss="fileupload">${fmsg('fileupload.remove')}</a>
				</div>
				<#assign fileuploadStatus=status>
				<#nested>
				<@showErrors errStatus=fileuploadStatus wide=wide/>
			</div>
		</div>
	</div>
</#macro>

<#macro typeahead path labelPath="" placeholder="" label="" htmlClass="" id="" wide=false title="" attr="">
    <div class="typeahead-component">
		<div class="control-group ${checkErrors('error')}">
			<#if label?has_content>
				<label class="control-label" for="${id}">${fmsg(label)}</label>
			</#if>
			<div class="controls">
				<@bind labelPath/>
				<input type="text" value="${stringStatusValue}" autocomplete="off" data-provide="typeahead" data-items="4" 
				<#if placeholder?has_content> placeholder="${fmsg(placeholder)}" </#if>
				<#if title?has_content>data-toggle="tooltip" title="${fmsg(title)}"</#if>
				${attr} 
				id="${id}" name="${status.expression}"
				class="${fcheck(wide, 'input-block-level')} ${htmlClass}"  /> 
			    <@bind path/>
				<input name="${status.expression}" id="${id}-value" type="hidden" value="${stringStatusValue}"/>
				<#nested>
				<@showErrors wide/>
			</div>
		</div>
	</div>
</#macro>


<#macro password path  placeholder="" label="" htmlClass="" wide=false title="" attr="">
    <@bind path/>
    <#assign id="${status.expression?replace('[','')?replace(']','')}">
    <div class="password-component">
		<div class="control-group ${checkErrors('error')}">
			<#if label?has_content>
				<label class="control-label" for="${id}">${fmsg(label)}</label>
			</#if>
			<div class="controls">
				<input type="password" class="${fcheck(wide, 'input-block-level')} ${htmlClass}" 
				 <#if placeholder?has_content> placeholder="<@util.msg placeholder/>" </#if>
				 <#if title?has_content>data-toggle="tooltip" title="${fmsg(title)}"</#if>
				 ${attr} 
				 id="${id}" 
				 name="${status.expression}"/> 
				<@showErrors wide/>
			</div>
		</div>
	</div>
</#macro>


<#macro textarea  path rows  placeholder="" label="" htmlClass="" wide=false title="" attr="" value="" hideFormatInfo=false>
    <@bind path/>
    <#assign id="${status.expression?replace('[','')?replace(']','')}">
    <div class="textfield-component">
		<div class="control-group ${checkErrors('error')}">
			<#if label?has_content>
				<label class="control-label" for="${id}">${fmsg(label)}</label>
			</#if>
			<div class="controls">
				<textarea type="text" rows="${rows}" class="resize-vert ${fcheck(wide, 'input-block-level')} ${htmlClass}" 
				<#if title?has_content>data-toggle="tooltip" title="${fmsg(title)}"</#if>
				<#if placeholder?has_content> placeholder="<@util.msg placeholder/>" </#if>
				${attr} 
 				id="${id}"
 				name="${status.expression}">${value}${stringStatusValue}</textarea> 
				<@showErrors wide/>
				<#if !hideFormatInfo>
					<div class="text-right">
						<@markdownInfoLink />
					</div>
				</#if>
			</div>
		</div>
	</div>
</#macro>

<#macro markdownInfoLink>
	<a href="#markdown-modal" role="button" class="submit-link" data-toggle="modal">${fmsg('markdown.modal.link')}</a>
</#macro>

<#macro singleSelect path options label="" htmlClass="" wide=false title="" attr="">
    <@bind path/>
    <#assign id="${status.expression?replace('[','')?replace(']','')}">
    <div class="singleselect-component">
		<div class="control-group ${checkErrors('error')}">
			<#if label?has_content>
				<label class="control-label" for="${id}">${fmsg(label)}</label>
			</#if>
		    <div class="controls">
			    <select id="${id}" name="${status.expression}" 
			    	class="${fcheck(wide, 'input-block-level')} ${htmlClass}" 
			    	<#if title?has_content>data-toggle="tooltip" title="${fmsg(title)}"</#if> 
			    	${attr} 
			    >
			        <#if options?is_hash>
			            <#list options?keys as value>
			            	<option value="${value?html}"<@checkSelected value/>>${options[value]?html}</option>
			            </#list>
			        <#else> 
			            <#list options as value>
			            	<option value="${value?html}"<@checkSelected value/>>${fmsg(value)}</option>
			            </#list>
			        </#if>
			    </select>
			    <@showErrors wide/>
			</div>
		</div>
	</div>
</#macro>


<#macro multiSelect path options label="" htmlClass="" wide=false title="" attr="">
	<@bind path/>
	<#assign id="${status.expression?replace('[','')?replace(']','')}">
	<div class="multiselect-component">
		<div class="control-group ${checkErrors('error')}">
			<#if label?has_content>
				<label class="control-label" for="${id}">${fmsg(label)}</label>
			</#if>
			<div class="controls">
				<select multiple="multiple" id="${id}" name="${status.expression}" 
					<#if title?has_content>data-toggle="tooltip" title="${fmsg(title)}"</#if>
					class="${fcheck(wide, 'input-block-level')} ${htmlClass}" 
					${attr} 
				>
					<#if options?is_hash>
			            <#list options?keys as value>
					        <#assign isSelected = contains(status.actualValue?default([""]), value)>
					        <option value="${value?html}"<#if isSelected> selected="selected"</#if>>${options[value]?html}</option>
			            </#list>
			        <#else> 
			            <#list options as value>
			            	<#assign isSelected = contains(status.actualValue?default([""]), value)>
					        <option value="${value?html}"<#if isSelected> selected="selected"</#if>>${value?html}</option>
			            </#list>
			        </#if>
				</select>
				<@showErrors wide/>
			</div>
		</div>
	</div>
</#macro>


<#macro radioButtons path options label="" htmlClass="" wide=false >
    <@bind path/>
	<#assign id="${status.expression?replace('[','')?replace(']','')}">
    <div class="radiobuttons-component">
		<div class="control-group ${checkErrors('error')}">
			<#if label?has_content>
				<label class="control-label" for="${id}">${fmsg(label)}</label>
			</#if>
			<div class="controls">
				<#list options?keys as value>
					<label class="radio control-label" for="${idOpt}">
						<input
						type="radio" 
						name="${status.expression}" 
						<#if stringStatusValue == value> checked="checked"</#if> 
						class="${htmlClass}" />
						<@util.msg options[value]/>
					</label>
				</#list>
				<@showErrors wide/>
			</div>
		</div>
	</div>
</#macro>


<#macro checkboxes path options label="" htmlClass="" wide=false>
    <@bind path/>
    <#assign id="${status.expression?replace('[','')?replace(']','')}">
    <div class="checkboxes-component">
		<div class="control-group ${checkErrors('error')}">
			<#if label?has_content>
				<label class="control-label" for="${id}">${fmsg(label)}</label>
			</#if>
			<div class="controls">
			    
			    <#if options?is_hash>
			        <#list options?keys as value>
				    	<#assign idOpt="${status.expression?replace('[','')?replace(']','')}${value_index}">
				    	<#assign isSelected = contains(status.actualValue?default([""]), value)>
						<label class="checkbox control-label" for="${idOpt}" >
							<span>
								<input id="${idOpt}" type="checkbox" name="${status.expression}" value="${value?html}" <#if isSelected> checked="checked"</#if>  class="${htmlClass}"/>
								${fmsg(option[value])}
							</span>
						</label>
			    	</#list>
			    <#else> 
			        <#list options as value>
				    	<#assign idOpt="${status.expression?replace('[','')?replace(']','')}${value_index}">
				    	<#assign isSelected = contains(status.actualValue?default([""]), value)>
						<label class="checkbox control-label" for="${idOpt}" >
							<span>
								<input id="${idOpt}" type="checkbox" name="${status.expression}" value="${value?html}" <#if isSelected> checked="checked"</#if>  class="${htmlClass}"/>
								${fmsg(value)}
							</span>
						</label>
			    	</#list>
			    </#if>
	    		<input type="hidden" name="_${status.expression}" value="on"/>
	    		<@showErrors wide/>
	    	</div>
		</div>
	</div>
</#macro>


<#macro checkbox path text="" label="" htmlClass="" wide=false title="" attr="" value=false>
    <@bind path/>
    <#assign id="${status.expression?replace('[','')?replace(']','')}">
    <#assign isSelected = value || ( status.value?? && status.value?string=="true")>
    <div class="checkbox-component">
		<div class="control-group ${checkErrors('error')}">
			<#if label?has_content>
				<label class="control-label" for="${id}">${fmsg(label)}</label>
			</#if>
			<div class="controls">
			    <input type="hidden" name="_${status.expression}" value="on"/>
			    <label class="checkbox control-label">
			    	<span <#if title?has_content>data-toggle="tooltip" title="${fmsg(title)}"</#if>>
				    	<input type="checkbox" id="${id}" name="${status.expression}"
				    		<#if isSelected> checked="checked"</#if>
				    		${attr} 
				    		class="${htmlClass}"
				    	/>
				    	${fmsg(text)}
			    	</span>
	    		</label>
	    		<@showErrors wide/>
	    	</div>
		</div>
	</div>
</#macro>

<#macro checkboxSimple path text="" label="" htmlClass="" wide=false title="" attr="">
    <@bind path/>
    <#assign id="${status.expression?replace('[','')?replace(']','')}">
    <#assign isSelected = status.value?? && status.value?string=="true">
	<input type="hidden" name="_${status.expression}" value="on"/>
	<label class="checkbox control-label">
		<input type="checkbox" id="${id}" name="${status.expression}"
		<#if isSelected> checked="checked"</#if>
		<#if title?has_content>data-toggle="tooltip" title="${fmsg(title)}"</#if>
		${attr} 
		class="${htmlClass}"/>
	    ${fmsg(text)} 
	 </label>
</#macro>




<#macro checkSelected value>
    <#if stringStatusValue?is_number && stringStatusValue == value?number>selected="selected"</#if>
    <#if stringStatusValue?is_string && stringStatusValue == value>selected="selected"</#if>
</#macro>

<#function contains list item>
    <#list list as nextInList>
    <#if nextInList == item><#return true></#if>
    </#list>
    <#return false>
</#function>

<#function checkErrors content >
	<#if (status?? && status.errorMessages?has_content)>
    	<#return content />
    </#if>
    <#return ''/>
</#function>


<#macro markdownInfoModal>
	<div id="markdown-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="markdown-modal-label" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="markdown-modal-label">${fmsg('markdown.modal.title')}</h3>
		</div>
		<div class="modal-body">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>${fmsg('markdown.modal.code')}</th>
						<th>${fmsg('markdown.modal.result')}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<code>#Nagłówek 1</code><br/>
							<code>##Nagłówek 2</code><br/>
							<code>###Nagłówek 3</code>
						</td>
						<td>
							<h1>Nagłówek 1</h1>
							<h2>Nagłówek 2</h2>
							<h3>Nagłówek 3</h3>
						</td>
					</tr>
					<tr>
						<td>
							<code>*emfaza*</code><br/>
							<code>**mocna emfaza**</code>
						</td>
						<td>
							<i>emfaza</i><br/>
							<b>mocna emfaza</b>
						</td>
					</tr>
					<tr>
						<td>
							<code>* Pierwszy element listy.</code><br/>
							<code>* Drugi.</code>
						</td>
						<td>
							<ul>
								<li>Pierwszy element listy.</li>
								<li>Drugi.</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>
							<code>
								&gt; Cytat
							</code>
						</td>
						<td>
							<blockquote><p>Cytat</p></blockquote>
						</td>
					</tr>
					<tr>
						<td>
							<code>http://www.edemocracy.org.pl</code><br/>
							<code>[eDemokracja](http://www.edemocracy.org.pl)</code>
						</td>
						<td>
							<a href="${furl('/')}">http://www.edemocracy.org.pl</a><br/>
							<a href="${furl('/')}">eDemokracja</a>
						</td>
					</tr>
					<tr>
						<td>
							<code>
								http://www.edemocracy.org.pl/.../image.png
							</code>
						</td>
						<td>
							<img src="${furl('/images/default.png?width=150&height=100')}" titlw="eDemokracja" alt="eDemokracja"/>
						</td>
					</tr>
					<tr>
						<td>
							<code>
								http://www.youtube.com/watch?v=9bZkp7q19f0
							</code>
						</td>
						<td>
							<div>
								<iframe class="static" width="400" height="300" src="http://www.youtube.com/embed/9bZkp7q19f0" frameborder="0" allowfullscreen></iframe>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">${fmsg('markdown.modal.close')}</button>
		</div>
	</div>
</#macro>
