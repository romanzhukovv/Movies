//
//  MoviesCollectionPresenter.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import Foundation

class MoviesCollectionPresenter: MoviesCollectionViewOutputProtocol {
    unowned let view: MoviesCollectionViewInputProtocol
    var interactor: MoviesCollectionInteractorInputProtocol! //ALERT//
    
    required init(view: MoviesCollectionViewInputProtocol) {
        self.view = view
    }
    
    func getMovies() {
        interactor.fetchMovies()
    }
}

extension MoviesCollectionPresenter : MoviesCollectionInteractorOutputProtocol {
    func moviesDidReceive(movies: [Movie]) {
        view.sendMovies(movies: movies)
    }
}
