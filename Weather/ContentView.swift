//
//  ContentView.swift
//  Weather
//
//  Created by Shreyansh Pandey on 04/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false //checks if it's true or false and changes on the basis of that
    
    var body: some View {
        TabView {
            CityWeatherView(cityName: "Hisar", temperature: 18, isNight: $isNight)
                .tabItem {
                    Label("Hisar", systemImage: "location.circle")
                }
            
            CityWeatherView(cityName: "New York", temperature: 20, isNight: $isNight)
                .tabItem {
                    Label("New York", systemImage: "location.circle")
                }
            CityWeatherView(cityName: "London", temperature: 15, isNight: $isNight)
                .tabItem {
                    Label("London", systemImage: "location.circle")
                }
            
        }
        .accentColor(isNight ? .white : .blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CityWeatherView: View {
    var cityName: String
    var temperature: Int
    @Binding var isNight: Bool
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: cityName)
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: isNight ? 10 : temperature)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.rain.fill", temperature: 8)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.haze.fill", temperature: 10)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 5)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "snowflake", temperature: -1)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill", temperature: 10)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: isNight ? "Night" : "Switch", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}


struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
//    var topColor: Color
//    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all) //This ignores all the safe area and fills it completely
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
//                    .background(.red)
//                    .frame(width: 200, height: 200) // This shows order of modifiers matter
    }
}


struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
        
    }
}

