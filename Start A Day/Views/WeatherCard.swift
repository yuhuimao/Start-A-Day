//
//  WeatherCard.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/5.
//

import SwiftUI

struct WeatherCard: View {
    let screenSize = UIScreen.main.bounds
    var body: some View {
        ZStack(alignment: .center) {
            BackgroundView()
            VStack(alignment: .center) {
                Image(systemName: "sun.max")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                Text("桃園市")
                    .font(.system(size: 14))
                Text("32度")
                    .font(.system(size: 30))
                HStack(alignment: .center) {
                    Image(systemName: "cloud.rain")
                        .frame(width: 20, height: 20, alignment: .center)
                    Text("降雨機率")
                        .font(.system(size: 14))
                }
                
                Text("最高溫｜最低溫")
                    .font(.body)
                    .font(.system(size: 14))
            }
            .foregroundColor(.white)
        }
        .cornerRadius(10)
        .frame(width: 180, height: 180, alignment: .center)
        .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
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
