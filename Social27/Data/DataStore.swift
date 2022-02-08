//
//  DataStore.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-21.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation
import UIKit
import Moya

class DataStore {
    
    let provider: MoyaProvider<AuthAPI> = MoyaProvider<AuthAPI>(plugins: [NetworkLoggerPlugin()])
    
    static let shared  = DataStore()
    
    private init(){}
    
    func setJwtToken(token: String) {
        UserDefaults.standard.set(token, forKey: "jwtToken")
    }
    
    func getJwtToken() -> String? {
        return UserDefaults.standard.string(forKey: "jwtToken")
    }
    
    func setRefreshToken(token: String) {
        UserDefaults.standard.set(token, forKey: "refreshToken")
    }
    
    func getRefreshToken() -> String? {
        return UserDefaults.standard.string(forKey: "refreshToken")
    }
    
    func setAccessToken(token: String) {
        UserDefaults.standard.set(token, forKey: "accessToken")
    }
    
    func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: "accessToken")
    } 
    
    func removeAllData(completion: @escaping() -> Void) {
        UserDefaults.standard.removeObject(forKey: "jwtToken")
        UserDefaults.standard.removeObject(forKey: "refreshToken")
        UserDefaults.standard.removeObject(forKey: "accessToken")
        UserDefaults.standard.removeObject(forKey: "newDevice")
        UserDefaults.standard.removeObject(forKey: "timeStamp")
        UserDefaults.standard.removeObject(forKey: "sigfoxDeviceID")
        UserDefaults.standard.removeObject(forKey: "Recalibrate")
        UserDefaults.standard.removeObject(forKey: "playerId")
        UserDefaults.standard.removeObject(forKey: "SocialLogin")
        setLastTimeStampUploadedToAPI(token: 0)
        completion()
    }
    
    func setLastTimeStampUploadedToAPI(token: Int) {
        UserDefaults.standard.set(token, forKey: "timeStamp")
    }
    
    func getLastTimeStampUploadedToAPI() -> Int {
        return UserDefaults.standard.integer(forKey: "timeStamp")
    }
    
    func setSigfoxDeviceID(id: String) {
        UserDefaults.standard.set(id, forKey: "sigfoxDeviceID")
    }
    
    func getSigfoxDeviceID() -> String? {
        return UserDefaults.standard.string(forKey: "sigfoxDeviceID")
    }
    
    func setIsRecalibrate(isRecalibrate: Bool) {
        UserDefaults.standard.set(isRecalibrate, forKey: "Recalibrate")
    }
    
    func getIsRecalibrate() -> Bool? {
        return UserDefaults.standard.bool(forKey: "Recalibrate")
    }
    
    func setPlayerId(playerId: String) {
        UserDefaults.standard.set(playerId.replacingOccurrences(of: "([^A-Za-z0-9]+)", with: "", options: [.regularExpression]), forKey: "playerId")
    }
    
    func getPlayerId() -> String? {
        print("playerId \(UserDefaults.standard.string(forKey: "playerId") ?? "Nil")")
        guard let playerId = UserDefaults.standard.string(forKey: "playerId") else {
//            setOneSignalNotification()
            return ""
        }
        return playerId
    }
    
    func setIsSocialLogin(isSocialLogin: Bool) {
        UserDefaults.standard.set(isSocialLogin, forKey: "SocialLogin")
    }
    
    func getIsSocialLogin() -> Bool? {
        return UserDefaults.standard.bool(forKey: "SocialLogin")
    }
    
    func setIsHeightMetric(IsHeightMetric: Bool) {
        UserDefaults.standard.set(IsHeightMetric, forKey: "IsHeightMetric")
    }
    
    func getIsHeightMetric() -> Bool? {
        return UserDefaults.standard.bool(forKey: "IsHeightMetric")
    }
    
    func setIsVolumeMetric(IsVolumeMetric: Bool) {
        UserDefaults.standard.set(IsVolumeMetric, forKey: "IsVolumeMetric")
    }
    
    func getIsVolumeMetric() -> Bool? {
        return UserDefaults.standard.bool(forKey: "IsVolumeMetric")
    }
    
    func setIsDefaultRegional(IsDefaultRegional: Bool) {
        UserDefaults.standard.set(IsDefaultRegional, forKey: "IsDefaultRegional")
    }
    
    func getIsDefaultRegional() -> Bool? {
        return UserDefaults.standard.bool(forKey: "IsDefaultRegional")
    }
}

extension DataStore {
    ///
    /// Renew access token and refresh token using last stored refresh token
    /// - parameters:
    ///   - completion: returns status
    ///   - status: Bool
    ///
    func fetchRefreshToken(completion: @escaping(_ status: Bool) -> Void) {
        guard let token = self.getRefreshToken() else { return  }
        provider.request(.refresh(refreshID: token)) { (result) in
            switch result {
            case let .success(response):
                print(response)
                do {
                    let signIn = try response.map(S27Response<AuthTokensResult>.self)
                    DataStore.shared.setRefreshToken(token: signIn.data.refreshToken)
                    DataStore.shared.setAccessToken(token: signIn.data.accessToken)
                    completion(signIn.success)
                } catch {
                    completion(false)
                }
            case let .failure(error):
                do {
                    guard let _ = try error.response?.map(S27Error.self) else {
                        return completion(false)
                    }
                    completion(false)
                } catch {
                    completion(false)
                }
            }
        }
    }
    
//    func setOneSignalNotification(){
//        guard let deviceId = OneSignal.getDeviceState()?.pushToken else { return }
//        DataStore.shared.setPlayerId(playerId: deviceId)
//        OneSignal.promptForPushNotifications(userResponse: { accepted in
//        })
//    }
    
}
