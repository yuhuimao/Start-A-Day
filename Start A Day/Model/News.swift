//
//  News.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/7.
//

import Foundation

struct News: Codable, Identifiable {
    
    // MARK: - Properties
    
    let id = UUID()
    
    var title: String
    
    var author: String?
    
    var imageURL: String
    
    var url: String
    
    var publishDate: String
    
    enum CodingKeys: String, CodingKey {
        case title, author, url
        case imageURL = "urlToImage"
        case publishDate = "publishedAt"
    }
}


