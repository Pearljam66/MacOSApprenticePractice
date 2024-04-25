//
//  GameStats.swift
//  Snowman
//
//  Created by Sarah Clark on 4/25/24.
//

import SwiftUI

struct GameStats: View {
    var games: [Game]

    var body: some View {
        Text(gameReport)
    }

    var gameReport: String {
        let wonGames = games.filter {
            $0.gameStatus == .won
        }
        let lostGames = games.filter {
            $0.gameStatus == .lost
        }

        return """
    Games won: \(wonGames.count)
    Games lost: \(lostGames.count)
    """
    }
}

#Preview {
    GameStats(games: [])
}
