//
//  ContentView.swift
//  HW3.2
//
//  Created by Maxon on 19.10.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue: Double = Double.random(in: 0...255)
    @State private var greenValue: Double = Double.random(in: 0...255)
    @State private var blueValue: Double = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 0.9843232722, blue: 0.405119152, alpha: 1))
                .ignoresSafeArea()
            VStack {
                ColoredView(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255)
                Spacer()
                SliderView(color: .red, value: $redValue)
                SliderView(color: .green, value: $greenValue)
                SliderView(color: .blue, value: $blueValue)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
