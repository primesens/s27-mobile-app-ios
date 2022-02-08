//
//  SignInVM.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-01.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit
import Foundation
import Moya

class SignInVM {
    
    // MARK: - Variables
    
    let provider: MoyaProvider<AuthAPI>
    var canGoBack: Bool
    var userEmail: String
    var afterCreate: Bool = false
    var afterReset: Bool = false
    
    init(canGoBack: Bool = true,userEmail: String = "",afterReset: Bool = false) {
        self.canGoBack = canGoBack
        self.userEmail = userEmail
        if afterReset {
            self.afterReset = afterReset
        }else if !userEmail.isEmpty{
            self.afterCreate = true
        }
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        provider = MoyaProvider<AuthAPI>(plugins: [networkLogger])
    }
}

extension SignInVM {
    
    func login(email: String, password: String, completion: @escaping(_ status: Bool, _ message: String?, _ validationError: String?) -> Void) {
        
        // Checking for Internet connection availability
        guard Reachability.isInternetAvailable() else {
            completion(false, "503", .InternetConnectionOffline)
            return
        }
        
        provider.request(.login(email: email, password: password)) { (result) in
            switch result {
            case let .success(response):
                print(response)
                do {
                    let signIn = try response.map(AuthTokensResult.self)
                    DataStore.shared.setRefreshToken(token: signIn.refreshToken)
                    DataStore.shared.setAccessToken(token: signIn.accessToken)
                    DataStore.shared.setIsSocialLogin(isSocialLogin: false)
                    completion(signIn.status, signIn.message, nil)
                } catch {
                    completion(false, nil, "We're having trouble connecting to the server, please try again")
                }
            case let .failure(error):
                if error.response?.statusCode == 401 {
                    DataStore.shared.fetchRefreshToken { (status) in
                        if status {
                            self.login(email: email, password: password, completion: completion)
                        } else{
                            completion(false, error.localizedDescription, nil)
                        }
                    }
                } else{
                    do {
                        guard let errorResponse = try error.response?.map(S27Error.self) else {
                            return completion(false, nil, "map error")
                        }
                        completion(false, nil, errorResponse.message)
                    } catch {
                        completion(false, nil, "map error")
                    }
                }
            }
        }
    }
}
