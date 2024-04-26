//
//  ViewController.swift
//  Movies
//
//  Created by Sarah Clark on 4/26/24.
//

import Cocoa

class ViewController: NSViewController {
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        movies = Movie.readBundleData()
        print(movies.count)
    }

}

