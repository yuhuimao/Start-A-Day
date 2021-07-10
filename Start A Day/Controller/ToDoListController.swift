//
//  ToDoListController.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/10.
//

import Foundation

class ToDoListController {
    
    // MARK: - Initializer
    static let shared = ToDoListController()
    
    private init() {}
    
    // MARK: - Methods
    
    func addThing(thing: String) {
        
        let id = UUID()
        
        var keys: [String] = []
        
        if let keysFromUserDefault = UserDefaults.standard.stringArray(forKey: "ToDoKeys") {
            keys = keysFromUserDefault
        }
        
        keys.append("\(id)")
        
        UserDefaults.standard.setValue(keys, forKey: "ToDoKeys")
        UserDefaults.standard.setValue(thing, forKey: "\(id)")
        UserDefaults.standard.synchronize()
    }
    
    func getThings(key: String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
    
    func getToDoThingsKeys() -> [String] {
        return UserDefaults.standard.stringArray(forKey: "ToDoKeys") ?? []
    }
    
    func finishThing(key: String) {
        var keys = UserDefaults.standard.stringArray(forKey: "ToDoKeys")
        keys?.removeAll(where: { $0 == key })
        
        UserDefaults.standard.setValue(keys, forKey: "ToDoKeys")
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func topThreeThings() -> [String] {
        let things =  UserDefaults.standard.stringArray(forKey: "ToDoKeys") ?? []
        var topThreeThings: [String] = []
        if things.isEmpty {
            return []
        } else {
            if things.count > 0 {
                for index in 0...2 {
                    topThreeThings.append(things[index])
                }
                return topThreeThings
            } else if things.count > 1 {
                for index in 0...1 {
                    topThreeThings.append(things[index])
                }
                return topThreeThings
            } else if things.count > 0 {
                
                return topThreeThings
            }
        }
        return topThreeThings
    }
}
