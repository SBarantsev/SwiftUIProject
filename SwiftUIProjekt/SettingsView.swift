//
//  SettingsView.swift
//  SwiftUIProjekt
//
//  Created by Sergey on 27.09.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isToggleOn = false
    @State private var value = 50.0
    @State private var isEditing = false
    @State private var selectedPicker = "text_1"
    
    let pickerArray = ["text_1", "text_2", "text_3"]
    
    var body: some View {
        Form {
            Section(header: Text("Text section")) {
                Text("text")
            }
            Section(header: Text("Toggle section")) {

                    Toggle(isOn: $isToggleOn) {
                        Text(isToggleOn ? "ON" : "OFF")
                }
            }

            Section(header: Text("Picker section")) {
                VStack {
                    Text("Выберите из списка:")
                        .font(.headline)
                    
                    Picker("Список", selection: $selectedPicker) {
                        ForEach(pickerArray, id: \.self) {value in
                            Text(value).tag(value)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())

                    Text("Выбранный элемент: \(selectedPicker)")
                        .font(.subheadline)
                }
            }
  
            Section(header: Text("Slider section")) {
                VStack {
                    Slider (
                        value: $value,
                        in: 0...100,
                        step: 1
                    )
                    
                    Text("\(value)")
                        .foregroundColor(isEditing ? .red : .blue)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
