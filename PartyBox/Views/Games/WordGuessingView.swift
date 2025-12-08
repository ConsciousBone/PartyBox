//
//  WordGuessingView.swift
//  PartyBox
//
//  Created by Evan Plant on 08/12/2025.
//

import SwiftUI

struct WordGuessingView: View {
    @State private var selectedWord = ""
    
    let words = [
        "Astronaut", "Kangaroo", "Pizza",
        "Superhero", "Pirate", "Dinosaur",
        "Robot", "Mermaid", "Detective",
        "Wizard", "Firefighter", "Vampire",
        "Princess", "Ninja", "Alien",
        "Magician", "Chef", "Dragon",
        "House", "Pan", "Orange"
    ]
    
    var body: some View {
        Form {
            Section {
                Text(selectedWord)
                    .font(.largeTitle.bold())
            }
            .onAppear(perform: shuffleWord)
            
            Section {
                Button {
                    withAnimation {
                        shuffleWord()
                    }
                } label: {
                    Label("Correct", systemImage: "checkmark")
                }
                
                Button {
                    withAnimation {
                        shuffleWord()
                    }
                } label: {
                    Label("Skip", systemImage: "chevron.forward")
                }
            }
        }
        .navigationTitle("Word guessing")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func shuffleWord() {
        selectedWord = words.randomElement() ?? "no words??"
    }
}

#Preview {
    WordGuessingView()
}
