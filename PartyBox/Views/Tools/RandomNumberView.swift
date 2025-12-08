//
//  RandomNumberView.swift
//  PartyBox
//
//  Created by Evan Plant on 08/12/2025.
//

import SwiftUI

struct RandomNumberView: View {
    @State private var minimumValue = 1
    @State private var maximumValue = 10
    
    @State private var randomNumber = 4
    
    var body: some View {
        Form {
            Section {
                Stepper(
                    value: $minimumValue,
                    in: 1...100
                ) {
                    Label("Minimum value: \(minimumValue)", systemImage: "minus")
                }
                
                Stepper(
                    value: $maximumValue,
                    in: 1...100
                ) {
                    Label("Maximum value: \(maximumValue)", systemImage: "plus")
                }
            }
            
            Section {
                Button {
                    withAnimation {
                        randomiseNumber()
                    }
                } label: {
                    Label("Randomise", systemImage: "shuffle")
                }
            }
            
            Section {
                Text("\(randomNumber)")
                    .font(.largeTitle.bold().monospaced())
            }
            .onAppear(perform: randomiseNumber)
        }
        .navigationTitle("Random number")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func randomiseNumber() {
        randomNumber = Int.random(in: minimumValue...maximumValue)
    }
}

#Preview {
    RandomNumberView()
}
