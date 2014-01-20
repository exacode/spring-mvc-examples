/**
 *  Manually bootstraps AngularJS.
 *  Note that there is no need of 'ng-app' html attribute anymore. 
 *  
 *  Defines global dependencies (like: 'require' and 'angular').
 *  No module shuold load before global dependency.
 */
define(['require', 'angular', './application'], function(require, ng) {
	'use strict';
	
	// Start app only when the DOM is ready
	require(['domReady!'], function (document) {
		ng.bootstrap(document, ['application']);
	});

});