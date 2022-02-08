//
//  ApplicationServiceProvider.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-02.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import Foundation
import UIKit
import SwiftyBeaver
import RealmSwift


enum Storyboard: String {
    case Main
    case Network
    case Events
    case Authentication
    case Utilities
    case Tabbar
}

let log = SwiftyBeaver.self

class ApplicationServiceProvider {
    
    static let shared = ApplicationServiceProvider()
    
    let bundleId = Bundle.main.bundleIdentifier ?? ""
    let deviceId = UIDevice.current.identifierForVendor!.uuidString
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    let deviceType = "APPLE"
    
    
  
    
    
    private init() {}
    
    let realmSchemaVersion: UInt64 = 1 // MARK: Update this if any Realm property changed happened
    
    func configure() {
        
        manageUIAppearance()
    }
    
    // Setup application appearance
    private func manageUIAppearance() {
        // Set navigation bar tint / background color
        UINavigationBar.appearance().isTranslucent = false
        
        // Set navigation bar item tint color
        UIBarButtonItem.appearance().tintColor = .darkGray
        
        // Set navigation bar back button tint color
        UINavigationBar.appearance().tintColor = .darkGray
        
        // Set back button image
        //let backImage = UIImage(named: "ic_back")
        //UINavigationBar.appearance().backIndicatorImage = backImage
        //UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
        
        // To remove the 1px seperator at the bottom of navigation bar
        //UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        //UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    // Print Realm path
    private func printRealmPath() {
        print("Realm path: \(String(describing: try! Realm().configuration.fileURL))")
    }
    
    // Setup access token
//    func setupAccessToken() {
//        guard let user = LocalUser.current() else {
//            return
//        }
//        SwaggerClientAPI.customHeaders.updateValue(user.accessToken, forKey: "x-access-token")
//    }
    
    // Manage User Direction
    public func manageUserDirection(from vc: UIViewController? = nil, window: UIWindow? = nil) {
//        guard LocalUser.current() != nil else {
//            directToPath(in: .Authentication, for: .AuthNC, from: vc, window: window)
//            return
//        }
        getRedirectionWithMainInterfaceType(type: ApplicationControl.appMainInterfaceType, window: window)
    }
    
    func getRedirectionWithMainInterfaceType(type: MainInterfaceType, from vc: UIViewController? = nil, window: UIWindow? = nil) {
        switch type {
        case .Main:
            directToPath(in: .Main, for: .HomeNC, from: vc, window: window)
        case .SideMenuNavigations:
            break
//            directToPath(in: .SideMenu, for: .SideMenuConfigurationVC, from: vc, window: window)
        case .TabBarNavigations:
            directToPath(in: .Tabbar, for: .MainTBC, from: vc, window: window)
        case .Custom:
            break
        }
    }
    
    // Direct to Main Root window
    public func directToPath(in sb: Storyboard, for identifier: String, from vc: UIViewController? = nil, window: UIWindow? = nil) {
        let storyboard = UIStoryboard(name: sb.rawValue, bundle: nil)
        let topController = storyboard.instantiateViewController(withIdentifier: identifier)
        
        appDelegate.setAsRoot(_controller: topController)
    }
    
    public func resetWindow(in sb: Storyboard, for identifier: String, from vc: UIViewController? = nil, window: UIWindow? = nil) {
        let storyboard = UIStoryboard(name: sb.rawValue, bundle: nil)
        let topController = storyboard.instantiateViewController(withIdentifier: identifier)

        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
          fatalError("could not get scene delegate ")
        }
        sceneDelegate.window?.rootViewController = topController
    }
    
    
    // Navigation push view Controller
    public func pushToViewController(in sb: Storyboard, for identifier: String, from vc: UIViewController?, data: Any? = nil) {
        
        let storyboard = UIStoryboard(name: sb.rawValue, bundle: nil)
        let destVc = storyboard.instantiateViewController(withIdentifier: identifier)
        vc?.navigationController?.pushViewController(destVc, animated: true)
    }
    
    // Get View Controller
    public func viewController(in sb: Storyboard, identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: sb.rawValue, bundle: nil)
        let targetVC = storyboard.instantiateViewController(withIdentifier: identifier)
        return targetVC
    }
}
