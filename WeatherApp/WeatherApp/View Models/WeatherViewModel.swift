//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mohammad Azam on 6/12/22.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var temperature: Double = 0.0
    @Published var humidity: Double = 0.0
    
    func populateWeather() async {
        
        do {
            let weather = try await WeatherService().getWeather()
            temperature = weather.temperature
            humidity = weather.humidity 
            
        } catch {
            print(error)
        }
        
    }
    
}
