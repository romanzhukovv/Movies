//
//  MovieDetailsPresenter.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import Foundation

struct MovieDetailsData {
    let movieImagePath: String
    let movieTitle: String
    let releaseDate: String
    let voteAverage: Double
    let overview: String
}

class MovieDetailsPresenter: MovieDetailsViewOutputProtocol {
    
    unowned let view: MovieDetailsViewInputProtocol
    var interactor: MovieDetailsInteractorInputProtocol!
    
    required init(view: MovieDetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideMovieDetails()
    }
    
}

extension MovieDetailsPresenter: MovieDetailsInteractorOutputProtocol {
    func receiveMovieDetails(_ movieDetailsData: MovieDetailsData) {
        view.displayMovieImage(imagePath: movieDetailsData.movieImagePath)
    }
}
