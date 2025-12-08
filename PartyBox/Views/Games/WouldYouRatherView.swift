//
//  WouldYouRatherView.swift
//  PartyBox
//
//  Created by Evan Plant on 08/12/2025.
//

import SwiftUI

struct WouldYouRatherView: View {
    @State private var option1 = ""
    @State private var option2 = ""
    
    let options = [
        "Be able to fly", "Be invisible", "Breathe underwater",
        "Run at super speed", "Talk to animals", "Speak every language",
        "Live in space", "Live under the sea", "Never feel cold",
        "Never feel hot", "Eat anything without getting full",
        "Never need sleep", "Have perfect memory",
        "Have unlimited free travel", "Have unlimited free food",
        "Always be early", "Always be lucky", "Read minds",
        "Time travel once", "Pause time whenever you want",
        "Fight one horse-sized duck", "Fight one hundred duck-sized horses",
        "Lose your phone", "Lose your wallet",
        "Never listen to music again", "Never watch films again",
        "Meet your future self", "Meet your past self",
        "Live in a tiny house", "Live in a massive mansion",
        "Have perfect vision", "Have perfect hearing",
        "Only whisper forever", "Only shout forever",
        "Have a pet dragon", "Have a pet unicorn",
        "Be the funniest person in the room", "Be the smartest person in the room",
        "Live without the internet", "Live without your favourite food"
    ]
    
    var body: some View {
        Form {
            Section {
                Text("Would you rather...")
                Text(option1)
                    .font(.headline)
                Text("or")
                Text(option2)
                    .font(.headline)
            }
            .onAppear(perform: shuffleOptions)
            .listRowSeparator(.hidden)
            
            Section {
                Button {
                    withAnimation {
                        shuffleOptions()
                    }
                } label: {
                    Text(option1)
                }
                
                Button {
                    withAnimation {
                        shuffleOptions()
                    }
                } label: {
                    Text(option2)
                }
            }
        }
        .navigationTitle("Would you rather")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func shuffleOptions() {
        option1 = options.randomElement() ?? "no options??"
        option2 = options.randomElement() ?? "no options??"
    }
}

#Preview {
    WouldYouRatherView()
}
