//
//  LoadingDelegate.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-10.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation
import UIKit
import RappleProgressHUD

protocol LoadingIndicatorDelegate {
    func startLoading()
    func startLoadingWithText(label: String)
    func stopLoading()
    func startLoadingWithProgress(current: CGFloat, total:CGFloat)
}

extension LoadingIndicatorDelegate {
    // -------- RappleProgressHUD -------- //
    // Start loading
    func startLoading() {
        RappleActivityIndicatorView.startAnimating()
    }
    
    // Start loading with text
    func startLoadingWithText(label: String) {
        RappleActivityIndicatorView.startAnimatingWithLabel(label)
    }
    
    // Stop loading
    func stopLoading() {
        RappleActivityIndicatorView.stopAnimation()
    }
    
    func startLoadingWithProgress(current: CGFloat, total:CGFloat) {
        RappleActivityIndicatorView.setProgress(current/total)
    }
}

