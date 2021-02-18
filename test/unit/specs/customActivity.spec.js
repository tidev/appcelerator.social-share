const SocialShare = require('appcelerator.socialshare');
var newBuffer = Ti.createBuffer({ length: 10 });
var newBlob = newBuffer.toBlob();
const customActivity = SocialShare.createCustomActivity({
	title: 'Test Activity',
	type: 'test',
	category: 1,
	image: newBlob
});

describe('appcelerator.CustomActivity', function () {
	it('can be required', () => {
		expect(customActivity).toBeDefined();
	});

	describe('properties', () => {
		it('should have valid title', () => {
			expect(customActivity.title).toEqual(jasmine.any(String));
		});

		it('should have valid image', () => {
			expect(customActivity.image).toEqual(jasmine.any(Object));
		});

		it('should have valid category', () => {
			expect(customActivity.category).toEqual(jasmine.any(Number));
		});

		it('should have valid type', () => {
			expect(customActivity.type).toEqual(jasmine.any(String));
		});
	});

});
