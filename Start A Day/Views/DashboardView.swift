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
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack(spacing: 4) {
                    WeatherCard()
                    ToDoListView()
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                
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
                    }
                }
                .onAppear(perform: {
                    NewService.shared.getNews(country: "tw", language: "zh") { result in
                        switch result {
                        case .success(let news):
                            self.newsArray = news
                            
                        case .failure(let error):
                            print(error)
                        }
                    }
                })
                
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
