//
//  SignUpVM.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-01.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import Foundation
import Moya

class SignUpVM {
    
    let authProvider: MoyaProvider<AuthAPI>
    
    init() {
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        authProvider = MoyaProvider<AuthAPI>(plugins: [networkLogger])
        
    }
}

extension SignUpVM {
    
    func signUp(email: String, firstName: String,lastName: String, password: String, completion: @escaping(_ status: Bool, _ message: String, _ validationError: [RegisterErrorResult]?) -> Void) {
        authProvider.request(.signUp(email: email, firstName: firstName, lastName: lastName, password: password)) { (result) in
            switch result {
            case let .success(response):
                
                do {
//                    let register = try response.map(S27ResponseNew<SignUpResult>.self)
                    let register = try response.map(SignUpResult.self)
//                    let signIn = try response.map(AuthTokensResult.self)
                    DataStore.shared.setRefreshToken(token: register.refreshToken!)
                    DataStore.shared.setAccessToken(token: register.accessToken!)
                    
                    completion(register.status ?? true,  "Success" , nil)
                } catch {
                    completion(false, error.localizedDescription, nil)
                }
            case let .failure(error):
                if error.response?.statusCode == 422 {
                    do {
                        guard let errorResponse = try error.response?.map(S27Error.self) else {
                            return completion(false, error.localizedDescription, nil)
                        }
                        completion(false, errorResponse.message, nil)
                    } catch {
                        completion(false, error.localizedDescription, nil)
                    }
                } else if error.response?.statusCode == 401 {
                    DataStore.shared.fetchRefreshToken { (status) in
                        if status {
                            self.signUp(email: email, firstName: firstName, lastName: lastName, password: password, completion: completion)
                        } else{
                            completion(false, error.localizedDescription, nil)
                        }
                    }
                } else{
                    do {
                        guard let errorResponse = try error.response?.map(S27Error.self) else {
                            return completion(false, error.localizedDescription, nil)
                        }
                        completion(false, errorResponse.message, nil)
                    } catch {
                        completion(false, error.localizedDescription, nil)
                    }
                }
            }
        }
    }
}

