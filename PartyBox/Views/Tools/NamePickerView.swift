//
//  NamePickerView.swift
//  PartyBox
//
//  Created by Evan Plant on 04/12/2025.
//

import SwiftUI

struct NamePickerView: View {
    @State private var names: [String] = []
    
    var body: some View {
        Form {
            Section {
                ForEach(names.indices, id: \.self) { index in
                    Text(names[index])
                }
                .onDelete(perform: deleteName) // remove the item
                Button {
                    withAnimation {
                        names.append("New name")
                    }
                } label: {
                    Label("Add name", systemImage: "plus")
                }
            } header: {
                Text("Names (\(names.count))")
            }
        }
    }
    
    private func deleteName(at offsets: IndexSet) {
        withAnimation {
            names.remove(atOffsets: offsets)
        }
    }
}

#Preview {
    NamePickerView()
}
