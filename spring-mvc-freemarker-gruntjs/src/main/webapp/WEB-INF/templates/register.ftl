<#import "/macro/form.ftl" as form>
<#import "/macro/alerts.ftl" as alert>

<@layout.page>
	<div class="container">
		<div class="page-header">
			<h1>${fmsg('registration.title')} <small>${fmsg('registration.subtitle')}</small></h1>
		</div>

		<h2>${fmsg('registration.validation.title')}</h2>
		<ul>
			<li>${fmsg('registration.validation.email.regex')}</li>
			<li>${fmsg('registration.validation.email.forbidden')}</li>
			<li>${fmsg('registration.validation.password.length')}</li>
			<li>${fmsg('registration.validation.password.duplicate')}</li>
		</ul>
		
		<h2>${fmsg('registration.form.title')}</h2>
		<form class="well form-horizontal" action="${furl('/register')}" method="post">
				<@form.bind "registrationForm.email" />
				<div class="form-group ${form.onErrors('has-error')}"> 
					<label for="email" class="col-lg-2 control-label">${fmsg('registration.email.label')}</label>
					<div class="col-lg-10">
						<input id="email" name="${form.status.expression}" type="text" class="form-control" value="${registrationForm.email!''}" placeholder="${fmsg('registration.email.placeholder')}"/>
						<@form.printErrors/>
					</div>
				</div>
				<@form.bind "registrationForm.password" /> 
				<div class="form-group ${form.onErrors('has-error')}"> 
					<label for="password" class="col-lg-2 control-label">${fmsg('registration.password.label')}</label>
					<div class="col-lg-10">
						<input id="password" name="${form.status.expression}" type="password" class="form-control" value="${registrationForm.password!''}" placeholder="${fmsg('registration.password.placeholder')}"/>
						<@form.printErrors/>
					</div>
				</div>
				<@form.bind "registrationForm.repeatedPassword" />
				<div class="form-group ${form.onErrors('has-error')}"> 
					<label for="password-repeated" class="col-lg-2 control-label">${fmsg('registration.repeatedPassword.label')}</label>
					<div class="col-lg-10"> 
						<input id="password-repeated" name="${form.status.expression}" type="password" class="form-control" value="${registrationForm.repeatedPassword!''}" placeholder="${fmsg('registration.repeatedPassword.placeholder')}"/>
						<@form.printErrors/>
					</div>
				</div>
				<#if alerts??>
					<div class="form-group">
						<div class="col-lg-offset-2 col-lg-8">
							<@alert.struct alerts/>
						</div>
					</div> 
				</#if>
				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-4">
						<button type="submit" class="btn btn-primary">${fmsg('registration.submit')}</button>
					</div>
				</div>
			</form>
	</div>
</@layout.page>