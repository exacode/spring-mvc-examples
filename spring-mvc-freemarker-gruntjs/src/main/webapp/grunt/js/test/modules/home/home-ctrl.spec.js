define([
	'angular-mocks',
	'MAIN/modules/home/home-ctrl'
], function () {
	'use strict';

	describe('HomeCtrl in app.home', function () {

		var scope, subject;

		beforeEach(function () {

			module('HomeApp');

			inject(function ($rootScope, $controller) {
				scope = $rootScope.$new();
				subject = $controller('HomeCtrl', { $scope: scope });
			});
		});

		describe('check if controller is on it\'s place', function () {
			it('should have loaded the subject', function () {
				expect(subject).toBeDefined();
			});
		});

		describe('check if scope is also on it\'s place', function () {
			it('should test scope to be defined', function () {
				expect(scope).toBeDefined();
			});
		});

		describe('check custom jasmine matchers enabled', function () {
			it('should check that toBeArrayOfSize(int) exists', function () {
				expect([1, 2, 3]).toBeArrayOfSize(3);
			});
		});

		describe('check controller logic', function () {
			it('should multiply two values', function () {
				expect(scope.multiply(2, 2)).toBe(4);
			});
		});

	});
});