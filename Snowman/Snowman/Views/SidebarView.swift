//
//  SidebarView.swift
//  Snowman
//
//  Created by Sarah Clark on 4/24/24.
//

import SwiftUI

struct SidebarView: View {
    @ObservedObject var appState: AppState

    var body: some View {
        List(appState.games, selection: $appState.selectedID) { game in
            VStack(alignment: .leading) {
                Text("Game \(game.id)")
                    .font(.title3)
                Text(game.sidebarWord)
                game.gameStatus.displayStatus
            }
            .padding(.vertical)
            .foregroundColor(game.gameStatus.statusTextColor)
            .tag(game.id)
        }
    }
}

#Preview {
    SidebarView(appState: AppState())
}
