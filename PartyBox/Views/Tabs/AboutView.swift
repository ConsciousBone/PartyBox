//
//  AboutView.swift
//  PartyBox
//
//  Created by Evan Plant on 03/12/2025.
//

import SwiftUI

struct AboutView: View {
    let appDisplayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? "PartyBox"
    let appVersionName = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "unknown"
    let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "unknown"
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        Form {
            Section {
                Text(appDisplayName)
                    .font(.largeTitle)
                Text("Version \(appVersionName) build \(buildNumber)")
            }
            
            Section {
                Text("Developed for Hack Club's Siege Week 13, following a theme of \"Party\".")
                
                Button {
                    print("opening url")
                    if #available(iOS 26, *) {
                        openURL(URL(string: "https://hackclub.com/")!, prefersInApp: true)
                    } else {
                        openURL(URL(string: "https://hackclub.com/")!)
                    }
                } label: {
                    Label("Learn more about Hack Club", systemImage: "terminal")
                }
                
                Button {
                    print("opening url")
                    if #available(iOS 26, *) {
                        openURL(URL(string: "https://siege.hackclub.com/")!, prefersInApp: true)
                    } else {
                        openURL(URL(string: "https://siege.hackclub.com/")!)
                    }
                } label: {
                    Label("Learn more about Siege", systemImage: "crown")
                }
            }
            
            Section {
                Text("This app is fully open source! You can see its source code on GitHub.")
                
                Button {
                    print("opening url")
                    if #available(iOS 26, *) {
                        openURL(URL(string: "https://github.com/ConsciousBone/PartyBox/")!, prefersInApp: true)
                    } else {
                        openURL(URL(string: "https://github.com/ConsciousBone/PartyBox/")!)
                    }
                } label: {
                    Label("Open GitHub repository", systemImage: "terminal")
                }
            }
        }
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AboutView()
}
