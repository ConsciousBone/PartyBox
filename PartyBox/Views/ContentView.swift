//
//  ContentView.swift
//  PartyBox
//
//  Created by Evan Plant on 03/12/2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedAccentIndex") private var selectedAccentIndex = 5
    let accentColours = [
        Color.red.gradient, Color.orange.gradient,
        Color.yellow.gradient, Color.green.gradient,
        Color.mint.gradient, Color.blue.gradient,
        Color.purple.gradient, Color.brown.gradient,
        Color.white.gradient, Color.black.gradient
    ]
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            
            Tab("Tools", systemImage: "wrench") {
                ToolsView()
            }
            
            Tab("Games", systemImage: "gamecontroller") {
                GamesView()
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
        }
        .tint(accentColours[selectedAccentIndex])
    }
}

#Preview {
    ContentView()
}
