

define({

	paths: {
		// Basic module dependencies
		'jquery': '../../lib/jquery/jquery',
		'bootstrap': '../../lib/sass-bootstrap/dist/js/bootstrap',
		'underscore': '../../lib/underscore/underscore',
		// Common module dependencies
		'domReady': '../../lib/requirejs-domready/domReady',
		'angular': '../../lib/angular/angular',
		// Additional dependencies
		'angular-resource': '../../lib/angular-resource/angular-resource'
	},

	shim: {
		'angular': {
			exports: 'angular'
		},
		'angular-resource': ['angular'],
		'underscore': {
			exports: '_'
        },
	},

});