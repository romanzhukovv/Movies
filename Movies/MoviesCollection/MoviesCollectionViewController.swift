//
//  MoviesCollectionViewController.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import UIKit

protocol MoviesCollectionViewInputProtocol: AnyObject {
    func changeBackgroundColor(color: String)
}

protocol MoviesCollectionViewOutputProtocol: AnyObject {
    init(view: MoviesCollectionViewInputProtocol)
    func getMovies()
}

class MoviesCollectionViewController: UICollectionViewController {
    
    var presenter: MoviesCollectionViewOutputProtocol! //ALERT//
    
    private let configurator: MoviesCollectionConfiguratorInputProtocol = MoviesCollectionConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.getMovies()
        title = "Movies"
//        collectionView.backgroundColor = .white
        self.collectionView!.register(MovieViewCell.self, forCellWithReuseIdentifier: MovieViewCell.reuseId)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieViewCell.reuseId, for: indexPath) as? MovieViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}

extension MoviesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (view.frame.width - 1) / 2, height: (view.frame.width - 1) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}

extension MoviesCollectionViewController: MoviesCollectionViewInputProtocol {
    func changeBackgroundColor(color: String) {
        if color == "black" {
            collectionView.backgroundColor = .black
        }
    }
    
    
}
