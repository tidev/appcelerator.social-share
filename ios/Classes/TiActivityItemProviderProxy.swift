/**
 * Appcelerator Titanium Mobile - Social Share Module
 * Copyright (c) 2021 by Axway, Inc. All Rights Reserved.
 * Proprietary and Confidential - This source code is not for redistribution
 */

import UIKit
import TitaniumKit

class TiActivityItemProviderProxy: TiProxy {
    var _source: TiActivityItemProvider!
    var _contentType: ActivityItemContentType!

    private override init() {
        super.init()
    }

    convenience init(pageContext: TiEvaluator, contentType: ActivityItemContentType, placeholderItem: Any) {
        self.init()
        _init(withPageContext: pageContext)
        _source = TiActivityItemProvider(placeholderItem: placeholderItem)
        _source.proxy = self
        _contentType = contentType
    }

    @objc
    var contentType: String {
        return _contentType.rawValue
    }

    @objc
    var activityType: String?

    @objc
    var fetchPlaceholderItem: KrollCallback?

    @objc
    var fetchItem: KrollCallback?
}
