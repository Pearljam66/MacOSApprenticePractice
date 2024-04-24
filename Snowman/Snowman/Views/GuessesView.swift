//
//  GuessesView.swift
//  Snowman
//
//  Created by Sarah Clark on 4/24/24.
//

import SwiftUI

struct GuessesView: View {
    let guesses = ["E", "S", "R", "X"]

    var body: some View {
        HStack {
            Text("Letters used:")
            Text(guesses.joined(separator: ","))
        }

        LabeledContent("Guess a letter:") {
            Text("Q")
        }
    }
}

#Preview {
    GuessesView()
}
