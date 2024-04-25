//
//  GameView.swift
//  Snowman
//
//  Created by Sarah Clark on 4/24/24.
//

import SwiftUI

struct GameView: View {
    @State var game = Game()

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

                LettersView(letters: game.letters)

                Spacer()

                Button("New Game") {
                    game = Game()
                }
                .keyboardShortcut(.defaultAction)
                .opacity(game.gameStatus == .inProgress ? 0 : 1)
                .disabled(game.gameStatus == .inProgress)

                Spacer()

                GuessesView(game: $game)
            }
            .padding()

            Spacer()
        }
    }
}

#Preview {
    GameView()
}
