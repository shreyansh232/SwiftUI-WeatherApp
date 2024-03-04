//
//  WeatherButton.swift
//  Weather
//
//  Created by Shreyansh Pandey on 04/03/24.
//

import SwiftUI
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
