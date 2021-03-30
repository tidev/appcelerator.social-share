const SocialShare = require('appcelerator.socialshare');

describe('appcelerator.socialshare', function () {
	it('can be required', () => {
		expect(SocialShare).toBeDefined();
	});

	it('should have createCustomActivity function', () => {
		expect(SocialShare.createCustomActivity).toEqual(jasmine.any(Function));
	});

	it('should have createActivityItemSource function', () => {
		expect(SocialShare.createActivityItemSource).toEqual(jasmine.any(Function));
	});

	it('should have createActivityItemProvider function', () => {
		expect(SocialShare.createActivityItemProvider).toEqual(jasmine.any(Function));
	});

	it('should have shareWithItems function', () => {
		expect(SocialShare.shareWithItems).toEqual(jasmine.any(Function));
	});
});
