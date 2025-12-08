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
        Text("Coin flip")
    }
}

#Preview {
    CoinFlipView()
}
