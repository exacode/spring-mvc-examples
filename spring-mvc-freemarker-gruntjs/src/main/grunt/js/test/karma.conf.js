/* globals module */

// Karma configuration to test application source files
module.exports = function (config) {
	'use strict';

	config.set({

		files: [
			'js/test/tests.js',
			{
				pattern: 'lib/jasmine-matchers/dist/jasmine-matchers.js',
				included: true
			},
			// {
			// 	pattern: 'js/test/modules/**/*.map',
			// 	included: false
			// },
			{
				pattern: 'js/test/modules/**/*.js',
				included: false
			},
			{
				pattern: 'js/main/**/*.js',
				included: false
			},
			// {
			// 	pattern: 'js/main/**/*.map',
			// 	included: false
			// },
			{
				pattern: 'lib/**/*.js',
				included: false
			},
			{
				pattern: 'lib/**/*.map',
				included: false
			}
		],

		exclude: [
			'lib/**/*spec.js',
			'js/main/config-loader.js'
		],

		browsers:['PhantomJS'], // Chrome, ChromeCanary, Firefox, IE (only Windows), Opera, PhantomJS, Safari (only Mac)
		reporters: ['dots'],


		port: 9876,
		runnerPort: 9100,
		colors: true,
		frameworks: ['jasmine', 'requirejs'],
		logLevel: config.LOG_INFO,
		captureTimeout: 60000,
		reportSlowerThan: 500,
		singleRun: true,
		basePath: '../../'
	});
};