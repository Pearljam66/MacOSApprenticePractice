//
//  StatsView.swift
//  Snowman
//
//  Created by Sarah Clark on 4/25/24.
//

import SwiftUI

struct StatsView: View {
    var games: [Game]

    var body: some View {
        TabView {
            GameStats(games: games)
                .tabItem {
                    Text("Games Won & Lost")
                }

            WordStats(games: games)
                .tabItem {
                    Text("Length of Words")
                }
        }
        .padding()
    }
}

#Preview {
    StatsView(games: [])
}
