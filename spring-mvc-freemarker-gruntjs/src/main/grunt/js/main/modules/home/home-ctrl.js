define(['./module'], function (controllers) {
	'use strict';

	controllers.controller('HomeCtrl', function ($scope) {
		$scope.multiply = function(a, b) {
			return a * b;
		}
	});
});