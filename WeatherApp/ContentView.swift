//
//  ContentView.swift
//  WeatherApp
//
//  Created by Fatima Kahbi on 10/23/23.
//

import SwiftUI

/*
 TODO: enhance app following best coding practices and add unit tests
 Build model and refactor HStack with an array
 Get real data from a weather API
 TabBar with multiple cities
 
 */

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundColorView(isNight: isNight)
            VStack {
                CityNameView(cityName: "Tulsa, OK")
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 72)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "MON", 
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 64)
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.heavyrain.fill",
                                   temperature: 63)
                    WeatherDayView(dayOfWeek: "WED", 
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 65)
                    WeatherDayView(dayOfWeek: "THU", 
                                   imageName: "cloud.sun.fill",
                                   temperature: 72)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sun.max.fill",
                                   temperature: 76)
                }
                Spacer()
                Button(action: {
                    isNight.toggle()
                }, label: {
                    WeatherButton(title: "Change Time of Day", backgroundColor: .white, foregroundColor: .blue)
                })
                    
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 30))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundColorView: View {
    var isNight: Bool

    var body: some View {
        LinearGradient(colors: [isNight ? Color("DarkBlue") : .blue, isNight ? .gray : Color("LightBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityNameView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 50)
    }
}

struct WeatherButton: View {
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .bold))
            .padding()
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(foregroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
