//
//  Config.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-21.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation

public struct Config {
    struct API {
        enum STAGING {
            static let HOST = "https://pro-es-user.social27.com"
        }
        enum LIVE {
            static let HOST = "LIVE"
        }
    }
    
    struct SOCIAL_LOGIN {
        enum GOOGLE {
            static let CLIENT_ID = "GOOGLE"
        }
    }
    
    struct GOOGLE_PLACES {
        enum PLACES {
            static let KEY = "GOOGLE_PLACES"
        }
    }
    
    struct NOTIFICATION {
        enum ONESIGNAL {
            static let KEY = "ONESIGNAL"
        }
    }
    
}
