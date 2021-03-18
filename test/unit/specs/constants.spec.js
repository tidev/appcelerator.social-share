const socialshare = require('appcelerator.socialshare');

describe('appcelerator.socialshare', function () {
	describe('Content_Type_*', () => {
		it('Content_Type_Image', () => {
			expect(socialshare.Content_Type_Image).toEqual(jasmine.any(String));
		});

		it('Content_Type_URL', () => {
			expect(socialshare.Content_Type_URL).toEqual(jasmine.any(String));
		});

		it('Content_Type_String', () => {
			expect(socialshare.Content_Type_String).toEqual(jasmine.any(String));
		});

		it('Content_Type_Data', () => {
			expect(socialshare.Content_Type_Data).toEqual(jasmine.any(String));
		});
	});

	describe('Activity_Category_*', () => {
		it('Activity_Category_Action', () => {
			expect(socialshare.Activity_Category_Action).toEqual(jasmine.any(Number));
		});

		it('Activity_Category_Share', () => {
			expect(socialshare.Activity_Category_Share).toEqual(jasmine.any(Number));
		});
	});

	describe('Activity_Type_*', () => {
		it('Activity_Type_Post_To_Facebook', () => {
			expect(socialshare.Activity_Type_Post_To_Facebook).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Post_To_Twitter', () => {
			expect(socialshare.Activity_Type_Post_To_Twitter).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Post_To_Weibo', () => {
			expect(socialshare.Activity_Type_Post_To_Weibo).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Message', () => {
			expect(socialshare.Activity_Type_Message).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Mail', () => {
			expect(socialshare.Activity_Type_Mail).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Print', () => {
			expect(socialshare.Activity_Type_Print).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Copy_To_Pasteboard', () => {
			expect(socialshare.Activity_Type_Copy_To_Pasteboard).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Assign_To_Contact', () => {
			expect(socialshare.Activity_Type_Assign_To_Contact).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Save_To_CameraRoll', () => {
			expect(socialshare.Activity_Type_Save_To_CameraRoll).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Add_To_ReadingList', () => {
			expect(socialshare.Activity_Type_Add_To_ReadingList).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Post_To_Flickr', () => {
			expect(socialshare.Activity_Type_Post_To_Flickr).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Post_To_Vimeo', () => {
			expect(socialshare.Activity_Type_Post_To_Vimeo).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Post_To_TencentWeibo', () => {
			expect(socialshare.Activity_Type_Post_To_TencentWeibo).toEqual(jasmine.any(String));
		});

		it('Activity_Type_AirDrop', () => {
			expect(socialshare.Activity_Type_AirDrop).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Open_In_IBooks', () => {
			expect(socialshare.Activity_Type_Open_In_IBooks).toEqual(jasmine.any(String));
		});

		it('Activity_Type_Markup_As_PDF', () => {
			expect(socialshare.Activity_Type_Markup_As_PDF).toEqual(jasmine.any(String));
		});
	});
});

