/**
 *  Wraps the definition of the top-level app module 
 *  and loads the dependencies of its submodules.
 */
define([
	'angular',
	'./modules/home/index',
], function (ng) {
	

	return ng.module('application', [
		'HomeApp'
	]);
});