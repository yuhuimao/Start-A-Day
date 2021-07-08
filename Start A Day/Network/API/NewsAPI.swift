//
//  NewsAPI.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/6.
//

import Foundation

enum NewsAPI {
    case getNews(country: String, language: String)
}

extension NewsAPI: TargetType {
    
    var baseURL: String {
        return AppURL.newsBaseURL
    }
    
    var path: String {
        let path: String
        switch self {
        case .getNews(let country, let language):
            path = "/top-headlines?apiKey=\(Constants.newApiKey)&country=\(country)&language=\(language)"
        }
        return path
    }
    
    var parameter: [String: Any] {
        var parameter: [String: Any] = [:]
        
        switch self {
        case .getNews:
            break
        }
        return parameter
    }
    
    var method: HTTPMethod {
        switch self {
        case .getNews:
            return .get
        }
    }
}
