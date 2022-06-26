//
//  MovieDetailsInteractor.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import Foundation

protocol MovieDetailsInteractorInputProtocol: AnyObject {
    init(presenter: MovieDetailsInteractorOutputProtocol, movie: Movie)
    func provideMovieDetails()
}

protocol MovieDetailsInteractorOutputProtocol: AnyObject {
    func receiveMovieDetails(_ movieDetailsData: MovieDetailsData)
}

class MovieDetailsInteractor: MovieDetailsInteractorInputProtocol {
    unowned let presenter: MovieDetailsInteractorOutputProtocol
    private let movie: Movie
    
    required init(presenter: MovieDetailsInteractorOutputProtocol, movie: Movie) {
        self.presenter = presenter
        self.movie = movie
    }
    
    func provideMovieDetails() {
        let movieDetailsData = MovieDetailsData(movieImagePath: movie.backdrop_path,
                                                movieTitle: movie.title,
                                                releaseDate: movie.release_date,
                                                voteAverage: movie.vote_average,
                                                overview: movie.overview)
        
        presenter.receiveMovieDetails(movieDetailsData)
    }
}
