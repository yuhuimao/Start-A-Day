//
//  WeatherElementValue.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/10.
//

import Foundation

struct WeatherElementValue: Codable {
    
    // MARK: - Properties
    
    var value: String
    
    enum CodingKeys: String, CodingKey {
        case value
    }
}
