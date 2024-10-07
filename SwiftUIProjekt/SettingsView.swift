//
//  SettingsView.swift
//  SwiftUIProjekt
//
//  Created by Sergey on 27.09.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isToggleOn = false
//    @State private var value = 50.0
    @State private var isEditing = false
    @State private var selectedPicker = "text_1"
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var titleOn: Bool
    @Binding var rowHeight: Double
    
    let pickerArray = ["text_1", "text_2", "text_3"]
    
    var body: some View {
        Form {
            Section(header: Text("Text section")) {
                Text(colorScheme == .light ? "Light Theme enabled" : "Dark Theme enabled")
            }
            
            Section(header: Text("Toggle section")) {
                Toggle("Show title list", isOn: $titleOn)
                if titleOn {
                    Text("Navigation title enabled")
                    
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
                        value: $rowHeight,
                        in: 40...80,
                        step: 1,
                        onEditingChanged: { editing in
                            isEditing = editing
                        }
                    )
                    
                    Text("\(Int(rowHeight))")
                    if isEditing {
                        InfoRow(post: FilmStore().films[1], rowHeight: $rowHeight)
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(titleOn: .constant(true), rowHeight: .constant(40))
//                SettingsView(titleOn: .constant(false))
    }
}
