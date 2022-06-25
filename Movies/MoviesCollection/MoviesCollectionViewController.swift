//
//  MoviesCollectionViewController.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import UIKit

protocol MoviesCollectionViewInputProtocol: AnyObject {
    func reloadCells(section: MovieSectionViewModel)
}

protocol MoviesCollectionViewOutputProtocol: AnyObject {
    init(view: MoviesCollectionViewInputProtocol)
    func getMovies()
}

class MoviesCollectionViewController: UICollectionViewController {
    var presenter: MoviesCollectionViewOutputProtocol! //ALERT//
    
    private let configurator: MoviesCollectionConfiguratorInputProtocol = MoviesCollectionConfigurator()
    
    private var section: SectionRowRepresentable = MovieSectionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.getMovies()
        
        title = "Movies"
        collectionView.backgroundColor = .white
        
        self.collectionView!.register(MovieViewCell.self, forCellWithReuseIdentifier: MovieCellViewModel.reuseId)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.section.rows.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCellViewModel.reuseId, for: indexPath) as? MovieViewCell else { return UICollectionViewCell() }
        let cellViewModel = section.rows[indexPath.row]
        cell.viewModel = cellViewModel
        return cell
    }
}

extension MoviesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (view.frame.width - 1) / 2, height: (view.frame.width - 1) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}

extension MoviesCollectionViewController: MoviesCollectionViewInputProtocol {
    func reloadCells(section: MovieSectionViewModel) {
        self.section = section
        collectionView.reloadData()
    }
}
