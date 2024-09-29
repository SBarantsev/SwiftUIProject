//
//  ContentView.swift
//  SwiftUIProjekt
//
//  Created by Sergey on 26.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            InfoView(posts: PostData.posts)
                .tabItem {
                    Label("Info", systemImage: "film.circle")
                }
            
            HelloView()
                .tabItem {
                    Label("Hello", systemImage: "face.smiling")
                }
            
            SettingsView()
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
