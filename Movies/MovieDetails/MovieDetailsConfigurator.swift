//
//  MovieDetailsConfigurator.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import Foundation

protocol MovieDetailsConfiguratorInputProtocol {
    func configure(with view: MovieDetailsViewController, and movie: Movie)
}

class MovieDetailsConfigurator: MovieDetailsConfiguratorInputProtocol {
    func configure(with view: MovieDetailsViewController, and movie: Movie) {
        let presenter = MovieDetailsPresenter(view: view)
        let interactor = MovieDetailsInteractor(presenter: presenter, movie: movie)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
