//
//  MoviesCollectionConfigurator.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import Foundation

protocol MoviesCollectionConfiguratorInputProtocol {
    func configure(with viewController: MoviesCollectionViewController)
}

class MoviesCollectionConfigurator: MoviesCollectionConfiguratorInputProtocol {
    func configure(with viewController: MoviesCollectionViewController) {
        let presenter = MoviesCollectionPresenter(view: viewController)
        let interactor = MoviesCollectionInteractor(presenter: presenter)
        let router = MoviesCollectionRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
