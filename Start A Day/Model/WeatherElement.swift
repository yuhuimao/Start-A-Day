//
//  WeatherElement.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/9.
//

import Foundation

struct WeatherElement: Codable {
    
    // MARK: - Properties
    
    var name: String
    
    var states: [WeatherState]
    
    enum CodingKeys: String, CodingKey {
        case name = "elementName"
        case states = "time"
    }
}
