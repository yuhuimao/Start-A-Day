//
//  RequestError.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/6.
//

import Foundation

enum RequestError: Error {
    case URLInitError
    case ResponseDecodeFail
}

extension RequestError {
    var description: String {
        switch self {
        case .URLInitError:
            return "URL init is nil"
            
        case .ResponseDecodeFail:
            return "Response data decode fail"
        }
    }
}
