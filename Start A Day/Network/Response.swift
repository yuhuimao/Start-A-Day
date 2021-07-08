//
//  Response.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/6.
//

import Foundation

final class Response {
    
    // MARK: - Properties
    
    let statusCode: Int
    
    let data: Data
    
    /// The original URLRequest for the response
    let request: URLRequest?
    
    /// The HTTPURLResponse object
    let response: HTTPURLResponse?
    
    init(statusCode: Int, data: Data, request: URLRequest? = nil, response: HTTPURLResponse? = nil) {
        self.statusCode = statusCode
        self.data = data
        self.request = request
        self.response = response
    }
}
