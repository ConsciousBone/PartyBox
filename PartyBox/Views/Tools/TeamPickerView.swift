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
        if teams.isEmpty {
            ContentUnavailableView {
                Label("No teams", systemImage: "person.3")
            } description: {
                Text("You have no teams.")
            } actions: {
                Button {
                    withAnimation {
                        teams.append(PickerTeam(
                            teamName: "Team 1",
                            names: ["Name 1", "Name 2"]
                        ))
                    }
                } label: {
                    Label("Add team", systemImage: "plus")
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Team organiser")
            .navigationBarTitleDisplayMode(.inline)
        } else {
            Form {
                ForEach($teams) { $team in
                    Section {
                        Text(team.teamName)
                            .font(.title)

                        ForEach(team.names, id: \.self) { name in
                            Text(name)
                        }
                        
                        Button {
                            team.names.append("Name \(team.names.count + 1)")
                        } label: {
                            Label("Add name", systemImage: "plus")
                        }
                    }
                }
            }
            .navigationTitle("Team organiser")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        withAnimation {
                            teams.append(PickerTeam(
                                teamName: "Team???",
                                names: ["Name 1", "Name 2"]
                            ))
                        }
                    } label: {
                        Label("Add team", systemImage: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    TeamPickerView()
}
