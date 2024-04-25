//
//  GuessesView.swift
//  Snowman
//
//  Created by Sarah Clark on 4/24/24.
//

import SwiftUI

struct GuessesView: View {
    @State var nextGuess = ""
    @Binding var game: Game
    @FocusState var entryFieldHasFocus: Bool

    var body: some View {
        VStack {
            HStack {
                Text("Letters used:")
                Text(game.guesses.joined(separator: ", "))
            }

            LabeledContent("Guess a letter:") {
                TextField("", text: $nextGuess)
                    .frame(width: 50)
                    .textFieldStyle(.roundedBorder)
                    .disabled(game.gameStatus != .inProgress)
                    .onChange(of: nextGuess) {
                        game.processGuess(letter: nextGuess)
                        nextGuess = ""
                    }
                    .focused($entryFieldHasFocus)
                    .onChange(of: game.gameStatus) {
                        entryFieldHasFocus = true
                    }
            }
        }
    }
}

#Preview {
    GuessesView(game: .constant(Game()))
}
