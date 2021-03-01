/**
 * Appcelerator Titanium Mobile - Social Share Module
 * Copyright (c) 2021 by Axway, Inc. All Rights Reserved.
 * Proprietary and Confidential - This source code is not for redistribution
 */

import UIKit
import TitaniumKit

class TiShareUtils {
    static func convertToNativeItem(contentType: ActivityItemContentType?, item: Any?) -> Any? {
        switch contentType {
        case .image:
            if let result = item as? TiBlob {
                return result.image()
            }
        case .string:
            if let result = item as? String {
                return result
            }
        case .url:
            if let result = item as? String {
                return URL(string: result)
            }
        case .data:
            if let result = item as? TiBlob {
                return result.data()
            }
        case .none:
            return nil
        }
        return nil
    }
}
