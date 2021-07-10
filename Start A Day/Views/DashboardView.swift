//
//  DashboardView.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/5.
//

import SwiftUI

struct DashboardView: View {
    @State private var newsArray: [News] = []
    @State private var news: News?
    @State private var isHiddenLoading = false
    @State private var weather: Weather?
    @State private var weatherElementValue: WeatherElementValue?
    @State private var isShowToDoList = false
    
    private let weatherService = WeatherService.shared
    
    var body: some View {
        
            GeometryReader { geometry in
                VStack {
                    HStack(spacing: 4) {
                        WeatherCard(weather: weather, weatherElementValue: weatherElementValue)
                            .onAppear {
                                weatherService.getWeather(locationName: "桃園市") { result in
                                    switch result {
                                    case .success(let weather):
                                        self.weather = weather
                                    case .failure(let error):
                                        break
                                    }
                                }
                                
                                weatherService.getTemperature(locationName: "桃園市") { result in
                                    switch result {
                                    case .success(let weatherElementValue):
                                        self.weatherElementValue = weatherElementValue
                                        
                                    case .failure(let error):
                                        break
                                    }
                                }
                            }
                        
                        ToDoListCardView()
                            .onTapGesture {
                                isShowToDoList.toggle()
                            }
                            .sheet(isPresented: $isShowToDoList) {
                                ToDoListView()
                            }
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 4, trailing: 4))
                    
                    ZStack {
                        List {
                            ForEach(newsArray) { news in
                                NewsCard(news: news)
                                    .sheet(item: $news) { news in
                                        WebView(news: news, urlString: news.url)
                                    }
                                    .onTapGesture {
                                        self.news = news
                                    }
                                    .listRowInsets(EdgeInsets())
                                    .padding(.top, 1)
                            }
                        }
                        .onAppear(perform: {
                            NewService.shared.getNews(country: "tw", language: "zh") { result in
                                switch result {
                                case .success(let news):
                                    self.newsArray = news
                                    self.isHiddenLoading = !news.isEmpty
                                    
                                case .failure(let error):
                                    print(error)
                                }
                            }
                        })
                        
                        LoadingView(tintColor: .gray, scale: 2.0).hidden(isHiddenLoading)
                            
                        
                    }
                    
                    Spacer()
                }
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
