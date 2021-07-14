//
//  WeatherService.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/9.
//

import Foundation

class WeatherService {
    
    // MARK: - Properties
    
    private let tokenSource = TokenSource.shared
    
    private let networkAdapter: WeatherNetworkAdapter<WeatherAPI>
    
    static let shared = WeatherService()
    
    private init() {
        tokenSource.weatherToken = Constants.weatherToken
        networkAdapter = WeatherNetworkAdapter<WeatherAPI>(tokenProvider: tokenSource)
    }
    
    // MARK: - Methods
    
    func getWeather(locationName: String, completion: @escaping (Result<Weather, Error>) -> Void) {
        print("[\(#line)] get weather")
        networkAdapter.request(target: .getWeather(location: locationName)) { result in
            print("[\(#line)] get weather response")
            switch result {
            case.success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let records = json?["records"] as? [String: Any]
                    let location = records?["location"] as? [[String: Any]]
                    let data = try JSONSerialization.data(withJSONObject: location as Any, options: [])
                    guard let weathers = try? JSONDecoder().decode([Weather].self, from: data) else {
                        print("[\(#line)] Weather decode fail")
                        completion(.failure(RequestError.ResponseDecodeFail))
                        return }
                    guard let weather = weathers.first else {
                        print("[\(#line)] Weather decode fail")
                        completion(.failure(RequestError.ResponseDecodeFail))
                        return }
                    
                    completion(.success(weather))
                } catch {
                    print("[\(#line)] \(error)")
                    completion(.failure(error))
                }
                
            case .failure(let error):
                print("[\(#line)] \(error)")
                completion(.failure(error))
            }
        }
    }
    
    func getTemperature(locationName: String, completion: @escaping (Result<WeatherElementValue, Error>) -> Void) {
        
        
        print("[\(#line)] get weather")
        networkAdapter.request(target: .getTemperature(location: locationName)) { result in
            print("[\(#line)] get weather response")
            switch result {
            case.success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let records = json?["records"] as? [String: Any]
                    let locations = records?["locations"] as? [[String: Any]]
                    let location = locations?.first?["location"] as? [[String: Any]]
                    let weatherElements = location?.first?["weatherElement"] as? [[String: Any]]
                    let time = weatherElements?.first?["time"] as? [[String: Any]]
                    let elementValue = time?.first?["elementValue"]
                    let data = try JSONSerialization.data(withJSONObject: elementValue as Any, options: [])
                    guard let weatherElementValue = try? JSONDecoder().decode([WeatherElementValue].self, from: data) else {
                        print("[\(#line)] Weather decode fail")
                        completion(.failure(RequestError.ResponseDecodeFail))
                        return }
                    
                    completion(.success(weatherElementValue.first!))
                } catch {
                    print("[\(#line)] \(error)")
                    completion(.failure(error))
                }
                
            case .failure(let error):
                print("[\(#line)] \(error)")
                completion(.failure(error))
            }
        }
        
        
    }
}
