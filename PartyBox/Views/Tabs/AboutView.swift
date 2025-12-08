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
    
    var body: some View {
        Form {
            Section {
                Text(appDisplayName)
                    .font(.largeTitle)
                Text("Version \(appVersionName) build \(buildNumber)")
            }
        }
    }
}

#Preview {
    AboutView()
}
