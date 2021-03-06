//
//  NewsNetworkAdapter.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/14.
//

import Foundation

struct NewsNetworkAdapter<Target: TargetType> {
    
    let tokenProvider: TokenProvider
    
    func request(target: Target, completion: @escaping (Result<Data, Error>) -> Void) {
        print("[\(#line)]" + target.baseURL + target.path)
        guard let url = URL(string: target.baseURL + target.path) else {
            completion(.failure(RequestError.URLInitError))
            return
        }
        
        let parameterData = try? JSONSerialization.data(withJSONObject: target.parameter, options: [])
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = target.method.rawValue
        request.httpBody = target.method == .post ? parameterData : nil
        
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.httpAdditionalHeaders = ["Authorization": tokenProvider.token]
        
        let session = URLSession(configuration: sessionConfig)
        let task = session.dataTask(with: request) { data, _, error in
            
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(error!))
            }
        }
        
        task.resume()
    }
}
