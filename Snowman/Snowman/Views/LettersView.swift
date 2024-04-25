//
//  LettersView.swift
//  Snowman
//
//  Created by Sarah Clark on 4/24/24.
//

import SwiftUI

struct LettersView: View {
    let letters: [Letter]

    var body: some View {
        HStack {
            ForEach(letters) { letter in
                Text(letter.char)
                    .font(.title)
                    .bold()
                    .frame(width: 20, height: 20)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(letter.color)
                            .padding(2))
            }
        }
    }
}

#Preview {
    LettersView(letters: Game(id: 1).letters)
}
