//
//  WeatherViewModel.swift
//  WeatherDemo
//
//  Created by Thidar Phyo on 4/29/23.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var iconName: String = "default"
    @Published var base: String = "base"
    @Published var country: String = "country"
    @Published var weatherMain: String = "main"
    
    public let weatherService: WeatherService
    
    init(weatherService: WeatherService){
        self.weatherService = weatherService
    }
    
    func refresh(){
        weatherService.loadWeatherData{ weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.base = weather.base
                self.country = weather.country
                self.weatherMain = weather.weatherMain
                self.temperature = "\(weather.temperature)°C"
                self.weatherDescription = weather.description.capitalized
                self.iconName = weather.iconName.lowercased()
            }
            
        }
    }
    
}
