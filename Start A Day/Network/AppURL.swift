//
//  AppURL.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/6.
//

import Foundation

enum AppURL {
    
    private enum Domains {
        static let news = "https://newsapi.org/v2"
        static let weather = "https://opendata.cwb.gov.tw/api/v1/rest/datastore"
    }
    
    static let newsBaseURL = Domains.news
    static let weather = Domains.weather
}
