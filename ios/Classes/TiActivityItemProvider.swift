/**
 * Appcelerator Titanium Mobile - Social Share Module
 * Copyright (c) 2021 by Axway, Inc. All Rights Reserved.
 * Proprietary and Confidential - This source code is not for redistribution
 */

import UIKit
import TitaniumKit

class TiActivityItemProvider: UIActivityItemProvider {
    weak var proxy: TiActivityItemProviderProxy!
    private var placeholder: Any?

    override init(placeholderItem: Any) {
        super.init(placeholderItem: placeholderItem)
        self.placeholder = placeholderItem
    }

    override var placeholderItem: Any? {
        if let block = proxy?.fetchPlaceholderItem {
            let result = block.call([], thisObject: proxy)
            if let result = result as? TiBlob {
                return result.image()
            }
            if let result = result as? String {
                return result
            }
        }
        return self.placeholder
    }

    override var activityType: UIActivity.ActivityType? {
        if let activityType = proxy.activityType {
            return UIActivity.ActivityType(rawValue: activityType)
        }
        return nil
    }

    override var item: Any {
        guard let block = proxy?.fetchItem else {
            return "Error"
        }
        var item: Any?
        DispatchQueue.main.sync {
            var arg: [[String: Any]] = []
            if let activityType = activityType {
                arg.append(["activityType": activityType.rawValue])
            }
            let result = block.call(arg, thisObject: proxy)
            item = TiShareUtils.convertToNativeItem(contentType: proxy._contentType, item: result)
        }
        return item ?? "Error"
    }
}
