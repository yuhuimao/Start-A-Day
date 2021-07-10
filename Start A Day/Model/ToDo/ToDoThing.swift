//
//  ToDoThing.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/10.
//

import Foundation

struct TodoThing: Codable, Identifiable {
    
    // MARK: - Properties
    
    let id = UUID()
    
    var value: String?
}
