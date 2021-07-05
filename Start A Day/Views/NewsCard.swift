//
//  NewsCard.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/5.
//

import SwiftUI

struct NewsCard: View {
    var body: some View {
        Image(systemName: "newspaper")
            .resizable()
            .aspectRatio(3/2, contentMode: .fit)
            .overlay(TextOverlay())
        
    }
}

struct TextOverlay: View {
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]), startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading, spacing: 8) {
                Text("新聞標題")
                Text("出處")
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 12, trailing: 0))
            .foregroundColor(.white)
        }
    }
}

struct NewsCard_Previews: PreviewProvider {
    static var previews: some View {
        NewsCard()
    }
}
