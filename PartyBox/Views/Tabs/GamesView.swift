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
            }
            .navigationTitle("Games")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    GamesView()
}
