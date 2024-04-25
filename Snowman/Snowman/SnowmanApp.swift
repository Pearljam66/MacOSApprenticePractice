//
//  SnowmanApp.swift
//  Snowman
//
//  Created by Sarah Clark on 4/19/24.
//

import SwiftUI

@main
struct SnowmanApp: App {
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView(appState: appState)
        }

        Settings {
            SettingsView()
        }

        Window("Statistics", id: "stats") {
            StatsView(games: appState.games)
        }
        .keyboardShortcut("t", modifiers: .command)
    }
}
