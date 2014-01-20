// Karma configuration to test application source files
module.exports = function (config) {
	'use strict';

	var project = {
		lib: '../lib'
	};

	config.set({

		files: [
			'tests.js',
			{
				pattern: project.lib + '/jasmine-matchers/dist/jasmine-matchers.js',
				included: true
			},
			{
				pattern: '/**/*.js',
				included: false
			},
			{
				pattern: '/**/*.map',
				included: false
			},
			{
				pattern: project.lib + '/**/*.js',
				included: false
			},
			{
				pattern: project.lib + '/**/*.map',
				included: false
			},
		],

		exclude: [
			project.lib + '/**/*spec.js'
		],

		browsers:['PhantomJS'], // Chrome, ChromeCanary, Firefox, IE (only Windows), Opera, PhantomJS, Safari (only Mac)

		reporters: ['dots'],


		port: 9876,
		runnerPort: 9100,
		colors: true,
		frameworks: ['jasmine', 'requirejs'],
		logLevel: config.LOG_INFO,
		autoWatch: false,
		captureTimeout: 60000,
		singleRun: false,
		reportSlowerThan: 500,
		basePath: './'
	});
};