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
        }
    }
}

#Preview {
    RandomNumberView()
}
