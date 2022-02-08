//
//  AppUserDefaults.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-19.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation

struct AppUserDefault {
    
    static let shared = UserDefaults.standard
    
    // FCM token
    static func setFCMToken(token: String) {
        shared.set(token, forKey: "FCM_TOKEN")
        shared.synchronize()
    }
    
    static func getFCMToken() -> String {
        if let token = shared.string(forKey: "FCM_TOKEN") {
            return token
        }
        return ""
    }
}
