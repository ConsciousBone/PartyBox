//
//  TruthDareView.swift
//  PartyBox
//
//  Created by Evan Plant on 08/12/2025.
//

import SwiftUI

struct TruthDareView: View {
    @State private var selectedQuestion = "Select Truth or Dare."
    
    let truths = [
        "What’s the strangest thing you believed as a child?",
        "What’s your most embarrassing moment you’ll admit publicly?",
        "What’s a food you pretend to like but secretly hate?",
        "Who in this room would you trust to hide a body?",
        "If you had to move country tomorrow, where would you go?",
        "What’s the worst text you’ve ever sent to the wrong person?",
        "What habit of yours annoys people the most?",
        "What’s something you’ve done that you’ll never do again?",
        "What’s your biggest irrational fear?",
        "What’s the most ridiculous lie you’ve told someone?"
    ]
    let dares = [
        "Speak in an accent of the group’s choice for the next 30 seconds.",
        "Do the worst dance move you can think of.",
        "Try to lick your elbow.",
        "Attempt a tongue twister chosen by the group.",
        "Let someone else send a text message from your phone.",
        "Eat a spoonful of something chosen by the group.",
        "Pretend you’re a news presenter and report on something ridiculous.",
        "Do five animal impressions in a row.",
        "Act out a movie scene without speaking.",
        "Hold a plank for 20 seconds."
    ]
    
    var body: some View {
        Form {
            Section {
                HStack(alignment: .center) {
                    Spacer()
                    
                    Button {
                        selectedQuestion = truths.randomElement() ?? "no truths??"
                    } label: {
                        Label("Truth", systemImage: "bubble")
                    }
                    .frame(width: .infinity)
                    
                    Spacer()
                    Divider()
                    Spacer()
                    
                    Button {
                        selectedQuestion = dares.randomElement() ?? "no dares??"
                    } label: {
                        Label("Dare", systemImage: "bolt")
                    }
                    .frame(width: .infinity)
                    
                    Spacer()
                }
            }
            
            Section {
                Text(selectedQuestion)
                    .font(.largeTitle.bold())
            }
        }
        .navigationTitle("Truth or dare")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    TruthDareView()
}
