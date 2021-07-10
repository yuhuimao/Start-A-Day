//
//  WeatherCardController.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/9.
//

import Foundation

class WeatherCardController {
    
    // MARK: - Initializer
    
    init() {}
    
    // MARK: - Methods
    
    func getWeatherParameter(weather: Weather?, type: WeatherParameter.ParameterType) -> String {
        let element = weather?.elements.first(where: { $0.name == type.rawValue })
        let state = element?.states.first
        
        return state?.parameter.value ?? ""
    }
}
