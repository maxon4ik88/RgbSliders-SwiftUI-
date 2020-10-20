//
//  ColoredView.swift
//  HW3.2
//
//  Created by Maxon on 20.10.2020.
//

import SwiftUI

struct ColoredView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red, green: green, blue: blue)
            .frame(width: 340, height: 150)
            .cornerRadius(25)
            .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(Color.black, lineWidth: 5))
            .shadow(radius: 10)
    }
}

struct ColoredView_Previews: PreviewProvider {
    static var previews: some View {
        ColoredView(red: 1 / 4, green: 1 / 2, blue: 0)
    }
}
