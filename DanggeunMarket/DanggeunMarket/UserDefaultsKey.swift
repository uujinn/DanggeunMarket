//
//  UserDefaultsKey.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/20.
//

import Foundation

class UserDefaultsKey {
    
    static var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "Login") {
        didSet {
            UserDefaults.standard.setValue(isLoggedIn, forKey: "Login")
        }
    }
}
