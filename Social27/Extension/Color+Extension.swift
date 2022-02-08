//
//  Color+Extension.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-02-01.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation
import UIKit

enum AssetsColor: String {
    case black
    case blue
    case blueDark
    case blueLight
    case blueGrey
    case blueSky
    case grayLight
    case green
    case grey
    case pink
    case red
    case gray
    case stackViewborderColor
    case textGreyColor
    case transparentWhite
    case whiteLight
    case midianBule
    case lightBlue
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .stackViewborderColor:
            return UIColor(red: 0.867, green: 0.906, blue: 0.929, alpha: 1)
        case .textGreyColor:
            return UIColor(red: 0.459, green: 0.533, blue: 0.573, alpha: 1)
        default:
            return UIColor(named: name.rawValue)
        }
    }
}
