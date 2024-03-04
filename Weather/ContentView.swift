//
//  ContentView.swift
//  Weather
//
//  Created by Shreyansh Pandey on 04/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightblue"))
            VStack{
                CityTextView(cityName: "Hisar, Haryana")
                
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 18)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.rain.fill", temperature: 8)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.haze.fill", temperature: 10)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 5)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "snowflake", temperature: -1)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.moon.rain.fill", temperature: 4)
                    }
                Spacer()//Fill the entire space
                
                Button{
                    print("tapped")
                    
                } label: {
                    WeatherButton(title: "Switch", textColor: .blue, backgroundColor: .white)
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
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
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
struct WeatherButton: View{
    var title: String
    var textColor: Color //We have assigned Color to our custom color(lightblue)
    var backgroundColor: Color
    var body: some View{
        Text(title)
            .frame(width: 200, height: 50)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(15)
    }
}
