//
//  ProfileStore.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-25.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import Foundation
import RealmSwift

class ProfileStorage {
    
    static let instance = ProfileStorage()
    let realm = try! Realm()
    
    func saveProfileObject(userData: SignUpResult) {
        try! realm.write {
            realm.add(userData, update: .modified)
        }
    }
    
    func deleteProfileObjects(dataArray: [SignUpResult]) {
        let realm = try! Realm()
        for object in dataArray {
            try! realm.write {
                realm.delete(object)
            }
        }
    }
    
    func deleteAllProfileObjects(dataArray: [SignUpResult]) {
        let realm = try! Realm()
        for object in dataArray {
            try! realm.write {
                realm.delete(object)
            }
        }
    }
    
    func getProfile() -> SignUpResult? {
        return Array(realm.objects(SignUpResult.self)).first
    }
}

