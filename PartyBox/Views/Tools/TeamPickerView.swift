//
//  TeamPickerView.swift
//  PartyBox
//
//  Created by Evan Plant on 04/12/2025.
//

import SwiftUI

struct Team {
    var name: String
    var score: Int
}

struct TeamPickerView: View {
    @State private var teams: [Team] = []
    
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    TeamPickerView()
}
