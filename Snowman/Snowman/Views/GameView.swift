//
//  GameView.swift
//  Snowman
//
//  Created by Sarah Clark on 4/24/24.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var appState: AppState

    var game: Game {
        appState.games[appState.gameIndex]
    }

    var body: some View {
        HStack {
            Image("\(game.incorrectGuessCount)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 230)

            Spacer()

            VStack(spacing: 30.0) {
                Spacer()

                Text(game.statusText)
                    .font(.title2)
                    .foregroundColor(game.gameStatus.statusTextColor)

                LettersView(letters: game.letters)

                Spacer()

                Button("New Game") {
                    appState.startNewGame()
                }
                .keyboardShortcut(.defaultAction)
                .opacity(game.gameStatus == .inProgress ? 0 : 1)
                .disabled(game.gameStatus == .inProgress)

                Spacer()

                GuessesView(game: $appState.games[appState.gameIndex])
            }
            .padding()

            Spacer()
        }
    }
}

#Preview {
    GameView(appState: AppState())
}
