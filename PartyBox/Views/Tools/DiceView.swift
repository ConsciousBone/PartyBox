//
//  DiceView.swift
//  PartyBox
//
//  Created by Evan Plant on 08/12/2025.
//

import SwiftUI

struct DiceView: View {
    @State private var diceRollValue: [Int] = [3]
    @State private var diceAmount = 1
    
    var body: some View {
        Form {
            Section {
                Stepper(
                    value: $diceAmount,
                    in: 1...10
                ) {
                    Label("Amount of die: \(diceAmount)", systemImage: "dice")
                }
                .onChange(of: diceAmount) {_, newValue in
                    if diceRollValue.count < newValue {
                        diceRollValue.append(contentsOf: Array(repeating: 1, count: newValue - diceRollValue.count))
                    } else if diceRollValue.count > newValue {
                        diceRollValue.removeLast(diceRollValue.count - newValue)
                    }
                    rollDices()
                }
                
                Button {
                    rollDices()
                } label: {
                    Label("Roll dice", systemImage: "die.face.5")
                }
            }
            .onAppear(perform: rollDices)
            
            
            ForEach(diceRollValue.indices, id: \.self) { index in
                Section {
                    HStack {
                        Spacer()
                        VStack {
                            Text("Die \(index + 1) - \(diceRollValue[index])")
                                .font(.headline)
                            Image(systemName: "die.face.\(diceRollValue[index])")
                                .padding(5)
                                .font(.system(size: 150))
                        }
                        Spacer()
                    }
                }
                .listRowSeparator(.hidden)
            }
        }
        .navigationTitle("Dice")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func rollDices() {
        for i in 0..<diceRollValue.count {
            diceRollValue[i] = Int.random(in: 1...6)
        }
    }
}

#Preview {
    DiceView()
}
