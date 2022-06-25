//
//  MovieDetailsInteractor.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import Foundation

protocol MovieDetailsInteractorInputProtocol: AnyObject {
    init(presenter: MovieDetailsInteractorOutputProtocol, movie: Movie)
}

protocol MovieDetailsInteractorOutputProtocol: AnyObject {
    
}

class MovieDetailsInteractor: MovieDetailsInteractorInputProtocol {
    unowned let presenter: MovieDetailsInteractorOutputProtocol
    private let movie: Movie
    
    required init(presenter: MovieDetailsInteractorOutputProtocol, movie: Movie) {
        self.presenter = presenter
        self.movie = movie
        print(movie)
    }
}
