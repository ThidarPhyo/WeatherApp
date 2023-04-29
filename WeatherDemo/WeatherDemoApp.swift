//
//  WeatherDemoApp.swift
//  WeatherDemo
//
//  Created by Thidar Phyo on 4/29/23.
//

import SwiftUI

@main
struct WeatherDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: WeatherViewModel(weatherService: WeatherService()))
        }
    }
}
