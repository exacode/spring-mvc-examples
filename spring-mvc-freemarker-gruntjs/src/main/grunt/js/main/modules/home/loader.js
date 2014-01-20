require(['angular', 'modules/home/home-ctrl'], function (ng) {
	'use strict';
	require(['domReady!'], function (document) {
		console.log('Loading module: HomeApp');
		ng.bootstrap(document, ['HomeApp']);
		console.log('Loaded module: HomeApp');
	});
});