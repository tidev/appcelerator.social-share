/**
 * Appcelerator Titanium Mobile - Social Share Module
 * Copyright (c) 2021 by Axway, Inc. All Rights Reserved.
 * Proprietary and Confidential - This source code is not for redistribution
 */

import UIKit
import TitaniumKit

class TiActivityItemSource: NSObject, UIActivityItemSource {
    weak var proxy: TiActivityItemSourceProxy!

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        if let block = proxy?.fetchPlaceholderItem {
            let result = block.call([], thisObject: proxy)
            if let result = result as? TiBlob {
                return TiShareUtils.blobToImage(object: result)
            }
            if let result = result as? String {
                return result
            }
        }
        return UIImage()
    }

    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        if let block = proxy?.fetchItem {
            var arg: [[String: Any]] = []
            if let activityType = activityType {
                arg.append(["activityType": activityType.rawValue])
            }
            let result = block.call(arg, thisObject: proxy)
            let item = TiShareUtils.convertToNativeItem(contentType: proxy._contentType, item: result)
            return item ?? nil
        }
        return nil
    }

    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        guard let block = proxy?.fetchSubject else {
            return ""
        }
        var arg: [[String: Any]] = []
        if let activityType = activityType {
            arg.append(["activityType": activityType.rawValue])
        }
        if let result = block.call(arg, thisObject: proxy) as? String {
            return result
        }
        return ""
    }

    func activityViewController(_ activityViewController: UIActivityViewController, dataTypeIdentifierForActivityType activityType: UIActivity.ActivityType?) -> String {
        guard let block = proxy?.fetchDataTypeIdentifier else {
            return ""
        }
        var arg: [[String: Any]] = []
        if let activityType = activityType {
            arg.append(["activityType": activityType.rawValue])
        }
        if let result = block.call(arg, thisObject: proxy) as? String {
            return result
        }
        return ""
    }

    func activityViewController(_ activityViewController: UIActivityViewController, thumbnailImageForActivityType activityType: UIActivity.ActivityType?, suggestedSize size: CGSize) -> UIImage? {
        guard let block = proxy?.fetchSubject else {
            return UIImage()
        }
        var arg: [[String: Any]] = []
        var object: [String: Any] = ["width": NSNumber(value: Float(size.width)), "height": NSNumber(value: Float(size.height))]
        if let activityType = activityType {
            object["activityType"] = activityType.rawValue
        }
        arg.append(object)
        if let result = block.call(arg, thisObject: proxy) as? TiBlob {
            return result.image() ?? UIImage()
        }
        return UIImage()
    }
}
