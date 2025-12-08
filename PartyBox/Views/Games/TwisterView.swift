//
//  TwisterView.swift
//  PartyBox
//
//  Created by Evan Plant on 08/12/2025.
//

import SwiftUI

struct TwisterView: View {
    @State private var selectedColour = ""
    @State private var selectedMove = ""
    
    let colours = [
        "Red", "Green", "Yellow", "Blue"
    ]
    let moves = [
        "Left foot", "Right foot",
        "Left hand", "Right hand"
    ]
    
    var body: some View {
        Form {
            Section {
                Text(selectedMove)
                    .font(.largeTitle.bold())
            } header: {
                Text("Move")
            }
            
            Section {
                Text(selectedColour)
                    .font(.largeTitle.bold())
            } header: {
                Text("Colour")
            }
            
            Section {
                Button {
                    withAnimation {
                        spinWheel()
                    }
                } label: {
                    Label("Spin", systemImage: "arrow.triangle.2.circlepath")
                }
            }
            .onAppear(perform: spinWheel)
        }
        .navigationTitle("Twister")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func spinWheel() {
        selectedMove = moves.randomElement() ?? "no moves???"
        selectedColour = colours.randomElement() ?? "no colours???"
    }
}

#Preview {
    TwisterView()
}
