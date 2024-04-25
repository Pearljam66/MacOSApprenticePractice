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
    }
}
