//
//  WeatherAPI.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/9.
//

import Foundation

enum WeatherAPI {
    case getWeather(location: String)
    case getTemperature(location: String)
}

extension WeatherAPI: TargetType {
    var baseURL: String {
        return AppURL.weather
    }
    
    var path: String {
        switch self {
        case .getWeather(let location):
            // 因為location為中文所以需要encoding不然URL無法生成
            return "/F-C0032-001?locationName=\(location)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            
        case .getTemperature(let location):
            return "/F-D0047-089?locationName=\(location)&elementName=T".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
    }
    
    var parameter: [String : Any] {
        var parameter: [String: Any] = [:]
        switch self {
        case .getWeather,
             .getTemperature:
            parameter = [:]
        }
        
        return parameter
    }
    
    var method: HTTPMethod {
        switch self {
        case .getWeather,
             .getTemperature:
            return .get
        }
    }
}
