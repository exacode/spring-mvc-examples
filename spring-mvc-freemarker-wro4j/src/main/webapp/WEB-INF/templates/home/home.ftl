<@layout.page>
	<div class="container">
		<div class="row">
			<div class="span4">
				<h1>
					<a href="${furl('/')}">
						<img title="eDemokracja" alt="eDemokracja" src="${furl('/resources/img/logo.png')}" />
					</a>
				</h1>
			</div>
			<div class="span8" class="slogan">
				<h2>
					Platforma dla osób chcących zmienić kraj na lepszy <small>Wywieraj wpływ, zdobywaj informacje, znajdź sojuszników</small>
				</h2>
			</div>
		</div>
	</div>
	<div class="wide-panel page-carousel-panel">
		<div class="container">
			<div id="frontCarousel" class="carousel slide autostart" data-interval="7500">
				<ol class="carousel-indicators">
					<li data-target="#frontCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#frontCarousel" data-slide-to="1"></li>
					<li data-target="#frontCarousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<#assign placeHolderSrc="http://placehold.it/234x67&text=+"/>
					<#assign imgHeight=335 />
					<#assign imgWidth=1170 />
					<div class="item active">
						<#assign imgTitle="Jan Matejko: Stańczyk"/>
						<@misc.lazyImg src="${furl('/resources/img/front/stanczyk.jpg')}" title="${imgTitle}" alt="${imgTitle}" width="${imgWidth?c}" height="${imgHeight?c}"/>
						<div class="carousel-pane  carousel-fade-out">
							<div class="carousel-inner-pane">
								<h4>Myśl...</h4>
							</div>
						</div>
						<div class="carousel-caption carousel-fade-in">
							<h4>
								Jan Matejko: <em><a href="http://pl.wikipedia.org/wiki/Sta%C5%84czyk_(obraz_Jana_Matejki)">Stańczyk</a></em>
							</h4>
						</div>
					</div>
					<div class="item">
						<#assign imgTitle="Jan Matejko: Bitwa pod Grunwaldem"/>
						<@misc.lazyImg src="${furl('/resources/img/front/grunwald.jpg')}" title="${imgTitle}" alt="${imgTitle}" width="${imgWidth?c}" height="${imgHeight?c}"/>
						<div class="carousel-pane  carousel-fade-out">
							<div class="carousel-inner-pane">
								<h4>Walcz...</h4>
							</div>
						</div>
						<div class="carousel-caption carousel-fade-in">
							<h4>
								Jan Matejko: <em><a href="http://pl.wikipedia.org/wiki/Bitwa_pod_Grunwaldem_(obraz_Jana_Matejki)">Bitwa pod Grunwaldem</a></em>
							</h4>
						</div>
					</div>
					<div class="item">
						<#assign imgTitle="Jan Matejko: Konstytucja 3 Maja 1791 roku"/>
						<@misc.lazyImg src="${furl('/resources/img/front/konstytucja-3-maja.jpg')}" title="${imgTitle}" alt="${imgTitle}" width="${imgWidth?c}" height="${imgHeight?c}"/>
						<div class="carousel-pane  carousel-fade-out">
							<div class="carousel-inner-pane">
								<h4>Zwyciężaj!</h4>
							</div>
						</div>
						<div class="carousel-caption carousel-fade-in">
							<h4>
								Jan Matejko: <em><a href="http://pl.wikipedia.org/wiki/Konstytucja_3_Maja_1791_roku">Konstytucja 3 Maja 1791 roku</a></em>
							</h4>
						</div>
					</div>
				</div>
				<a class="left carousel-control carousel-fade-in" href="#frontCarousel" data-slide="prev">&lsaquo;</a> <a class="right carousel-control carousel-fade-in" href="#frontCarousel" data-slide="next">&rsaquo;</a>
			</div>
		</div>
	</div>
	<div class="container text-center">
		<div class="row">
			<div class="span4 panel">
				<h3><i class="icon-file-alt"></i> <a href="${furl('/petitions')}">Petycje</a></h3>
				<p>
					<strong>Chciałbyś coś zmienić?</strong> 
					Kwestia ta dotyczy większej grupy ludzi? 
					Wiesz na kogo należy wywrzeć wpływ aby rozwiązać problem?
				</p>
				<p>
					<strong>Napisz wirtualną petycję!</strong> 
					Napisz oficjalną treść petycji, określ jej adresatów i zachęć innych do jej podpisania. 
					Za każdym razem gdy ktoś podpiszę się pod petycją, jej adresat otrzyma informujący o tym e-mail.
				</p>
				<p>
					<strong>Myślisz, że to strata czasu? Zastanów się.</strong> 
					Jesteś osobą publiczną i otrzymujesz setki petycji od obywateli 
					i wiesz że petycja ta jest publicznie dostępna. 
					Czy nie zastanowiłbyś się nad jej treścią?
				</p>
			</div>
			<div class="span4 panel">
				<h3><i class="icon-question-sign"></i> <a href="${furl('/questions')}">Pytania Społeczne</a></h3>
				<p>
					<strong>Mamy prawo do dużo większej ilości informacji</strong> 
					niż te oferowane przez media. 
					W tej kwestii wspiera nas 
					<a href="http://www.bip.gov.pl/articles/view/41">Ustawa o dostępnie do informacji publicznej</a>.
				</p>
				<p>
					<strong>Zadaj społecznościwe pytanie dowolnej osobie</strong>. 
					Raz uzyskana informacja będzie publicznie dostępna. 
					Kłamstwo lub niedopowiedzenie będzie łatwiejsze do wykrycia. 
					Pytaj i pomóż innym znajdować odpowiedzi.
				</p>
			</div>
			<div class="span4 panel">
				<h3><i class="icon-bar-chart"></i> <a href="${furl('/votings')}">Głosowania</a></h3>
				<p>
					<strong>Referendum jest idealnym narzędziem demokracji.</strong> 
					Szkoda, że w skali całego narodu nie można go efektywnie wykorzystać. 
					Przeszkodą jest czas, pieniądze, frekwencja.
				</p>
				<p>
					<strong>Przeprowadź wirtualne referendum.</strong> 
					Może dotyczyć dowolnych kwesti. 
					Wykorzystaj to jako narzędzie do badania nastroju społecznego. 
					Znajdź swoją grupę społeczną i wraz z nią zmień kraj na lepsze!
				</p>
			</div>
		</div>
	</div>
</@layout.page>