//
//  NewService.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/6.
//

import SwiftUI
import Foundation

class NewService {
    
    // MARK: - Properties
    
    private let networkAdapter: NewsNetworkAdapter<NewsAPI>
    
    private let tokenSource = TokenSource.shared
    
    static let shared = NewService()
    
    private init() {
        tokenSource.token = ""
        networkAdapter = NewsNetworkAdapter<NewsAPI>(tokenProvider: tokenSource)
    }
    
    // MARK: - Methods
    
    func getNews(country: String, language: String, completion: @escaping (Result<[News], Error>) -> Void) {
        print("load news...")
        networkAdapter.request(target: .getNews(country: country, language: language)) { result in
            print("get response")
            switch result {
            case .success(let data):
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let data = try JSONSerialization.data(withJSONObject: json?["articles"] ?? [:], options: [])
                    
                    guard let news = try? JSONDecoder().decode([News].self, from: data) else {
                        print("Decode news fail")
                        completion(.failure(RequestError.ResponseDecodeFail))
                        return }
                    
                    completion(.success((news)))
                } catch {
                    print("[\(#line)] [\(#function)] \(error)")
                    completion(.failure(error))
                }
                
            case .failure(let error):
                print("[\(#line)] [\(#function)] \(error)")
                completion(.failure(error))
            }
        }
    }
}
