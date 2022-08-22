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
    
    func didSelectCell(with cellViewModel: CellIdentifiable) {
        guard let cellViewModel = cellViewModel as? MovieCellViewModel else { return }
        router.openMovieDetailsViewController(with: cellViewModel.movie)
    }
    
    func getMoreMovies(for page: Int) {
        interactor.fetchMoreMovies(for: page)
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
    
//    func movieDidReceive(movie: Movie) {
//        router.openMovieDetailsViewController(with: movie)
//    }
    
    func moreMoviesDidReceive(movies: [Movie]) {
        var cells: [MovieCellViewModel] = []
        
        for movie in movies {
            let cellViewModel = MovieCellViewModel(movie: movie)
            cells.append(cellViewModel)
        }
        view.appendMoreCells(cells: cells)
    }
}
