//
//  MoviesCollectionRouter.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import Foundation

protocol MovieCollectionRouterInputProtocol {
    init(viewController: MoviesCollectionViewController)
    func openMovieDetailsViewController(with movie: Movie)
}

class MoviesCollectionRouter: MovieCollectionRouterInputProtocol {
    unowned let viewController: MoviesCollectionViewController
    
    required init(viewController: MoviesCollectionViewController) {
        self.viewController = viewController
    }
    
    func openMovieDetailsViewController(with movie: Movie) {
        let detailsVC = MovieDetailsViewController()
        let detailsConfigurator: MovieDetailsConfiguratorInputProtocol = MovieDetailsConfigurator()
        detailsConfigurator.configure(with: detailsVC, and: movie)
        viewController.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
