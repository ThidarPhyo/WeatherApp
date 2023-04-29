//
//  Weather.swift
//  WeatherDemo
//
//  Created by Thidar Phyo on 4/29/23.
//

import Foundation

struct Weather {
    
    let city: String
    let base: String
    let country: String
    let weatherMain: String
    let temperature: String
    let description: String
    let iconName: String
    
    init(response: APIResponse){
        city = response.name
        base = response.base
        country = response.sys.country
        weatherMain = response.weather.first?.weatherMain ?? "weather"
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.iconName ?? ""
    }
    
}
