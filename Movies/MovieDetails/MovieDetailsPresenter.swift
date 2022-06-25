//
//  MovieDetailsPresenter.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import Foundation

class MovieDetailsPresenter: MovieDetailsViewOutputProtocol {
    unowned let view: MovieDetailsViewInputProtocol
    var interactor: MovieDetailsInteractorInputProtocol!
    
    required init(view: MovieDetailsViewInputProtocol) {
        self.view = view
    }
}

extension MovieDetailsPresenter: MovieDetailsInteractorOutputProtocol {
    
}
