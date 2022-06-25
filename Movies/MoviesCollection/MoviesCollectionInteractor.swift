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
    func moviesDidReceive(movies: [Movie])
}

class MoviesCollectionInteractor: MoviesCollectionInteractorInputProtocol {
    unowned let presenter: MoviesCollectionInteractorOutputProtocol
    
    required init(presenter: MoviesCollectionInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchMovies() {
        NetworkManager.shared.fetchMoviesData { [unowned self] result in
            switch result {
            case .success(let moviesData):
                self.presenter.moviesDidReceive(movies: moviesData.results)
            case .failure(let error):
                print(error)
            }
        }
    }
}
