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
            ExtractedView() //This ignores all the safe area and fills it completely
            VStack{
                Text("Hisar, Haryana")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
//                    .background(.red)
//                    .frame(width: 200, height: 200) // This shows order of modifiers matter
                
                VStack(spacing: 8){
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("18°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
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
                    Text("Switch")
                        .frame(width: 200, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(15)
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
    var body: some View {
        var topColor: Color
        var bottomColor: Color
        
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
