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
//    func getMovie(at indexPath: IndexPath)
    func fetchMoreMovies(for page: Int)
}

protocol MoviesCollectionInteractorOutputProtocol: AnyObject {
    func moviesDidReceive(movies: [Movie])
//    func movieDidReceive(movie: Movie)
    func moreMoviesDidReceive(movies: [Movie])
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
    
//    func getMovie(at indexPath: IndexPath) {
//        NetworkManager.shared.fetchMoviesData { [unowned self] result in
//            switch result {
//            case .success(let moviesData):
//                self.presenter.movieDidReceive(movie: moviesData.results[indexPath.row])
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    func fetchMoreMovies(for page: Int) {
        NetworkManager.shared.fetchMoviesData(for: page) { [unowned self] result in
            switch result {
            case .success(let moviesData):
                self.presenter.moreMoviesDidReceive(movies: moviesData.results)
            case .failure(let error):
                print(error)
            }
        }
    }
}
