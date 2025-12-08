//
//  ScoreboardView.swift
//  PartyBox
//
//  Created by Evan Plant on 04/12/2025.
//

import SwiftUI

struct ScoreboardTeam: Identifiable {
    var name: String
    var score: Int
    let id = UUID()
}

struct ScoreboardView: View {
    @State private var teams: [ScoreboardTeam] = [
        ScoreboardTeam(name: "Team 1", score: 0),
        ScoreboardTeam(name: "Team 2", score: 0)
    ]
    
    @State private var isEditing = false
    
    var body: some View {
        if teams.isEmpty {
            ContentUnavailableView {
                Label("No teams", systemImage: "person.3")
            } description: {
                Text("You have no teams.")
            } actions: {
                Button {
                    withAnimation {
                        teams.append(ScoreboardTeam(name: "Team \(teams.count + 1)", score: 0))
                    }
                } label: {
                    Label("Add team", systemImage: "plus")
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Scoreboard")
            .navigationBarTitleDisplayMode(.inline)
        } else {
            Form {
                ForEach($teams) { $team in
                    Section {
                        HStack(alignment: .center, spacing: 10) {
                            Spacer()
                            
                            Button {
                                team.score -= 1
                            } label: {
                                Label("-1", systemImage: "minus")
                                    .frame(width: 30, height: .infinity)
                                    .contentShape(Rectangle())
                            }
                            .padding()
                            
                            VStack(alignment: .center, spacing: 7) {
                                if isEditing {
                                    TextField("", text: $team.name)
                                        .multilineTextAlignment(.center)
                                    // no clue why the buttons socially distance with this
                                } else {
                                    Text(team.name)
                                }
                                Text("\(team.score)")
                                    .font(.title)
                            }
                            
                            Button {
                                team.score += 1
                            } label: {
                                Label("+1", systemImage: "plus")
                                    .frame(width: 30, height: .infinity)
                                    .contentShape(Rectangle())
                            }
                            .padding()
                            
                            Spacer()
                        }
                    }
                    .buttonStyle(.borderless)
                    .labelStyle(.iconOnly)
                }
                .onDelete(perform: deleteTeam)
            }
            .navigationTitle("Scoreboard")
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
                            withAnimation {
                                teams.append(ScoreboardTeam(name: "Team \(teams.count + 1)", score: 0))
                            }
                        } label: {
                            Label("Add team", systemImage: "plus")
                        }
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
        ScoreboardView()
    }
}
