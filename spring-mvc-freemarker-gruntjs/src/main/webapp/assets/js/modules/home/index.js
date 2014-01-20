
define('modules/home/module',['angular'], function (ng) {
	
	
	return ng.module('HomeApp',[]);
});
define('modules/home/home-ctrl',['./module'], function (controllers) {
	

	controllers.controller('HomeCtrl', function ($scope) {
		$scope.multiply = function(a, b) {
			return a * b;
		};
	});
});
define('modules/home/index',['./home-ctrl'], function () {
	
});