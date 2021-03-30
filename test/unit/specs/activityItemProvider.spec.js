const socialshare = require('appcelerator.socialshare');

const itemProvider = socialshare.createActivityItemProvider({
	contentType: socialshare.Content_Type_String,
	placeHolder: 'placeholder',
	activityType: socialshare.Activity_Type_Post_To_Facebook
});
itemProvider.fetchItem = function () {
	return 'dummy item';
};
itemProvider.fetchPlaceholderItem = function () {
	return 'dummy placeholder';
};
itemProvider.activityType = 'test';

describe('appcelerator.ActivityItemProvider', function () {
	it('can be required', () => {
		expect(itemProvider).toBeDefined();
	});

	describe('properties', () => {
		it('should have valid contentType', () => {
			expect(itemProvider.contentType).toEqual(jasmine.any(String));
		});

		it('should have valid activityType', () => {
			expect(itemProvider.activityType).toEqual(jasmine.any(String));
		});

		it('should have valid fetchPlaceholderItem', () => {
			expect(itemProvider.fetchPlaceholderItem).toEqual(jasmine.any(Function));
		});

		it('should have valid fetchItem', () => {
			expect(itemProvider.fetchItem).toEqual(jasmine.any(Function));
		});
	});

});
