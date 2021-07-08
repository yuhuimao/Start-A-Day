//
//  LoadImage.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/8.
//

import Foundation

class LoadImage {
    
    // MARK: - Properties
    
    static let shared = LoadImage()
    
    // MARK: - Initializer
    
    private init() {}
    
    // MARK: - Methods
    
    func loadImageData(imageURLString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: imageURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { completion(.failure(error!)); return }
            
            completion(.success(data))
            
        }.resume()

    }
}
