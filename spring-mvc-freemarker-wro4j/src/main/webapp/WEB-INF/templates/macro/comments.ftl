<#include "/macro/fun.ftl"/>

<#function commentsBaseUrl resource postfix page>
	<#return commentsBaseUrlByText(resource.type.toString()?lower_case, resource.id, postfix, page) />
</#function>

<#function commentsBaseUrlByText resourceType resourceId postfix page="1">
	<#return furl('/comments/' + resourceType + '/' + resourceId + '/' + postfix + '?commentspage=' + page) />
</#function>

<#macro listing commentsPage resourceType resourceId>
	<button data-item-fold="comments-responsive" class="panel btn btn-large btn-block btn-primary visible-phone">Pokaż komentarze</button>
	<section id="comments-responsive" class="resizable" phone-visible-class="hide" phone-hidden-class="height-auto">
		<div class="row-fluid not-phone-responsive">
			<#list commentsPage.content as comment>
				<@printMainComment comment commentsPage.number+1/>
			</#list>
			<#if !commentsPage.hasContent()>
				<h4>${fmsg('comments.noComments')}<h4>
			</#if>
		</div>
		<div class="row-fluid">
			<div class="offset2 span10">
				<@pagination.struct pageStruct=commentsPage pageParamName="commentspage" anchor="comments" htmlClass="pagination-centered" />
			</div>
		</div>
		<@sec.hasPermission 'comment' 'write'>
			<div class="row-fluid comment-main">
				<div class="span2 hidden-phone">
					<div class="author">
						<@misc.userHeaderImage userHeader=authUser width=80 htmlClass="img-polaroid hide-dims"/>
				    	<h4>
							<a href="${furl('/users/' + authUser.nickname)}">
									${authUser.fullname}
							</a>
						</h4>
				    </div>
				</div>
				<div class="span10">
					<div class="comment-bubble">
						<form class="form-vertical" method="post" action="${commentsBaseUrlByText( resourceType, resourceId, 'new', pageNumber)}"  autocomplete="false">
							<@form.textarea wide=true rows=10 path='newCommentFormModel.content' label="<h4>${fmsg('comments.new.content')}</h4>"/>
							<@form.submit wide=true text='comments.new.submit'  />
						</form>
					</div>
				</div>
			</div>
		</@>
	</section>
	<@form.markdownInfoModal/>
</#macro>


<#macro printMainComment comment pageNumber>
	<div id="comments/${comment.commentId}" class="row-fluid comment-main">
		<#assign author=comment.author/>
		<div class="span2">
			<@misc.userHeaderImage userHeader=author width=80 htmlClass="img-polaroid hide-dims"/>
		</div>
		<div class="span10">
			<div class="comment-bubble">
				<div class="comment-header">
					<h4 class="comment-heading">
						<a href="${furl('/users/' + author.nickname)}">
								${author.fullname}
						</a>
						<small><@misc.printDateTime dateTime=comment.createdAt/></small>
					</h4>
				</div>
				<div id="comment-content-${comment.commentId}" class="comment-body unfolded">
					<@printContent comment/>
				</div>
				<div class="comment-footer">
					<div class="comment-nav text-right">
						<@sec.hasPermissionById comment.commentId 'comment' 'edit'>
							<a data-item-fold="comment-edit-${comment.commentId} comment-content-${comment.commentId}" class="btn btn-mini link-folded">${fmsg('comments.comment.edit')}  <i class="icon-angle-down unfolded-hidden"></i><i class="icon-angle-up folded-hidden"></i></a>
						</@>
						<@sec.hasPermissionById comment.commentId 'comment' 'moderate'>
							<a data-item-fold="comment-moderate-${comment.commentId} comment-content-${comment.commentId}" class="btn btn-mini link-folded">${fmsg('comments.comment.moderate')}  <i class="icon-angle-down unfolded-hidden"></i><i class="icon-angle-up folded-hidden"></i></a>
						</@>
						<@sec.hasPermissionById comment.commentId 'comment' 'delete'>
							<form method="post" class="button-form" action="${commentsBaseUrl(comment.resource, 'delete', pageNumber)}">
								<@form.hidden path="deleteCommentFormModel.commentId" value=comment.commentId/>
								<button type="submit" class="btn btn-mini">${fmsg('comments.comment.delete')}</button>
							</form>
						</@>
						<@sec.hasPermission 'comment' 'write'>
							<a data-item-fold="comment-subcomment-${comment.commentId}" class="btn btn-mini link-folded">${fmsg('comments.comment.addSubComment')} <i class="icon-angle-down unfolded-hidden"></i><i class="icon-angle-up folded-hidden"></i></a>
						</@>
					</div>
				</div>
				<@sec.hasPermissionById comment.commentId 'comment' 'edit'>
					<form id="comment-edit-${comment.commentId}"  class="comment-form hide form-vertical folded"  method="post" action="${commentsBaseUrl(comment.resource, 'edit', pageNumber)}" autocomplete="false">
						<@form.hidden path="editCommentFormModel.commentId" value=comment.commentId/>
						<@form.textarea wide=true rows=10 path='editCommentFormModel.content' label="comments.edit.content" value=comment.content.markdown/>
						<@form.submit text='comments.edit.submit'  />
					</form>
				</@>
				<@sec.hasPermissionById comment.commentId 'comment' 'moderate'>
					<form id="comment-moderate-${comment.commentId}"  class="comment-form hide form-vertical folded"  method="post" action="${commentsBaseUrl(comment.resource, 'moderate', pageNumber)}" autocomplete="false">
						<@form.hidden path="moderateCommentFormModel.commentId" value=comment.commentId/>
						<@form.textarea wide=true rows=10 path='moderateCommentFormModel.content' label="comments.moderate.content" value=comment.content.markdown/>
						<@form.checkbox  wide=true path='moderateCommentFormModel.hideContent' text="comments.moderate.hideContent" value=comment.isHideContent()/>
						<@form.textfield wide=true path='moderateCommentFormModel.moderatorMessage' label="comments.moderate.moderatorMessage" value=comment.moderatorMessage.markdown!/>
						<@form.submit text='comments.moderate.submit' />
					</form>
				</@>
			</div>
			<div class="comments-sub">
				<#list subComments[comment.commentId] as subComment>
					<@printSubComment subComment pageNumber/>
				</#list>
				<@sec.hasPermission 'comment' 'write'>
					<div class="comment-sub">
						<form id="comment-subcomment-${comment.commentId}" class="comment-form hide form-vertical text-right folded" method="post" action="${commentsBaseUrl(comment.resource, 'new', pageNumber)}"  autocomplete="false">
							<@form.hidden path="newCommentFormModel.parentCommentId" value=comment.commentId/>
							<@form.textarea wide=true rows=1 path='newCommentFormModel.content' placeholder="${fmsg('comments.new.subcomment')}"/>
							<@form.submit htmlClass="btn-mini" text='comments.new.submit'  />
						</form>
					</div>
				</@>
			</div>
		</div>
	</div>
</#macro>


<#macro printSubComment comment pageNumber>
	<div id="comments/${comment.commentId}" class="comment-sub row-fluid">
		<#assign author=comment.author/>
		<div class="span1">
			<@misc.userHeaderImage userHeader=author width=20 htmlClass="media-object img-polaroid hide-dims"/>
		</div>
		<div class="span11">
			<div class="comment-header">
				<h5 class="comment-heading">
					<a href="${furl('/users/' + author.nickname)}">
							${author.fullname}&nbsp;
					</a>
					<small><@misc.printDateTime dateTime=comment.createdAt/></small>
				</h5>
			</div>
			<div id="comment-content-${comment.commentId}" class="comment-body unfolded">
				<@printContent comment/>
			</div>
			<div class="comment-footer">
				<div class="comment-nav text-right">
					<@sec.hasPermissionById comment.commentId 'comment' 'edit'>
						<a data-item-fold="comment-edit-${comment.commentId} comment-content-${comment.commentId}"  class="link-folded">${fmsg('comments.comment.edit')}  <i class="icon-angle-down unfolded-hidden"></i><i class="icon-angle-up folded-hidden"></i></a>
					</@>
					<@sec.hasPermissionById comment.commentId 'comment' 'moderate'>
						<a data-item-fold="comment-moderate-${comment.commentId} comment-content-${comment.commentId}" class="link-folded">${fmsg('comments.comment.moderate')}  <i class="icon-angle-down unfolded-hidden"></i><i class="icon-angle-up folded-hidden"></i></a>
					</@>
					<@sec.hasPermissionById comment.commentId 'comment' 'delete'>
						<form method="post" id="comment-delete-${comment.commentId}" class="button-form" action="${commentsBaseUrl(comment.resource, 'delete', pageNumber)}">
							<@form.hidden path="deleteCommentFormModel.commentId" value=comment.commentId/>
							<@form.hidden path="deleteCommentFormModel.parentCommentId" value=comment.parentCommentId/>
							<a class="submit-link" data-form-submit="comment-delete-${comment.commentId}">${fmsg('comments.comment.delete')}</a>
						</form>
					</@>
				</div> 
			</div>
			<@sec.hasPermissionById comment.commentId 'comment' 'edit'>
				<form id="comment-edit-${comment.commentId}"  class="hide form-vertical comment-form folded"  method="post" action="${commentsBaseUrl(comment.resource, 'edit', pageNumber)}" autocomplete="false">
					<@form.hidden path="editCommentFormModel.commentId" value=comment.commentId/>
					<@form.textarea wide=true rows=1 path='editCommentFormModel.content' label="comments.edit.content" value=comment.content.markdown/>
					<@form.submit htmlClass="btn btn-mini" text='comments.edit.submit'  />
				</form>
			</@>
			<@sec.hasPermissionById comment.commentId 'comment' 'moderate'>
				<form id="comment-moderate-${comment.commentId}"  class="hide form-vertical comment-form folded"  method="post" action="${commentsBaseUrl(comment.resource, 'moderate', pageNumber)}" autocomplete="false">
					<@form.hidden path="moderateCommentFormModel.commentId" value=comment.commentId/>
					<@form.textarea wide=true rows=1 path='moderateCommentFormModel.content' label="comments.moderate.content" value=comment.content.markdown/>
					<@form.checkbox  wide=true path='moderateCommentFormModel.hideContent' text="comments.moderate.hideContent"/>
					<@form.textarea wide=true rows=1 path='moderateCommentFormModel.moderatorMessage' label="comments.moderate.moderatorMessage"  value=comment.moderatorMessage.markdown/>
					<@form.submit htmlClass="btn btn-mini" text='comments.moderate.submit' />
				</form> 
			</@>
		</div> 
	</div>
</#macro>


<#macro printContent comment>
	<#if !comment.moderatorMessage.isEmpty()>
		<#if !comment.isHideContent()>
			${comment.content.html}
		</#if>
		<div class="comment-moderator-message">
			${comment.moderatorMessage.html}
		</div>
	<#else>
		<#if comment.isHideContent()>
			<div class="comment-moderator-message">
				${fmsg('comments.moderate.contentHidden')}
			</div>
		<#else>
			${comment.content.html}
		</#if>
	</#if>
</#macro>



