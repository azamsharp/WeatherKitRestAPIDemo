//
//  Weather.swift
//  WeatherApp
//
//  Created by Mohammad Azam on 6/12/22.
//

import Foundation

struct WeatherResponse: Decodable {
    let currentWeather: Weather 
}

struct Weather: Decodable {
    let temperature: Double
    let humidity: Double
}
