//
//  WeatherParameter.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/9.
//

import Foundation

struct WeatherParameter: Codable {
    
    enum ParameterType: String {
        case description = "Wx"
        case probabilityOfRain = "PoP"
        case minTemperature = "MinT"
        case descriptionOfTemperature = "CI"
        case maxTemperature = "MaxT"
    }
    
    // MARK: - Properties
    
    var unit: String?
    
    var value: String?
    
    enum CodingKeys: String, CodingKey {
        case value = "parameterName"
        case unit = "parameterUnit"
    }
}
