/**
 * Appcelerator Titanium Mobile - Social Share Module
 * Copyright (c) 2021 by Axway, Inc. All Rights Reserved.
 * Proprietary and Confidential - This source code is not for redistribution
 */

import UIKit
import TitaniumKit

enum ActivityItemContentType: String {
    case string
    case image
    case url
    case data
}

class TiActivityItemSourceProxy: TiProxy {
    var _contentType: ActivityItemContentType!
    var _source: TiActivityItemSource!

    private override init() {
        super.init()
    }

    convenience init(pageContext: TiEvaluator, contentType: ActivityItemContentType) {
        self.init()
        _init(withPageContext: pageContext)
        _contentType = contentType
        _source = TiActivityItemSource()
        _source.proxy = self
    }

    @objc
    var contentType: String {
        return _contentType.rawValue
    }

    @objc
    var fetchPlaceholderItem: KrollCallback?

    @objc
    var fetchItem: KrollCallback?

    @objc
    var fetchSubject: KrollCallback?

    @objc
    var fetchDataTypeIdentifier: KrollCallback?

    @objc
    var fetchThumbnailImage: KrollCallback?

}
