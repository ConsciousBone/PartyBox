//
//  ToolsView.swift
//  PartyBox
//
//  Created by Evan Plant on 03/12/2025.
//

import SwiftUI

struct ToolsView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink {
                        NamePickerView()
                    } label: {
                        Label("Name picker", systemImage: "textformat.abc")
                    }
                }
                
                Section {
                    NavigationLink {
                        TeamPickerView()
                    } label: {
                        Label("Team organiser", systemImage: "person.3")
                    }
                }
                
                Section {
                    NavigationLink {
                        TimerView()
                    } label: {
                        Label("Timer", systemImage: "timer")
                    }
                }
                
                Section {
                    NavigationLink {
                        ScoreboardView()
                    } label: {
                        Label("Scoreboard", systemImage: "rectangle.split.2x1")
                    }
                }
            }
            .navigationTitle("Tools")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ToolsView()
}
