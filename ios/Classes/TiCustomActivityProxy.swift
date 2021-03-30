/**
 * Appcelerator Titanium Mobile - Social Share Module
 * Copyright (c) 2021 by Axway, Inc. All Rights Reserved.
 * Proprietary and Confidential - This source code is not for redistribution
 */

import UIKit
import TitaniumKit

class TiCustomActivityProxy: TiProxy {
    private var _activity: TiCustomActivity!

    private override init() {
        super.init()
    }

    convenience init(pageContext: TiEvaluator, activity: TiCustomActivity) {
        self.init()
        _init(withPageContext: pageContext)
        _activity = activity
    }

    @objc
    var title: String? {
        return _activity.title
    }

    @objc
    var category: NSNumber? {
        return NSNumber(value: TiCustomActivity.category.rawValue)
    }

    @objc
    var image: TiBlob? {
        return TiBlob(image: _activity.image)
    }

    @objc
    var type: String? {
        return _activity.type?.rawValue
    }

    func activity() -> TiCustomActivity {
        return _activity
    }

}
