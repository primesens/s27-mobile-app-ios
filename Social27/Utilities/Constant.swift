//
//  Constant.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-10.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
    
    // Manage app environment with release type
    static let appEnvironment: DeploymentEnvironment = .development
    
    enum DeploymentEnvironment: String {

        case development = "https://pro-es-user.social27.com"
        case staging = "https:"
        case production = "https://"
    }
    
    static func getCustomHeaders() -> [String: String] {
        return ["x-api-key": Constant.APIKeys.RESTful, "Accept" : "application/json"]
    }
    
    enum APIKeys {
        static let RESTful = Constant.getAPIKey()
        static let googleMap = "AIzaSyAWBpYdXWTp0OzIvSNIB08d3414nYvA3Pc"
    }
    
    static func getAPIKey() -> String {
        switch Constant.appEnvironment {
        case .development:
             return ""
        case .staging:
            return ""
        case .production:
            return ""
        }
    }
    
    static func getSharedAppSecret() -> String {
        return "46ec9c5beefb461a86d5a9e0ee56d5bf"
    }
    
    static func getReciptValidationUrl() -> String {
        
        // Receipt Validation Url for In-app Purchase
        
        switch Constant.appEnvironment {
        case .development:
            return "https://sandbox.itunes.apple.com/verifyReceipt"
        case .staging:
            return "https://sandbox.itunes.apple.com/verifyReceipt"
        case .production:
            return "https://buy.itunes.apple.com/verifyReceipt"
        }
    }
    
    enum Counts {
        static let passwordCount = 8
        static let nameMinimumCharCount = 2
    }
    
    enum AppDetails {
        static let termsUrl = "ht"
        static let privacyUrl = "http"
        static let aboutUrl = "ht"
    }
    
    enum Notification {
        static let ChangedTabBarIndex = NSNotification.Name(rawValue: "ChangedTabBarIndex")
        static let PushNotificationBadgeCountChange = NSNotification.Name(rawValue: "PushNotificationBadgeCountChange")
        static let didReceiveNotification = NSNotification.Name("didReceiveNotification")
        static let pushNotification = NSNotification.Name(rawValue: "pushNotification")
        static let PushNotificationMessage = NSNotification.Name(rawValue: "PushNotificationMessage")
    }
}
