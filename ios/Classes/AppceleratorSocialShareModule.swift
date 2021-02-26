/**
 * Appcelerator Titanium Mobile - Social Share Module
 * Copyright (c) 2021 by Axway, Inc. All Rights Reserved.
 * Proprietary and Confidential - This source code is not for redistribution
 */

import UIKit
import TitaniumKit

@objc(AppceleratorSocialshareModule)
class AppceleratorSocialshareModule: TiModule {

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
}
