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
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all) //This ignores all the safe area and fills it completely
            VStack{
                Text("Hisar, Haryana")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
//                    .background(.red)
//                    .frame(width: 200, height: 200) // This shows order of modifiers matter
                Spacer()//Fill the entire space
                
                
                
                
                
                
                
            }
            
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
