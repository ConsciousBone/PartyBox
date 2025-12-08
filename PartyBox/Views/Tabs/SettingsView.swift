//
//  SettingsView.swift
//  PartyBox
//
//  Created by Evan Plant on 03/12/2025.
//

import SwiftUI

struct SettingsView: View {
    let appDisplayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? "PartyBox"
    
    @AppStorage("selectedAccentIndex") private var selectedAccentIndex = 5
    let accentColours = [
        Color.red.gradient, Color.orange.gradient,
        Color.yellow.gradient, Color.green.gradient,
        Color.mint.gradient, Color.blue.gradient,
        Color.purple.gradient, Color.brown.gradient,
        Color.white.gradient, Color.black.gradient
    ]
    let accentColorNames = [
        "Red", "Orange",
        "Yellow", "Green",
        "Mint", "Blue",
        "Purple", "Brown",
        "White", "Black"
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker(selection: $selectedAccentIndex) {
                        ForEach(accentColorNames.indices, id: \.self) { index in
                            Text(accentColorNames[index])
                        }
                    } label: {
                        Label("Accent colour", systemImage: "paintpalette")
                    }
                }
                
                Section {
                    NavigationLink {
                        AboutView()
                    } label: {
                        Label("About \(appDisplayName)", systemImage: "info.circle")
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingsView()
}
