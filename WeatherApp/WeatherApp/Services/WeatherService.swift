//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Mohammad Azam on 6/12/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
}

class WeatherService {
    
    func getWeather() async throws -> Weather {
        
        guard let weatherURL = URL(string: "http://localhost:8080") else {
            throw NetworkError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: weatherURL)
        
        // check if the response is succesfull
        
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse.currentWeather
        
    }
    
}
