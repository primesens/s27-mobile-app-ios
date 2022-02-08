//
//  UIViewController+Extension.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-24.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String, buttonTitle: String, action: ((_ alertAction: UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: action)
        alert.addAction(action)
        self.present(alert, animated: true)
    }

    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        self.view.window!.layer.add(transition, forKey: kCATransition)

        present(viewControllerToPresent, animated: false)
    }

    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)

        dismiss(animated: false)
    }
}
