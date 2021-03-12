/* eslint-disable no-alert */

var socialshare = require('appcelerator.socialshare');
var mainWindow = Ti.UI.createWindow({
	backgroundColor: 'White',
	titleAttributes: { color: 'blue' }
});
var navCentralWindow = Ti.UI.createNavigationWindow({
	window: mainWindow
});
var itemProvider = Ti.UI.createButton({
	font: { fontSize: 20 },
	title: 'Share Using Activity Item Provider',
	top: 80
});

itemProvider.addEventListener('click', function () {
	const itemProvider = socialshare.createActivityItemProvider({
		contentType: socialshare.Content_Type_String,
		placeHolder: 'placeholder',
		activityType: socialshare.Activity_Type_Post_To_Facebook
	});
	global.itemProvider = itemProvider;
	itemProvider.fetchItem = function () {
		return 'This is Text To Share';
	};
	itemProvider.activityType = socialshare.Activity_Type_Message;
	const customActivity = socialshare.createCustomActivity({
		category: socialshare.Activity_Category_Share,
		title: 'url share',
	});
	global.customActivity = customActivity;
	socialshare.shareWithItems({
		activityItems: [ itemProvider ],
		activities: [ customActivity ],
		completionWithItemsHandler: function (e) {
			if (e.errorCode !== null || e.errorDomain !== null || e.errorDescription !== null) {
				alert('Error Occured: ' + e.errorDescription);
				return;
			}
		}
	});
});
mainWindow.add(itemProvider);

var itemSource = Ti.UI.createButton({
	font: { fontSize: 20 },
	title: 'Share using Item Source',
	top: 140,
});
itemSource.addEventListener('click', function () {
	const itemSource = socialshare.createActivityItemSource({
		contentType: socialshare.Content_Type_String
	});
	global.itemSource = itemSource;
	itemSource.fetchItem = function () {
		return 'This is Text To Share';
	};
	itemSource.fetchPlaceholderItem = function () {
		return 'This is Text To Share';
	};
	const customActivity = socialshare.createCustomActivity({
		category: socialshare.Activity_Category_Share,
		title: 'url share',
	});
	global.customActivity1 = customActivity;
	socialshare.shareWithItems({
		activityItems: [ itemSource ],
		activities: [ customActivity ],
		completionWithItemsHandler: function (e) {
			if (e.errorCode !== null || e.errorDomain !== null || e.errorDescription !== null) {
				alert('Error Occured: ' + e.errorDescription);
				return;
			}
		}
	});
});
mainWindow.add(itemSource);

navCentralWindow.open();
