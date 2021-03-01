/**
 * Appcelerator Titanium Mobile - Social Share Module
 * Copyright (c) 2021 by Axway, Inc. All Rights Reserved.
 * Proprietary and Confidential - This source code is not for redistribution
 */

import UIKit
import TitaniumKit

@objc(AppceleratorSocialshareModule)
class AppceleratorSocialshareModule: TiModule {

    @objc public let Content_Type_Image = ActivityItemContentType.image.rawValue
    @objc public let Content_Type_URL = ActivityItemContentType.url.rawValue
    @objc public let Content_Type_String = ActivityItemContentType.string.rawValue
    @objc public let Content_Type_Data = ActivityItemContentType.data.rawValue

    @objc public let Activity_Category_Action = UIActivity.Category.action.rawValue
    @objc public let Activity_Category_Share = UIActivity.Category.share.rawValue

    func moduleGUID() -> String {
        return "73cd88a7-59c4-4d1f-a70b-568ae2cc5ecc"
    }

    override func moduleId() -> String! {
        return "appcelerator.socialshare"
    }

    @objc(createCustomActivity:)
    func createCustomActivity(arg: Any?) -> TiCustomActivityProxy? {
        let values = arg as? [Any]
        let options = values?.first as? [String: Any]
        let category = options?["category"] as? NSNumber
        let type = options?["type"] as? String
        let title = options?["title"] as? String
        let image = options?["image"] as? TiBlob

        let activity = TiCustomActivity()
        activity.title = title
        if let type = type {
            activity.type = UIActivity.ActivityType(rawValue: type)
        }
        if let image = image {
            activity.image = image.image()
        }
        if let category = category {
            TiCustomActivity.category =  UIActivity.Category(rawValue: category.intValue) ?? UIActivity.Category.share
        }
        return TiCustomActivityProxy(pageContext: self.pageContext, activity: activity)
    }

    @objc(createActivityItemSource:)
    func createActivityItemSource(arg: Any?) -> TiActivityItemSourceProxy? {
        let values = arg as? [Any]
        let options = values?.first as? [String: Any]
        guard let type = options?["contentType"] as? String,
              let contentType = ActivityItemContentType(rawValue: type) else {
            return nil
        }
        return TiActivityItemSourceProxy(pageContext: self.pageContext, contentType: contentType)
    }

    @objc(createActivityItemProvider:)
    func createActivityItemProvider(arg: Any?) -> TiActivityItemProviderProxy? {
        let values = arg as? [Any]
        let options = values?.first as? [String: Any]
        guard let type = options?["contentType"] as? String,
              let contentType = ActivityItemContentType(rawValue: type),
              let placeHolderItem =  options?["placeHolder"] else {
            return nil
        }
        var placeHolder: Any?
        if let result = placeHolderItem as? TiBlob {
            placeHolder =  TiShareUtils.blobToImage(object: result)
        }
        if let result = placeHolderItem as? String {
            placeHolder =  result
        }
        if let placeHolder = placeHolder {
            return TiActivityItemProviderProxy(pageContext: self.pageContext, contentType: contentType, placeholderItem: placeHolder)
        }
        return nil
    }
}
