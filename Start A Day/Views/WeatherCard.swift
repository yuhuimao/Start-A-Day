//
//  WeatherCard.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/5.
//

import SwiftUI

struct WeatherCard: View {
    var weather: Weather?
    var weatherElementValue: WeatherElementValue?
    
    var body: some View {
        ZStack(alignment: .center) {
            BackgroundView()
            VStack(alignment: .center) {
                Image(systemName: "sun.max")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                Text(weather?.locationName ?? "")
                    .font(.system(size: 14))
                Text("\(weatherElementValue?.value ?? "")°C")
                    .font(.system(size: 30))
                HStack(alignment: .center) {
                    Image(systemName: "cloud.rain")
                        .frame(width: 20, height: 20, alignment: .center)
                    Text(WeatherCardController().getWeatherParameter(weather: weather, type: .probabilityOfRain) + "%")
                        .font(.system(size: 14))
                }
                
                Text("\(WeatherCardController().getWeatherParameter(weather: weather, type: .maxTemperature))°C｜\(WeatherCardController().getWeatherParameter(weather: weather, type: .minTemperature))°C")
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
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.blue, .gray]), startPoint: .top, endPoint: .bottom)
            .aspectRatio(1, contentMode: .fit)
    }
}

struct WeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCard()
    }
}
