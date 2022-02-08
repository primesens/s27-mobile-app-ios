//
//  NProfile.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-21.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation

import RealmSwift

// MARK: - Profile
class NProfile:Object, Codable {
    var id: String?
    var status: Bool?
    var firstName: String?
    var lastName: String?
    @objc dynamic var email: String?
//    var email: String?
    
    var accessToken: String?
    var expiresIn: Int?
    var refreshToken: String?
    var refreshTokenExpiration: Int?
    var scope: String?
    var tokenType: String?
    var mfaChallenge: Bool?
    
    init(id: String?, status: Bool?, firstName: String?, lastName: String?, email: String?, accessToken: String?, expiresIn: Int?, refreshToken: String?, refreshTokenExpiration: Int?, scope: String?, tokenType: String?, mfaChallenge: Bool?) {
        self.id = id
        self.status = status
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.accessToken = accessToken
        self.expiresIn = expiresIn
        self.refreshToken = refreshToken
        self.refreshTokenExpiration = refreshTokenExpiration
        self.scope = scope
        self.tokenType = tokenType
        self.mfaChallenge = mfaChallenge
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
        case accessToken = "accessToken"
        case refreshToken = "refreshToken"
        case refreshTokenExpiration = "refreshTokenExpiration"
        case scope = "scope"
        case tokenType = "tokenType"
        case mfaChallenge = "mfaChallenge"
    }
    
    required override init() {
        super.init()
    }
    
    override class func primaryKey() -> String? {
        return "email"
    }
}
