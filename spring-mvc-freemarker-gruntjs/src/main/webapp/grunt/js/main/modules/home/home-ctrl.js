define(['./module'], function (module) {
	'use strict';

	module.controller('HomeCtrl', function ($scope) {
		$scope.multiply = function(a, b) {
			return a * b;
		};
		$scope.random = Math.random();
	});
});