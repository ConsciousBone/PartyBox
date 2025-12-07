//
//  StopwatchView.swift
//  PartyBox
//
//  Created by Evan Plant on 04/12/2025.
//

// ty random internet tutorial!
// https://ampersandsoftworks.com/posts/building-a-stopwatch-and-timer-using-xcode16s-new-systemformatstyle/

import SwiftUI

struct StopwatchView: View {
    @State private var startDate: Date?
    @State private var isAnimationPaused = true
    @State private var lastUpdate: Date?
    
    var body: some View {
        switch isAnimationPaused {
        case true:
            Text(Date.now, format: .stopwatch(startingAt: startDate ?? .now))
                .font(.largeTitle)
        case false:
            Text(TimeDataSource<Date>.currentDate, format: .stopwatch(startingAt: startDate ?? .now))
                .font(.largeTitle)
        }
        
        HStack {
            Button("Start") {
                startDate = .now
                isAnimationPaused = false
            }
            .buttonStyle(.bordered)
            .tint(.green)
            .disabled(isAnimationPaused == false)
            
            Button("Stop") {
                isAnimationPaused = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .disabled(isAnimationPaused)
            
            Button("Reset") {
                isAnimationPaused = true
                startDate = .now
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .disabled(isAnimationPaused == false)
        }
    }
}

#Preview {
    StopwatchView()
}
