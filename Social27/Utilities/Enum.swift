//
//  Enum.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-18.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation
import UIKit

enum DisplayMode {
    case Add, Edit, View
}

enum ImageFormat: String {
    case png, jpeg
}

enum JPEGQuality: CGFloat {
    case lowest  = 0
    case low     = 0.25
    case medium  = 0.5
    case high    = 0.75
    case highest = 1
}

