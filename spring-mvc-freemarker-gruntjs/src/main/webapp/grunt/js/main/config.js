if (typeof define !== 'function') {
	// To load below configuration from node.js (used in gruntfile.js)
	var define = require('amdefine')(module);
}

define({

	paths: {
		// Basic module dependencies
		'jquery': '../../lib/jquery/jquery',
		'bootstrap': '../../lib/sass-bootstrap/dist/js/bootstrap',
		// Common module dependencies
		'domReady': '../../lib/requirejs-domready/domReady',
		'angular': '../../lib/angular/angular',
		'underscore': '../../lib/underscore/underscore',
		// Additional dependencies
		'angular-resource': '../../lib/angular-resource/angular-resource'
	},

	shim: {
		'angular': {
			exports: 'angular'
		},
		'angular-resource': ['angular'],
		'underscore': {
			exports: 'underscore'
		},
	},

	baseUrl: 'assets/js'

});