<@layout.page>
	<div class="container">
		<div class="text-center text-danger">
			<div class="page-header">
				<h1>${fmsg('error.' + errorCode + '.title')} <span class="glyphicon glyphicon-exclamation-sign"></span></h1>
			</div>
			<p class="lead">${fmsg('error.' + errorCode + '.content')}</p>
		</div> 
	</div>
</@layout.page>