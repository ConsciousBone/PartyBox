//
//  CoinFlipView.swift
//  PartyBox
//
//  Created by Evan Plant on 08/12/2025.
//

import SwiftUI

struct CoinFlipView: View {
    @State private var selectedSide = ""
    
    let sides = ["Heads", "Tails"]
    
    var body: some View {
        Form {
            Section {
                Text(selectedSide)
                    .font(.largeTitle.bold())
            }
            .onAppear(perform: flipCoin)
            
            Section {
                Button {
                    flipCoin()
                } label: {
                    Label("Flip coin", systemImage: "arrow.trianglehead.clockwise.rotate.90")
                }
            }
        }
        .navigationTitle("Coin flip")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func flipCoin() {
        selectedSide = sides.randomElement() ?? "no sides??"
    }
}

#Preview {
    CoinFlipView()
}
