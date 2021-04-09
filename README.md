# Appcelerator Social Share Module

- This module brings Social Share functionaliy into the mobile apps for titanium app developers.

## Getting Started

- Set the `<module>` element in tiapp.xml, such as this: 
``` xml
<modules>
    <module platform="ios">appcelerator.socialshare</module>
</modules>
```

- To access this module from JavaScript, you would do the following:

``` js
var socialshare = require("appcelerator.socialshare");
```
The `socialshare` variable is a reference to the Module object.

## Follow basic steps to share using activity item provider:

- Use `createActivityItemProvider` to create item provider
``` js
  const itemProvider = socialshare.createActivityItemProvider({
	  	contentType: socialshare.Content_Type_String,
		  placeHolder: 'placeholder'
	});
```
- Set `fetchItem` for `itemProvider` status
``` js
  itemProvider.fetchItem = function () {
		return 'This is Text To Share';
	};
```
- Set `activityType` for `itemProvider` status
``` js
  itemProvider.activityType = socialshare.Activity_Type_Message;
```
- Set `activityType` for `itemProvider` status
``` js
  itemProvider.activityType = socialshare.Activity_Type_Message;
```
- create `customActivity` using `createCustomActivity` if custom activity is required
``` js
	const customActivity = socialshare.createCustomActivity({
	category: socialshare.Activity_Category_Share,
		title: 'url share',
	});
```
- call `shareWithItems` for share the content status
``` js
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
```
## Follow basic steps to share using activity item source:

- Use `createActivityItemSource` to create item source
``` js
  const itemSource = socialshare.createActivityItemSource({
		contentType: socialshare.Content_Type_String
	});
```
- Set `fetchItem` for `itemSource` status
``` js
  itemSource.fetchItem = function () {
		return 'This is Text To Share';
	};
```
- Set `fetchPlaceholderItem` for `itemSource` status
``` js
	itemSource.fetchPlaceholderItem = function () {
		return 'This is Text To Share';
	};
```
- create `customActivity` using `createCustomActivity` if custom activity is required
``` js
	const customActivity = socialshare.createCustomActivity({
	category: socialshare.Activity_Category_Share,
		title: 'url share',
	});
```
- call `shareWithItems` for share the content status
``` js
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
```

## Example
- Please see the `example/` folder.

## Building

Simply run `appc run -p ios --build-only` which will compile and package your module.

Copy the module zip file into the root folder of your Titanium application or in the Titanium system folder (e.g. /Library/Application Support/Titanium).

## Author

Axway

## License

Copyright (c) 2020 by Axway, Inc. Please see the LICENSE file for further details.
