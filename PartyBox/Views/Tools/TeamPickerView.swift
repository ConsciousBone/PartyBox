//
//  TeamPickerView.swift
//  PartyBox
//
//  Created by Evan Plant on 06/12/2025.
//

import SwiftUI

struct PickerTeam: Identifiable {
    var teamName: String
    var names: [String]
    let id = UUID()
}

struct TeamPickerView: View {
    @State private var teams: [PickerTeam] = []
    var body: some View {
        Text("Team picker view")
    }
}

#Preview {
    TeamPickerView()
}
