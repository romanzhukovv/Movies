//
//  MoviesCollectionPresenter.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import Foundation

class MoviesCollectionPresenter: MoviesCollectionViewOutputProtocol {
    unowned let view: MoviesCollectionViewInputProtocol
    var interactor: MoviesCollectionInteractorInputProtocol!
    var router: MovieCollectionRouterInputProtocol!
    
    required init(view: MoviesCollectionViewInputProtocol) {
        self.view = view
    }
    
    func getMovies() {
        interactor.fetchMovies()
    }
    
    func didSelectCell(at indexPath: IndexPath) {
        interactor.getMovie(at: indexPath)
    }
}

extension MoviesCollectionPresenter : MoviesCollectionInteractorOutputProtocol {
    func moviesDidReceive(movies: [Movie]) {
        let section = MovieSectionViewModel()
        
        for movie in movies {
            let cellViewModel = MovieCellViewModel(movie: movie)
            section.rows.append(cellViewModel)
        }
        view.reloadCells(section: section)
    }
    
    func movieDidReceive(movie: Movie) {
        router.openMovieDetailsViewController(with: movie)
    }
}
