//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mohammad Azam on 6/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text("Temperature: \(vm.temperature)")
            Text("Humidity: \(vm.humidity * 100)")
            
            
        }.task {
            await vm.populateWeather()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
