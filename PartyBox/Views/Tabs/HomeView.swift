//
//  HomeView.swift
//  PartyBox
//
//  Created by Evan Plant on 03/12/2025.
//

import SwiftUI

struct HomeView: View {
    let appDisplayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? "PartyBox"
    let appVersionName = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "unknown"
    let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "unknown"
    
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 3..<12:
            return "Good morning!"
        case 12..<17:
            return "Good afternoon!"
        default:
            return "Good evening!"
        }
    }
    
    var body: some View {
        Form {
            Section {
                Text(greeting)
                    .font(.largeTitle)
            } header: {
                Text("\(appDisplayName) - version \(appVersionName) build \(buildNumber)")
            }
        }
    }
}

#Preview {
    HomeView()
}
