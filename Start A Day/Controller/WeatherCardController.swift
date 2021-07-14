//
//  WeatherCardController.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/9.
//

import SwiftUI

class WeatherCardController {
    
    // MARK: - Properties
    
    static let shared = WeatherCardController()
    
    // MARK: - Initializer
    
    init() {}
    
    // MARK: - Methods
    
    func getWeatherParameter(weather: Weather?, type: WeatherParameter.ParameterType) -> String {
        let element = weather?.elements.first(where: { $0.name == type.rawValue })
        let state = element?.states.first
        
        return state?.parameter.value ?? ""
    }
    
    func getWeatherIconImageName(weather: Weather?) -> String {
        let element = weather?.elements.first(where: { $0.name == WeatherParameter.ParameterType.probabilityOfRain.rawValue })
        let state = element?.states.first
        let probabilityOfRain = Int(state?.parameter.value ?? "") ?? 0
        
        if probabilityOfRain >= 30 {
            return "cloud.rain"
        }
        
        return "sun.max"
    }
    
    func getBackgroundColors(weather: Weather?) -> [Color] {
        let element = weather?.elements.first(where: { $0.name == WeatherParameter.ParameterType.probabilityOfRain.rawValue })
        let state = element?.states.first
        let probabilityOfRain = Int(state?.parameter.value ?? "") ?? 0
        
        if probabilityOfRain >= 30 {
            return [Color(.lightGray), .blue]
        }
        
        
        return [.white, Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.686774197, blue: 1, alpha: 1))]
    }
}
