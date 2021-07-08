//
//  TargetType.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/6.
//

import Foundation

protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var parameter: [String: Any] { get }
    var method: HTTPMethod { get }
}
