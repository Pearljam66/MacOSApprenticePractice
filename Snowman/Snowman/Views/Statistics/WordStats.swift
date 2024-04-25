//
//  WordStats.swift
//  Snowman
//
//  Created by Sarah Clark on 4/25/24.
//

import SwiftUI

struct WordStats: View {
    var games: [Game]

    var body: some View {
        Text(wordCountReport)
    }

    var wordCountReport: String {
        let completedGames = games.filter {
            $0.gameStatus != .inProgress
        }

        let gameReports = completedGames.map { game in
            let statusText = game.gameStatus == .won ? "won" : "lost"
            return "\(game.id): \(game.word.count) letters - \(statusText)"
        }

        return gameReports.joined(separator: "\n")
    }
}

#Preview {
    WordStats(games: [])
}
