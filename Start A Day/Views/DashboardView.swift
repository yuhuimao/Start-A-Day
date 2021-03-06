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
    @State private var isShowLocationList = false
    @State private var toDoThingsKeys: [String] = []
    @State private var locationName = ""
    
    private let weatherService = WeatherService.shared
    
    var body: some View {
        
            GeometryReader { geometry in
                VStack {
                    HStack(spacing: 4) {
                        WeatherCard(weather: weather, weatherElementValue: weatherElementValue)
                            .onAppear {
                                getWeather()
                            }
                            .sheet(isPresented: $isShowLocationList, onDismiss: {
                                self.locationName = locationName
                                print(locationName)
                                getWeather(location: locationName)
                            }) {
                                LocationListView(locationName: $locationName)
                            }
                            .onTapGesture {
                                isShowLocationList.toggle()
                            }
                        
                        ToDoListCardView(toDoThingsKeys: toDoThingsKeys)
                            .onTapGesture {
                                isShowToDoList.toggle()
                            }
                            .sheet(isPresented: $isShowToDoList, onDismiss: {
                                toDoThingsKeys = ToDoListController.shared.getToDoThingsKeys()

                            }) {
                                ToDoListView()
                            }
                            .onAppear {
                                toDoThingsKeys = ToDoListController.shared.getToDoThingsKeys()
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

// MARK: - Mehods
private extension DashboardView {
    
    func getWeather(location: String = "臺北市") {
        weatherService.getWeather(locationName: location) { result in
            switch result {
            case .success(let weather):
                self.weather = weather
                print("[\(#line)] \(weather)")
            case .failure:
                break
            }
        }
        
        weatherService.getTemperature(locationName: location) { result in
            switch result {
            case .success(let weatherElementValue):
                self.weatherElementValue = weatherElementValue
                
            case .failure:
                break
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
