define(['./module'], function (controllers) {
	'use strict';

	controllers.controller('HomeCtrl', function ($scope) {
		$scope.twoTimesTwo = 2 * 2;
	});
});