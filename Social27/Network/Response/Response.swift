//
//  Response.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-21.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation

struct S27Generic: Codable {
    let success: Bool
    let message: String
}

struct S27Response<T: Codable>: Codable {
    let success: Bool
    let message: String
    let data: T
}

struct S27Results<T: Codable>: Codable {
    let success: Bool
    let message: String
    let data: [T]
}

struct S27Errors<T: Codable>: Codable {
    let success: Bool
    let message: String
    let data: [T]
}

struct S27Error: Codable {
    let success: Bool
    let message: String
}

struct S27ResponseNew<T: Codable>: Codable {
    let data: T
}
