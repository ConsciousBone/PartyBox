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
        VStack {
            Spacer()
            
            switch isAnimationPaused {
            case true:
                Text(Date.now, format: .stopwatch(startingAt: startDate ?? .now))
                    .font(.system(size: 50).monospaced().bold())
            case false:
                Text(TimeDataSource<Date>.currentDate, format: .stopwatch(startingAt: startDate ?? .now))
                    .font(.system(size: 50).monospaced().bold())
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button {
                    startDate = .now
                    isAnimationPaused = false
                } label: {
                    Circle()
                        .foregroundStyle(!isAnimationPaused ? Color.gray.gradient : Color.green.gradient)
                        .frame(width: 90, height: 90)
                        .overlay {
                            Text("Start")
                                .foregroundStyle(.background)
                        }
                }
                .tint(.green)
                .disabled(isAnimationPaused == false)
                
                Spacer()
                
                Button {
                    isAnimationPaused = true
                } label: {
                    Circle()
                        .foregroundStyle(isAnimationPaused ? Color.gray.gradient : Color.red.gradient)
                        .frame(width: 90, height: 90)
                        .overlay {
                            Text("Stop")
                                .foregroundStyle(.background)
                        }
                }
                .tint(.red)
                .disabled(isAnimationPaused)
                
                Spacer()
                
                Button {
                    isAnimationPaused = true
                    startDate = .now
                } label: {
                    Circle()
                        .foregroundStyle(!isAnimationPaused ? Color.gray.gradient : Color.blue.gradient)
                        .frame(width: 90, height: 90)
                        .overlay {
                            Text("Reset")
                                .foregroundStyle(.background)
                        }
                }
                .tint(.blue)
                .disabled(isAnimationPaused == false)
                
                Spacer()
            }
            
            Spacer()
        }
    }
}

#Preview {
    StopwatchView()
}
