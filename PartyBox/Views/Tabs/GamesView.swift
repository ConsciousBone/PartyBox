//
//  GamesView.swift
//  PartyBox
//
//  Created by Evan Plant on 03/12/2025.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        ContentUnavailableView(
            "Coming soon",
            systemImage: "gamecontroller",
            description: Text("Games are coming soon!")
        )
    }
}

#Preview {
    GamesView()
}
