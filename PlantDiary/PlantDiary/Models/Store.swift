//
//  Store.swift
//  PlantDiary
//
//  Created by 김종혁 on 8/27/24.
//

import Foundation

final class Store {
    public static let shared = Store()
    
    private(set) var isLogin: Bool = false
    
    var islog: Bool {
        get {
            return isLogin
        }
        set {
            isLogin = newValue
        }
    }
}
