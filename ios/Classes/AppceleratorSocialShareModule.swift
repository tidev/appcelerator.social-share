/**
 * Appcelerator Titanium Mobile - Social Share Module
 * Copyright (c) 2021 by Axway, Inc. All Rights Reserved.
 * Proprietary and Confidential - This source code is not for redistribution
 */

import UIKit
import TitaniumKit

/**

 Titanium Swift Module Requirements
 ---

 1. Use the @objc annotation to expose your class to Objective-C (used by the Titanium core)
 2. Use the @objc annotation to expose your method to Objective-C as well.
 3. Method arguments always have the "[Any]" type, specifying a various number of arguments.
 Unwrap them like you would do in Swift, e.g. "guard let arguments = arguments, let message = arguments.first"
 4. You can use any public Titanium API like before, e.g. TiUtils. Remember the type safety of Swift, like Int vs Int32
 and NSString vs. String.

 */

@objc(AppceleratorSocialshareModule)
class AppceleratorSocialshareModule: TiModule {

    public let testProperty: String = "Hello World"

    func moduleGUID() -> String {
        return "73cd88a7-59c4-4d1f-a70b-568ae2cc5ecc"
    }

    override func moduleId() -> String! {
        return "appcelerator.socialshare"
    }

    override func startup() {
        super.startup()
        debugPrint("[DEBUG] \(self) loaded")
    }

    @objc(example:)
    func example(arguments: [Any]?) -> String? {
        guard let arguments = arguments, let params = arguments[0] as? [String: Any] else { return nil }

        // Example method.
        // Call with "MyModule.example({ hello: 'world' })"

        return params["hello"] as? String
    }

    @objc public var exampleProp: String {
        get {
            // Example property getter
            return "Titanium rocks!"
        }
        set {
            // Example property setter
            // Call with "MyModule.exampleProp = 'newValue'"
            self.replaceValue(newValue, forKey: "exampleProp", notification: false)
        }
    }
}
