//
//  ForgotPasswordVM.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-28.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit
import Moya

class ForgotPasswordVM: NSObject {

    // MARK: - Variables
    
    let provider: MoyaProvider<AuthAPI> = MoyaProvider<AuthAPI>(plugins: [NetworkLoggerPlugin()])
    
    func forgotPass(email: String, completion: @escaping(_ status: Bool, _ message: String?, _ validationError: [RegisterErrorResult]?) -> Void) {
        provider.request(.forgot(email: email)) { (result) in
            switch result {
            case let .success(response):
                print(response)
                do {
                    let data = try response.map(S27Generic.self)
                    completion(data.success, data.message, nil)
                } catch {
                    completion(false, "We're having trouble connecting to the server, please try again", nil)
                }
            case let .failure(error):
                if error.response?.statusCode == 422 {
                    do {
                        guard let errorResponse = try error.response?.map(S27Errors<RegisterErrorResult>.self) else {
                            return completion(false, error.localizedDescription, nil)
                        }
                        completion(false, errorResponse.message, errorResponse.data)
                    } catch {
                        completion(false, error.localizedDescription, nil)
                    }
                } else if error.response?.statusCode == 401 {
                    DataStore.shared.fetchRefreshToken { (status) in
                        if status {
                            self.forgotPass(email: email, completion: completion)
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


