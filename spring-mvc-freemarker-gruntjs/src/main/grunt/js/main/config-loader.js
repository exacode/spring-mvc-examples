/**
 *  Manually sets requireJS configuration.
 *  Note that there is no need of 'ng-app' html attribute anymore. 
 *  
 *  The separation between config.js and config-loader.js is needed to reuse config.js in tests and in gruntfile.js.
 */
define(['./config'], function(config) {
	'use strict';
	
	// apply config to require
	window.require.config(config);

});