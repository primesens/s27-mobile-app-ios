//
//  AuthAPI.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-21.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation
import Moya

enum AuthAPI {
    case login(email: String, password: String)
    case loginGoogle(idToken: String, email: String)
    case loginApple(idToken: String)
    case signUp(email: String, firstName: String,lastName: String, password: String)
    case signUpGoogle(idToken: String, email: String, firstName: String,lastName: String,countryCode: String, phone: String)
    case signUpApple(idToken: String, email: String, firstName: String,lastName: String,countryCode: String, phone: String)
    case logout
    case forgot(email: String)
    case confirmForget(email: String, confirmationCode: String, password: String)
    case resetPass(oldPass: String, newPass: String)
    case refresh(refreshID: String)
}

extension AuthAPI: TargetType {
    
    var environment: APIEnvironment {
        NetworkManager.environment
    }
    
    public var baseURL: URL {
        guard let url = URL(string: environment.baseURL) else { fatalError("base url not configured") }
        return url
    }
    
    public var path: String {
        switch self {
        case .login( _, _):
            return "/api/user/auth"
        case .signUp(_, _, _, _ ):
            return "/api/user/participant"
        case .forgot( _):
            return "/api/user/users/forgot-password"
        case .refresh(_):
            return "/api/user/tokenRefresh"
        case .confirmForget( _, _, _):
            return "/api/user/users/forgot-password"
        case .resetPass( _, _):
            return "/api/user/users/reset-password"
        case .logout:
            return "/api/user/logout"
        case .loginGoogle(_ ,_), .signUpGoogle:
            return "/user/login/google"
        case .loginApple, .signUpApple:
            return "/user/login/apple"
        
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login(_, _), .signUp(_, _, _, _), .forgot(_), .refresh(_), .loginGoogle(_, _) , .signUpGoogle, .loginApple, .signUpApple:
            return .post
        case .confirmForget( _, _, _):
            return .post
        case .resetPass( _, _):
            return .post
        case .logout:
            return .post
    
        }
        
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(
                parameters: [
                    "email": email,
                    "password": password,
                    "notificationServiceDetails": [
                        "identifier": DataStore.shared.getPlayerId() ?? "",
                             "deviceType": 0
                         ]
                ],
                encoding: JSONEncoding.default)
            
        case .signUp(let email, let firstName, let lastName, let password):
            return .requestParameters(
                parameters: [
                    "email": email,
                    "firstName": firstName,
                    "lastName": lastName,
                    "password": password,
                    "notificationServiceDetails": [
                        "identifier": DataStore.shared.getPlayerId() ?? "",
                             "deviceType": 0
                         ]
                ],
                encoding: JSONEncoding.default)
        case .logout:
            return .requestParameters(
                parameters: [
                    "notificationServiceDetails": [
                        "identifier": DataStore.shared.getPlayerId() ?? "",
                             "deviceType": 0
                         ]
                ],
                encoding: JSONEncoding.default)
        case .forgot(let email):
            return .requestParameters(
                parameters: [
                    "email": email,
                ],
                encoding: JSONEncoding.default)
        case .confirmForget(let email, let confirmationCode, let password):
            return .requestParameters(
                parameters: [
                    "email": email,
                    "code": confirmationCode,
                    "newPassword": password,
                    "confirmPassword": password
                ],
                encoding: JSONEncoding.default)
        case .resetPass(let oldPass, let newPass):
            return .requestParameters(
            parameters: [
                "oldPassword": oldPass,
                "newPassword": newPass
            ],
            encoding: JSONEncoding.default)
        case .refresh(let refreshID):
            return .requestParameters(
                parameters: [
                    "refreshToken": refreshID,
                ],
                encoding: JSONEncoding.default)
        case .loginGoogle(idToken: let idToken, email: let email):
            return .requestParameters(
                parameters: [
                    "email": email,
                    "idToken": idToken,
                    "notificationServiceDetails": [
                        "identifier": DataStore.shared.getPlayerId() ?? "",
                             "deviceType": 0
                         ]
                ],
                encoding: JSONEncoding.default)
        case .signUpGoogle(idToken: let idToken, email: let email, firstName: let firstName, lastName: let lastName, countryCode: let countryCode, phone: let phone):
            return .requestParameters(
                parameters: [
                    "email": email,
                    "idToken": idToken,
                    "firstName": firstName,
                    "lastName": lastName,
                    "phoneNumber": phone,
                    "countryCode": countryCode,
                    "notificationServiceDetails": [
                        "identifier": DataStore.shared.getPlayerId() ?? "",
                             "deviceType": 0
                         ]
                ],
                encoding: JSONEncoding.default)
        case .loginApple(idToken: let idToken):
            return .requestParameters(
                parameters: [
                    "idToken": idToken,
                    "notificationServiceDetails": [
                        "identifier": DataStore.shared.getPlayerId() ?? "",
                             "deviceType": 0
                         ]
                ],
                encoding: JSONEncoding.default)
       
            
        case .signUpApple(idToken: let idToken, email: let email, firstName: let firstName, lastName: let lastName, countryCode: let countryCode, phone: let phone):
            return .requestParameters(
                parameters: [
                    "email": email,
                    "idToken": idToken,
                    "firstName": firstName,
                    "lastName": lastName,
                    "phoneNumber": phone,
                    "countryCode": countryCode,
                    "notificationServiceDetails": [
                        "identifier": DataStore.shared.getPlayerId() ?? "",
                             "deviceType": 0
                         ]
                ],
                encoding: JSONEncoding.default)
       
    }
    }
    
    public var headers: [String: String]? {
        let token = DataStore.shared.getAccessToken() ?? ""
        
        var params = ["Content-Type": "application/json",
                      "Accept": "application/json",
                      "accept-timezone" : TimeZone.current.identifier
        ]
        switch self {
        case .login(_, _), .signUp(_, _, _, _), .forgot(_), .refresh(_), .loginGoogle(_, _), .signUpGoogle, .loginApple:
            return params
        case .confirmForget( _, _, _):
            return params
        case .resetPass( _, _):
            params["Authorization"] = "Bearer \(token)"
            return params
        case .logout:
            params["Authorization"] = "Bearer \(token)"
            return params
        case .signUpApple:
            return params
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
