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
    
    @State private var isPromptHidden = false
    
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
                    .redacted(reason: isPromptHidden ? .placeholder : [])
                
                Button {
                    withAnimation {
                        getRandomPrompt()
                    }
                } label: {
                    Label("Shuffle", systemImage: "shuffle")
                }
                
                Button {
                    withAnimation {
                        isPromptHidden.toggle()
                    }
                } label: {
                    if isPromptHidden {
                        Label("Unhide", systemImage: "eye.slash")
                    } else {
                        Label("Hide", systemImage: "eye")
                    }
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
