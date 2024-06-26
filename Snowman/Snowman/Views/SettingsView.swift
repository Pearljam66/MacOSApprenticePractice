//
//  SettingsView.swift
//  Snowman
//
//  Created by Sarah Clark on 4/24/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("minWordLength") var minWordLength = 4
    @AppStorage("maxWordLength") var maxWordLength = 10.0
    @AppStorage("useProperNouns") var useProperNouns = false

    var body: some View {
        TabView {
            Form {
                Stepper(
                    value: $minWordLength,
                    in: 3 ... Int(maxWordLength)) {
                        Text("Minimum word length: \(minWordLength)")
                    }

                LabeledContent("Maximum word length: \(Int(maxWordLength))") {
                    Slider(
                        value: $maxWordLength,
                        in: Double(minWordLength) ... 12)
                }

                Toggle("Allow proper nouns", isOn: $useProperNouns)
                    .toggleStyle(.switch)
            }
            .tabItem {
                Image(systemName: "snowflake")
                Text("Settings")
            }
        }
        .frame(width: 420, height: 160)
        .formStyle(.grouped)
    }
}

#Preview {
    SettingsView()
}
