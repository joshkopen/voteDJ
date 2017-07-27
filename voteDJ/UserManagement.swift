
//
//  User.swift
//  CrowdDJ
//
//  Created by Joshua Kopen on 7/13/17.
//  Copyright © 2017 Joshua Kopen. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class User: Object {
    dynamic var name = "John Smith"
    dynamic var email = "johnsmith@gmail.com"
    dynamic var username = "johnsmith"
    dynamic var password = "password"
    dynamic var userID = 54
    
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    func setUserValeus(name: String, email: String, username: String, password: String, userID: Int) {
        self.name = name
        self.email = email
        self.username = username
        self.password = password
        self.userID = userID
    }
}

class UserManager {
    
    static let realm = try! Realm()
    
    static func saveUser(_ user: User) -> Bool {
        do {
            try! realm.write{
                realm.add(user)
            }
            return true
        }
        catch {
            return false
        }
    }
    
    static func login(username: String, password: String) -> User {
        print(username)
        print(password)
        let user = realm.objects(User.self).filter("username = \"\(username)\" && password = \"\(password)\"")
        return user.first!
    }
    
    static func generateUserID() -> Int {
        let userList = realm.objects(User.self)
        var highest = -1
        for user in userList {
            if user.userID > highest {
                highest = user.userID
            }
        }
        highest += 1
        return highest
    }
}
