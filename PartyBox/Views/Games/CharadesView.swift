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
        "Zombie", "Lighthouse", "Pirate",
        "Sleeping", "Running", "Music",
        "Math", "Ocean", "Mime",
        "Piano", "Small", "Drums"
    ]
    let phrases = [
        "Walking a dog", "Climbing a ladder", "Washing a car",
        "Flying a kite", "Riding a bike", "Watering the plants",
        "Washing the dishes", "Brushing your teeth", "Driving a car",
        "Writing an essay", "Cooking a meal", "Building a campfire",
        "Counting sheep", "Washing a car", "Painting a picture"
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
            
            Section {
                Toggle(isOn: $isUsingWords) {
                    Label("Words", systemImage: "characters.lowercase")
                }
                
                Toggle(isOn: $isUsingPhrases) {
                    Label("Phrases", systemImage: "text.justify.leading")
                }
            } header: {
                Text("Include")
            }
        }
        .navigationTitle("Charades")
        .navigationBarTitleDisplayMode(.inline)
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
