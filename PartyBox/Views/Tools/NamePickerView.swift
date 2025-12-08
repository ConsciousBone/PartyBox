//
//  NamePickerView.swift
//  PartyBox
//
//  Created by Evan Plant on 04/12/2025.
//

import SwiftUI

struct NamePickerView: View {
    @State private var names: [String] = []
    
    @State private var isEditing = false
    
    @State private var randomName = ""
    
    var body: some View {
        Form {
            Section {
                ForEach(names.indices, id: \.self) { index in
                    if isEditing {
                        TextField("", text: $names[index])
                    } else {
                        Text(names[index])
                    }
                }
                .onDelete(perform: deleteName) // remove the item
                
                if names.isEmpty {
                    Text("No names, add some in edit mode!")
                }
                
                if isEditing {
                    Button {
                        withAnimation {
                            names.append("New name")
                        }
                    } label: {
                        Label("Add name", systemImage: "plus")
                    }
                }
            } header: {
                Text("Names (\(names.count))")
            }
            
            Section {
                Text(randomName.isEmpty ? "No name" : randomName)
                    .font(.largeTitle)
                
                
                Button {
                    randomName = names.randomElement() ?? "No name"
                } label: {
                    Label("Shuffle", systemImage: "shuffle")
                }
                .disabled(names.isEmpty)
            }
        }
        .navigationTitle("Name picker")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    withAnimation {
                        isEditing.toggle()
                    }
                } label: {
                    if isEditing {
                        Label("Stop editing", systemImage: "pencil.slash")
                    } else {
                        Label("Edit", systemImage: "pencil")
                    }
                }
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
