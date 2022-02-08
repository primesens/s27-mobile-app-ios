//
//  AuthTokensResult.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-21.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation

// MARK: - AuthTokensResult
class AuthTokensResult: Codable {
    let status: Bool
    let accessToken: String
    let expiresIn: Int
    let refreshToken: String
    let refreshTokenExpiration: Int
    let scope: String
    let tokenType: String
    let mfaChallenge: Bool
    let message: String
    let user: User?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case accessToken = "accessToken"
        case expiresIn = "expiresIn"
        case refreshToken = "refreshToken"
        case refreshTokenExpiration = "refreshTokenExpiration"
        case scope = "scope"
        case tokenType = "tokenType"
        case mfaChallenge = "mfaChallenge"
        case message = "message"
        case user = "user"
    }

    init(status: Bool, accessToken: String, expiresIn: Int, refreshToken: String, refreshTokenExpiration: Int, scope: String, tokenType: String, mfaChallenge: Bool, message: String, user: User) {
        self.status = status
        self.accessToken = accessToken
        self.expiresIn = expiresIn
        self.refreshToken = refreshToken
        self.refreshTokenExpiration = refreshTokenExpiration
        self.scope = scope
        self.tokenType = tokenType
        self.mfaChallenge = mfaChallenge
        self.message = message
        self.user = user
    }
}

// MARK: - User
class User: Codable {
    var profile: Profile?

    enum CodingKeys: String, CodingKey {
        case profile = "profile"
    }

    init(profile: Profile?) {
        self.profile = profile
    }
}
