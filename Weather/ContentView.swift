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
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Hisar, Haryana")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: isNight ? 10 : 18)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.rain.fill", temperature: 8)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.haze.fill", temperature: 10)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 5)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "snowflake", temperature: -1)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill", temperature: 10)
                    }
                Spacer()//Fill the entire space
                
                Button{
                    isNight.toggle()
                    
                } label: {
                    WeatherButton(title: isNight ? "Night" : "Switch", textColor: .blue, backgroundColor: .white)
                }
//                .overlay(
//                    RoundedRectangle(cornerRadius: 15)
//                        .stroke(Color.black, lineWidth: 0.5)
//                )
                Spacer()
                
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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

