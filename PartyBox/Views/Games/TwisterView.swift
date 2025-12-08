//
//  TwisterView.swift
//  PartyBox
//
//  Created by Evan Plant on 08/12/2025.
//

import SwiftUI

struct TwisterView: View {
    let colours = [
        "Red", "Green", "Yellow", "Blue"
    ]
    let move = [
        "Left foot", "Right foot",
        "Left hand", "Right hand"
    ]
    
    var body: some View {
        Form {
            Section {
                Text("move")
                    .font(.largeTitle.bold())
            } header: {
                Text("Move")
            }
            
            Section {
                Text("colour")
                    .font(.largeTitle.bold())
            } header: {
                Text("Colour")
            }
            
            Section {
                Button {
                    print("aa")
                } label: {
                    Label("Spin", systemImage: "arrow.triangle.2.circlepath")
                }
            }
        }
    }
}

#Preview {
    TwisterView()
}
