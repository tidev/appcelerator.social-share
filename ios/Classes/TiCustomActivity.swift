/**
 * Appcelerator Titanium Mobile - Social Share Module
 * Copyright (c) 2021 by Axway, Inc. All Rights Reserved.
 * Proprietary and Confidential - This source code is not for redistribution
 */

import UIKit

class TiCustomActivity: UIActivity {
    var title: String?
    var image: UIImage?
    var type: UIActivity.ActivityType?
    static var category: UIActivity.Category = UIActivity.Category.share

    var items: [Any] = []

    override class var activityCategory: UIActivity.Category {
        return category
    }

    override var activityType: UIActivity.ActivityType? {
        return type
    }

    override var activityTitle: String? {
        return title
    }

    override var activityImage: UIImage? {
        return image
    }

    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return activityItems.count > 0
    }
    override func prepare(withActivityItems activityItems: [Any]) {
        items = activityItems
    }
}
