//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Thidar Phyo on 4/29/23.
//

import SwiftUI
import Foundation
import CoreLocation

struct ContentView: View {
    @State private var isNight = false
    @ObservedObject var viewModel : WeatherViewModel
    
    var body: some View {
        ZStack {
            BackgroundView(top: isNight ? .black : .blue, bottom: isNight ? .gray : .white)
            VStack {
                
                CountryTextView(countryName: viewModel.country)
                CityTextView(cityName: viewModel.cityName)
                MainWeather(image: viewModel.iconName, temp: viewModel.temperature, weatherMain: viewModel.weatherMain)
                Spacer()
                HStack(spacing: 20){
                    WeatherDayView(dayofWeek: "TUE", imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 59: 74)
                    WeatherDayView(dayofWeek: "WED", imageName: isNight ? "moon.fill" : "sun.max.fill", temperature: isNight ? 59: 74)
                    WeatherDayView(dayofWeek: "THU", imageName: isNight ? "sparkles" : "cloud.sun.fill", temperature: isNight ? 59: 74)
                    WeatherDayView(dayofWeek: "FRI", imageName: "cloud.heavyrain.fill", temperature: isNight ? 59: 74)
                    WeatherDayView(dayofWeek: "SAT", imageName: isNight ? "cloud.heavyrain" : "cloud.sun.fill", temperature: isNight ? 59: 74)
                }
                
            }
            Button{
                isNight.toggle()
            }label: {
                //weatherButton(title: "Change Time to Day", textColor: .blue, bg: .white)
            }
            Spacer()
        }.onAppear(perform: viewModel.refresh)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
struct BackgroundView : View {
    var top: Color
    var bottom: Color
    var body: some View {
        LinearGradient(colors: [top,bottom], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
struct WeatherDayView: View {
    var dayofWeek : String
    var imageName : String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayofWeek)
                .font(.system(size: 16,weight: .medium,design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName).renderingMode(.original).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)")
                .font(.system(size: 20,weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}
struct CountryTextView : View {
    var countryName : String
    var body: some View {
        Text(countryName)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
struct CityTextView : View {
    var cityName : String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
struct MainWeather : View {
    var image: String
    var temp : String
    var weatherMain: String
    
    var body: some View {
        VStack(spacing:8){
            
            //url to image
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(image).png"))
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            //            Image(image).renderingMode(.original).resizable()
            //                .aspectRatio(contentMode: .fit)
            //                .frame(width: 180,height: 180)
            Text("\(temp)")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
            Text("\(weatherMain)")
                .font(.system(size: 30,weight: .medium))
                .foregroundColor(.white)
        }
    }
}
