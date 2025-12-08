//
//  CharadesView.swift
//  PartyBox
//
//  Created by Evan Plant on 08/12/2025.
//

import SwiftUI

struct CharadesView: View {
    @State private var isUsingWords = true
    @State private var isUsingPhrases = true
    
    @State private var selectedPrompt = ""
    
    let words = [
        "Spaceship", "Elephant", "Guitar",
        "Zombie", "Lighthouse", "Pirate"
    ]
    let phrases = [
        "Walking a dog", "Climbing a ladder", "Washing a car",
        "Flying a kite", "Riding a bike", "Watering the plants"
    ]
    
    var body: some View {
        Form {
            Section {
                Text(selectedPrompt)
                    .font(.largeTitle.bold())
                
                Button {
                    getRandomPrompt()
                } label: {
                    Label("Shuffle", systemImage: "shuffle")
                }
            } header: {
                Text("Prompt")
            }
            .onAppear(perform: getRandomPrompt)
        }
    }
    
    private func getRandomPrompt() {
        var promptPool: [String] = []
        if isUsingWords {
            promptPool += words
        }
        if isUsingPhrases {
            promptPool += phrases
        }
        
        if promptPool.isEmpty {
            selectedPrompt = ""
            return
        }
        
        if let choice = promptPool.randomElement() {
            selectedPrompt = choice
        } else {
            selectedPrompt = "No prompt"
        }
    }
}

#Preview {
    CharadesView()
}
