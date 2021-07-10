//
//  Weather.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/9.
//

import Foundation

struct Weather: Codable {
    
    // MARK: - Properties
    
    var locationName: String
    
    var elements: [WeatherElement]
    
    enum CodingKeys: String, CodingKey {
        case locationName
        case elements = "weatherElement"
    }
}
