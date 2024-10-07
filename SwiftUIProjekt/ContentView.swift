//
//  ContentView.swift
//  SwiftUIProjekt
//
//  Created by Sergey on 26.09.2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("titleOn") private var titleOn = true
    @AppStorage("rowHeight") var rowHeight: Double = 40.0
    @StateObject var filmStore = FilmStore()
    
    var body: some View {
        TabView() {
            InfoView(titleOn: titleOn, rowHeight: $rowHeight, posts: FilmStore().films)
                .tabItem {
                    Label("Info", systemImage: "film.circle")
                }
            
            QuizView()
                .tabItem {
                    Label("Quiz", systemImage: "questionmark.video")
                }
            
            SettingsView(titleOn: $titleOn, rowHeight: $rowHeight)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
