//
//  ProfileVM.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-07.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import Foundation
import Moya

enum ProfileSettingsSections: Int {
    case avatar = 0
    case general = 1
    case password = 2
    case logout = 3
}

enum GeneralSection: Int {
    case firstName = 0
    case lastName = 1
    case email =  2
    case phone = 3
}

enum PasswordSection: Int {
    case change = 0
    case reset = 1
}

class ProfileVM {

    // MARK: - Variables
    
//    var user: Profile
//    var avatarImage: UIImage?
//    let profileAPIProvider: MoyaProvider<ProfileAPI>
    let authAPIProvider: MoyaProvider<AuthAPI>
//    let avatar = ["Edit profile picture"]
//    let general = ["First name", "Last name", "E-mail"]
//    let password = ["Change my password", "Reset my password"]
//
    init() {
//        self.user = ProfileStorage.instance.getProfile()!
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
//        profileAPIProvider = MoyaProvider<ProfileAPI>(plugins: [networkLogger])
        authAPIProvider = MoyaProvider<AuthAPI>(plugins: [networkLogger])
    }
    
    // MARK: - Update User
    
//    func updateUser(firstName: String,lastName: String, countryCode: String, phone: String, completion: @escaping(_ status: Bool) -> Void){
//        profileAPIProvider.request(.changeProfile(firstName: firstName,lastName: lastName,countryCode: countryCode, phone: phone)) { (result) in
//            switch result {
//            case let .success(response):
//                do {
//                    let upload = try response.map(BMResponse<Profile>.self)
//                    ProfileStorage.instance.saveProfileObject(userData: upload.data)
//                    self.user = upload.data
//                    completion(upload.success)
//                } catch {
//                    completion(false)
//                }
//            case let .failure(error):
//                if error.response?.statusCode == 401 {
//                    DataStore.shared.fetchRefreshToken { (status) in
//                        if status {
//                            self.updateUser(firstName: firstName,lastName: lastName,countryCode: countryCode, phone: phone, completion: completion)
//                        } else{
//                            completion(false)
//                        }
//                    }
//                } else{
//                    do {
//                        guard let errorResponse = try error.response?.map(BMError.self) else {
//                            return completion(false)
//                        }
//                        debugPrint(errorResponse)
//                        completion(false)
//                    } catch {
//                        completion(false)
//                    }
//                }
//            }
//        }
//    }
    
    // MARK: - Logout
    
    func logout(  completion: @escaping(_ status: Bool) -> Void){
        authAPIProvider.request(.logout) { (result) in
            switch result {
            case .success(_):

                 completion(true)

            case let .failure(error):
                if error.response?.statusCode == 401 {
                    DataStore.shared.fetchRefreshToken { (status) in
                        if status {
//                            self.deleteImage( completion: completion)
                            print("Fail")
                        } else{
                            completion(false)
                        }
                    }
                } else{
                    do {
                        guard let errorResponse = try error.response?.map(S27Error.self) else {
                            return completion(false)
                        }
                        debugPrint(errorResponse)
                        completion(false)
                    } catch {
                        completion(false)
                    }
                }
            }
        }
    }
}
