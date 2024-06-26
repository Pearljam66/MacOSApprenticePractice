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
        .commands {
            SidebarCommands()
            ToolbarCommands()

            CommandGroup(replacing: .newItem) {
                Button("New Game") {
                    appState.startNewGame()
                }
                .keyboardShortcut("n")
            }

            CommandGroup(replacing: .help) {
                EmptyView()
            }

            CommandMenu("Game") {
                Toggle("Boss Mode", isOn: $appState.bossMode)
                    .keyboardShortcut("b")

                Button("Different Word") {
                    appState.getDifferentWord()
                }
                .keyboardShortcut("d")
                .disabled(appState.gameHasStarted)
            }
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
