//
//  NewsCard.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/5.
//

import SwiftUI

struct NewsCard: View {
    var news: News
    
    var body: some View {
        ImageContainerView(imageURLString: news.imageURL)
            .overlay(TextOverlay(news: news))
    }
}

struct TextOverlay: View {
    var news: News
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading, spacing: 8) {
                Text(news.title)
                Text(news.author ?? "")
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 12, trailing: 0))
            .foregroundColor(.white)
        }
    }
}

struct ImageContainerView: View {
    var imageURLString: String
    @State private var imageData: Data = Data()
    
    var body: some View {
        Image(uiImage: (((!imageData.isEmpty) ? UIImage(data: imageData)! : UIImage(systemName: "newspaper")) ?? UIImage()) )
            .resizable()
            .aspectRatio(3/2, contentMode: .fit)
            .onAppear {
                LoadImage.shared.loadImageData(imageURLString: imageURLString) { result in
                    
                    switch result {
                    case .success(let imageData):
                        self.imageData = imageData
                        
                    case .failure(let error):
                        print(error)
                    }
                }
            }
    }
}

struct NewsCard_Previews: PreviewProvider {
    static var previews: some View {
        let news = News(title: "新聞標題", author: "出處", imageURL: "", url: "", publishDate: "")
        NewsCard(news: news)
    }
}
