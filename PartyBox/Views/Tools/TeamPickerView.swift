//
//  TeamPickerView.swift
//  PartyBox
//
//  Created by Evan Plant on 04/12/2025.
//

import SwiftUI

struct Team: Identifiable {
    var name: String
    var score: Int
    let id = UUID()
}

struct TeamPickerView: View {
    @State private var teams: [Team] = [
        Team(name: "Team 1", score: 0),
        Team(name: "Team 2", score: 0)
    ]
    
    @State private var isEditing = false
    
    var body: some View {
        Form {
            ForEach(teams) { team in
                Section {
                    VStack(alignment: .leading) {
                        Text(team.name)
                        Text("\(team.score)")
                    }
                }
            }
            .onDelete(perform: deleteTeam)
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
            
            if isEditing {
                ToolbarItem(placement: .automatic) {
                    Button {
                        teams.append(Team(name: "Team aaaa", score: 0))
                    } label: {
                        Label("Add team", systemImage: "plus")
                    }
                }
            }
        }
    }
    
    private func deleteTeam(at offsets: IndexSet) {
        withAnimation {
            teams.remove(atOffsets: offsets)
        }
    }
}

#Preview {
    NavigationStack {
        TeamPickerView()
    }
}
