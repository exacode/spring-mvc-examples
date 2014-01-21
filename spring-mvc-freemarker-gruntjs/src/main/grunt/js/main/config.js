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
		'lodash': '../../lib/lodash/dist/lodash',
		// Additional dependencies
		'angular-resource': '../../lib/angular-resource/angular-resource'
	},

	shim: {
		'angular': {
			exports: 'angular'
		},
		'angular-resource': ['angular'],
		"bootstrap": {
			deps: ["jquery"],
			exports: "$.fn.popover"
		}
	},

	baseUrl: 'grunt/js/main'

});