//
//  RegisterErrorResult.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-24.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation

// MARK: - RegisterErrorResult
struct RegisterErrorResult: Codable {
    let message: String?
    let path: [String]?
    let type: String?
    let context: Context?
}

// MARK: - Context
struct Context: Codable {
    let limit: Int?
    let value, label, key: String?
}

