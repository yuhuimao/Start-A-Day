//
//  WeatherCard.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/5.
//

import SwiftUI

struct WeatherCard: View {
    private let weatherController = WeatherCardController.shared
    
    var weather: Weather?
    var weatherElementValue: WeatherElementValue?
    
    var body: some View {
        ZStack(alignment: .center) {
            BackgroundView(weather: weather)
            VStack(alignment: .center, spacing: 4) {
                let iconImage = weatherController.getWeatherIconImageName(weather: weather)
                Image(systemName: iconImage)
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                Text(weather?.locationName ?? "")
                    .font(.system(size: 14))
                Text("\(weatherElementValue?.value ?? "")°C")
                    .font(.system(size: 30))
                HStack(alignment: .center) {
                    Image(systemName: "cloud.rain")
                        .frame(width: 20, height: 20, alignment: .center)
                    Text(weatherController.getWeatherParameter(weather: weather, type: .probabilityOfRain) + "%")
                        .font(.system(size: 14))
                }
                
                HStack {
                    let maxTemperature = weatherController.getWeatherParameter(weather: weather, type: .maxTemperature)
                    let minTemperature = weatherController.getWeatherParameter(weather: weather, type: .minTemperature)
                    Image(systemName: "thermometer.sun.fill")
                    Text("\(maxTemperature)°C")
                    Text("|")
                    Image(systemName: "thermometer.snowflake")
                    Text("\(minTemperature)°C")
                }
                .font(.body)
                .font(.system(size: 14))
                .padding(.top, 4)
            }
            .foregroundColor(.white)
        }
        .cornerRadius(20)
        .frame(minWidth: 0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity)
    }
}

struct BackgroundView: View {
    var weather: Weather?
    
    var body: some View {
        let gradientColors =  WeatherCardController.shared.getBackgroundColors(weather: weather)
        LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom)
            .aspectRatio(1, contentMode: .fit)
    }
}

struct WeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        
        WeatherCard()
    }
}
