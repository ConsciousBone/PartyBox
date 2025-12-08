//
//  GamesView.swift
//  PartyBox
//
//  Created by Evan Plant on 03/12/2025.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink {
                        CharadesView()
                    } label: {
                        Label("Charades", systemImage: "theatermasks")
                    }
                }
                
                Section {
                    NavigationLink {
                        TwisterView()
                    } label: {
                        Label("Twister", systemImage: "arrow.triangle.2.circlepath")
                    }
                }
                
                Section {
                    NavigationLink {
                        WordGuessingView()
                    } label: {
                        Label("Word guessing", systemImage: "characters.lowercase")
                    }
                }
                
                Section {
                    NavigationLink {
                        TruthDareView()
                    } label: {
                        Label("Truth or dare", systemImage: "questionmark")
                    }
                }
            }
            .navigationTitle("Games")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    GamesView()
}
