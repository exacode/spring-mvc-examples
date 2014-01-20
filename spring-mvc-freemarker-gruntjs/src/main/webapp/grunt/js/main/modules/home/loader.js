require(['angular', 'modules/home/home-ctrl'], function (ng) {
	'use strict';
	require(['domReady!'], function (document) {
		console.log('Loading: HomeApp');
		ng.bootstrap(document, ['HomeApp']);
		console.log('Loaded: HomeApp');
	});
});