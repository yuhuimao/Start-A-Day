//
//  TokenSource.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/6.
//

import Foundation

class TokenSource: TokenProvider {
    
    static let shared = TokenSource()
    
    private init() {}
    
    // 目前只有一個token所以直接先存在同一個key中
    var token: String {
        get {
            return ""
        }
        
        set {
            
        }
    }
    
    var weatherToken: String {
        get {
            return UserDefaults.standard.string(forKey: "Token") ?? ""
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: "Token")
        }
    }
}
