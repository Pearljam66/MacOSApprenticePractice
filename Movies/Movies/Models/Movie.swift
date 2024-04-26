//
//  Movie.swift
//  Movies
//
//  Created by Sarah Clark on 4/26/24.
//

import Foundation

class Movie: Codable {

    var genres: String
    let id: String
    var isFav: Bool
    var rating: Double
    var runTime: Int
    var title: String
    var year: String

    internal init(genres: String, id: String, isFav: Bool, rating: Double, runTime: Int, title: String, year: String) {
        self.genres = genres
        self.id = id
        self.isFav = isFav
        self.rating = rating
        self.runTime = runTime
        self.title = title
        self.year = year
    }

}

extension Movie {

    static func readBundleData() -> [Movie] {
        guard let fileURL = Bundle.main.url(forResource: "movies", withExtension: "json") else { return [] }

        do {
            let jsonData = try Data(contentsOf: fileURL)
            let movies = try JSONDecoder().decode([Movie].self, from: jsonData)
            let sortedMovies = movies.sorted(using: KeyPathComparator(\.title))
            return sortedMovies
        } catch {
            print(error)
            return []
        }
    }

}
