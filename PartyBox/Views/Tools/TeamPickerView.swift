//
//  TeamPickerView.swift
//  PartyBox
//
//  Created by Evan Plant on 04/12/2025.
//

import SwiftUI

struct Team {
    var name: String
    var score: Int
}

struct TeamPickerView: View {
    @State private var teamCount = 2
    @State private var teams: [Team] = []
    
    @State private var isEditing = false
    
    var body: some View {
        Form {
            if isEditing {
                Section {
                    Stepper(value: $teamCount, in: 1...4) {
                        Label("\(teamCount) teams", systemImage: "person.3")
                    }
                } header: {
                    Text("Team count")
                }
            }
            
            ForEach(teams.indices, id: \.self) { index in
                Section {
                    Text(teams[index].name)
                    Text("\(teams[index].score)")
                }
            }
            Button("add") {
                teams.append(Team(name: "New team", score: 0))
            }
        }
        .navigationTitle("Team picker")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    withAnimation {
                        isEditing.toggle()
                    }
                } label: {
                    if isEditing {
                        Label("Stop editing", systemImage: "pencil.slash")
                    } else {
                        Label("Edit", systemImage: "pencil")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        TeamPickerView()
    }
}
