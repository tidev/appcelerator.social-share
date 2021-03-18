const socialshare = require('appcelerator.socialshare');

const itemSource = socialshare.createActivityItemSource({
	contentType: socialshare.Content_Type_String
});
itemSource.fetchItem = function () {
	return 'dummy value';
};
itemSource.fetchPlaceholderItem = function () {
	return 'dummy value';
};
itemSource.fetchSubject = function () {
	return 'dummy value';
};
itemSource.fetchDataTypeIdentifier = function () {
	return 'dummy value';
};
itemSource.fetchThumbnailImage = function () {
	return 'dummy value';
};

describe('appcelerator.ActivityItemSource', function () {
	it('can be required', () => {
		expect(itemSource).toBeDefined();
	});

	describe('properties', () => {
		it('should have valid contentType', () => {
			expect(itemSource.contentType).toEqual(jasmine.any(String));
		});

		it('should have valid fetchPlaceholderItem', () => {
			expect(itemSource.fetchPlaceholderItem).toEqual(jasmine.any(Function));
		});

		it('should have valid fetchItem', () => {
			expect(itemSource.fetchItem).toEqual(jasmine.any(Function));
		});

		it('should have valid fetchSubject', () => {
			expect(itemSource.fetchSubject).toEqual(jasmine.any(Function));
		});

		it('should have valid fetchDataTypeIdentifier', () => {
			expect(itemSource.fetchDataTypeIdentifier).toEqual(jasmine.any(Function));
		});

		it('should have valid fetchThumbnailImage', () => {
			expect(itemSource.fetchThumbnailImage).toEqual(jasmine.any(Function));
		});
	});

});
