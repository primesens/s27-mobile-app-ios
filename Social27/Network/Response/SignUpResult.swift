//
//  SignUpResult.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-24.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation
import SwiftUI
import RealmSwift

class SignUpResult:Object, Codable {
    
//    var localUser: User?
    
    var status: Bool?
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var email: String?
    var id: String?
    @objc dynamic var accessToken: String?
    var expiresIn: Int?
    @objc dynamic var refreshToken: String?
    var refreshTokenExpiration: Int?
    @objc dynamic var scope: String?
    @objc dynamic var tokenType: String?
    var mfaChallenge: Bool?
    var user: User?
    
    init(status: Bool?, firstName: String?, lastName: String?, email: String?, id: String?, accessToken: String?, expiresIn: Int?, refreshToken: String?, refreshTokenExpiration: Int?, scope: String?, tokenType: String?, mfaChallenge: Bool?, user: User?) {
        self.status = status
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.id = id
        self.accessToken = accessToken
        self.expiresIn = expiresIn
        self.refreshToken = refreshToken
        self.refreshTokenExpiration = refreshTokenExpiration
        self.scope = scope
        self.tokenType = tokenType
        self.mfaChallenge = mfaChallenge
        self.user = user
    }
    
//    init(localUser: User) {
//        self.localUser = localUser
//    }
    
    required override init() {
        super.init()
    }
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
        case id = "id"
        case accessToken = "accessToken"
        case expiresIn = "expiresIn"
        case refreshToken = "refreshToken"
        case refreshTokenExpiration = "refreshTokenExpiration"
        case scope = "scope"
        case tokenType = "tokenType"
        case mfaChallenge = "mfaChallenge"
        
//        case localUser = "localUser"
        
    }
}

