//
//  Game.swift
//  Snowman
//
//  Created by Sarah Clark on 4/24/24.
//

import SwiftUI

struct Game: Identifiable {
    let id: Int

    @AppStorage("minWordLength") var minWordLength = 4
    @AppStorage("maxWordLength") var maxWordLength = 10
    @AppStorage("useProperNouns") var useProperNouns = false

    var incorrectGuessCount = 0
    var statusText = "Enter a letter to start the game."
    var word = "SNOWMAN"
    var guesses: [String] = []
    var gameStatus = GameStatus.inProgress

    var letters: [Letter] {
        var lettersArray: [Letter] = []

        for (index, char) in word.enumerated() {
            let charString = String(char)

            if guesses.contains(charString) {
                let letter = Letter(id: index, char: charString)
                lettersArray.append(letter)
            } else if gameStatus == .lost {
                let letter = Letter(id: index, char: charString, color: .red)
                lettersArray.append(letter)
            } else {
                let letter = Letter(id: index, char: "")
                lettersArray.append(letter)
            }
        }
        return lettersArray
    }

    var sidebarWord: String {
        if gameStatus == .inProgress {
            return "???"
        }
        return word
    }

    init(id: Int) {
        self.id = id
        word = getRandomWord()
    }

    mutating func processGuess(letter: String) {
        guard
            let newGuess = letter.first?.uppercased(),
            newGuess >= "A" && newGuess <= "Z",
            !guesses.contains(newGuess)
        else {
            return
        }

        if !word.contains(newGuess) && incorrectGuessCount < 7 {
            incorrectGuessCount += 1
        }
        guesses.append(newGuess)

        checkForGameOver()
    }

    mutating func checkForGameOver() {
        let unmatchedLetters = word.filter { letter in
            !guesses.contains(String(letter))
        }

        if unmatchedLetters.isEmpty {
            gameStatus = .won
            statusText = "HURRAY!!!! YOU WON!"
        } else if incorrectGuessCount == 7 {
            gameStatus = .lost
            statusText = "You lost. Better luck next time."
        } else {
            statusText = "Enter another letter to guess the word."
        }
    }

    func getRandomWord() -> String {
        guard
            let url = Bundle.main.url(forResource: "words", withExtension: "txt"),
            let wordsList = try? String(contentsOf: url)
        else {
            return "SNOWMAN"
        }

        let words = wordsList
            .components(separatedBy: .newlines)
            .filter { word in
                word.count >= minWordLength && word.count <= maxWordLength
            }
            .filter { word in
                if useProperNouns {
                    return true
                }
                let firstLetter = word[word.startIndex]
                return !firstLetter.isUppercase
            }

        let word = words.randomElement() ?? "SNOWMAN"

        print(word)
        return word.uppercased()
    }

    mutating func chooseNewWord() {
        word = getRandomWord()
    }
}

extension Game {
    static var sampleGames: [Game] {
        var game1 = Game(id: 1)
        game1.word = "SNOWMAN"
        game1.gameStatus = .lost

        var game2 = Game(id: 2)
        game2.word = "FROST"
        game2.gameStatus = .won

        var game3 = Game(id: 3)
        game3.word = "ANTARCTICA"
        game3.gameStatus = .lost

        return [game1, game2, game3]
    }
}
