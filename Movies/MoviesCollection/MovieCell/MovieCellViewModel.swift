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
    
    static var reuseId: String {
        "MovieCell"
    }
    
    init(movie: Movie) {
        posterPath = movie.poster_path
    }
}

class MovieSectionViewModel: SectionRowRepresentable {
    var rows: [CellIdentifiable] = []
}
