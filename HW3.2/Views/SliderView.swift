//
//  SliderView.swift
//  HW3.2
//
//  Created by Maxon on 19.10.2020.
//

import SwiftUI


struct SliderView: View {
    let color: Color
    
    @Binding var value: Double
    
    @State private var alertText = "Please, enter valid number in 0...255"
    @State private var textValue: String = ""
    @State private var showAlert = false
    
    private let minValue: Double = 0
    private let maxValue: Double = 255
    
    
    var body: some View {
        HStack(spacing: 1) {
            HStack {
                Text("\(Int(minValue))").foregroundColor(color)
                
                Slider(value: Binding(
                        get: { self.value },
                        set: { (newValue) in
                            
                            self.value = newValue
                            self.textValue = "\(Int(newValue))"
                            
                        }), in: minValue...maxValue, step: 1)
                    .accentColor(color)
                
                Text("\(Int(maxValue))").foregroundColor(color)
            }
            
            TextField("\(Int(maxValue))", text: Binding(
                        get: { "\(Int(self.value))" },
                        set: { (newValue) in
                            self.textValue = newValue
                        }), onCommit:  { checkValue(newValue: textValue) })
                
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Wrong value!"), message: Text(alertText))
                })
                
                .font(.headline)
                .frame(width: 47, height: 30)
                .multilineTextAlignment(.trailing)
                .border(Color.black, width: 1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .border(color, width: 2)
    }
}

extension SliderView {
    private func checkValue(newValue: String?) {
        if newValue == nil || newValue == "" {
            self.showAlert = false
            return
        }
        guard let newValue = Double(newValue!) else {
            self.showAlert = true
            self.textValue = ""
            return
        }
        switch newValue {
        case minValue...maxValue:
            self.value = newValue
        default:
            showAlert = true
            self.textValue = ""
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(color: .gray, value: .constant(0.5))
    }
}
