//
//  MovieCellViewModel.swift
//  Movies
//
//  Created by Roman Zhukov on 25.06.2022.
//

import Foundation

protocol CellIdentifiable {
    static var reuseId: String { get }
}

protocol SectionRowRepresentable {
    var rows: [CellIdentifiable] { get set }
}

class MovieCellViewModel: CellIdentifiable {
    let posterPath: String
    let movieTitle: String
    let voteAverage: Double
    
    var voteColor: String {
        voteAverage > 6.9 ? "green" : "orange"
    }
    
    static var reuseId: String {
        "MovieCell"
    }
    
    init(movie: Movie) {
        posterPath = movie.poster_path
        movieTitle = movie.title
        voteAverage = movie.vote_average
    }
}

class MovieSectionViewModel: SectionRowRepresentable {
    var rows: [CellIdentifiable] = []
}
