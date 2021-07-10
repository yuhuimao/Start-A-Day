//
//  WeatherState.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/9.
//

import Foundation

struct WeatherState: Codable {
    
    // MARK: - Properties
    
    var startTime: String
    
    var endTime: String
    
    var parameter: WeatherParameter
    
    
    enum CodingKeys: String, CodingKey {
        case startTime, endTime, parameter
    }
}


