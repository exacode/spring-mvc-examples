define(['./module'], function (controllers) {
	

	controllers.controller('HomeCtrl', function ($scope) {
		$scope.multiply = function(a, b) {
			return a * b;
		};
	});
});