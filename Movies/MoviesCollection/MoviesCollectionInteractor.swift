//
//  MoviesCollectionInteractor.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import Foundation

protocol MoviesCollectionInteractorInputProtocol: AnyObject {
    init(presenter: MoviesCollectionInteractorOutputProtocol)
    func fetchMovies()
}

protocol MoviesCollectionInteractorOutputProtocol: AnyObject {
    func moviesDidReceive(movies: String)
}

class MoviesCollectionInteractor: MoviesCollectionInteractorInputProtocol {
    unowned let presenter: MoviesCollectionInteractorOutputProtocol
    
    required init(presenter: MoviesCollectionInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchMovies() {
        presenter.moviesDidReceive(movies: "black")
    }
}
