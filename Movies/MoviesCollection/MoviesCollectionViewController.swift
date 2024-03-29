//
//  MoviesCollectionViewController.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import UIKit

protocol MoviesCollectionViewInputProtocol: AnyObject {
    func reloadCells(section: MovieSectionViewModel)
    func appendMoreCells(cells: [MovieCellViewModel])
}

protocol MoviesCollectionViewOutputProtocol: AnyObject {
    init(view: MoviesCollectionViewInputProtocol)
    func getMovies()
//    func didSelectCell(at indexPath: IndexPath)
    func didSelectCell(with cellViewModel: CellIdentifiable)
    func getMoreMovies(for page: Int)
}

class MoviesCollectionViewController: UICollectionViewController {
    
    private var fetchingMore = false
    private var page = 1
    
    var presenter: MoviesCollectionViewOutputProtocol!
    
    private let configurator: MoviesCollectionConfiguratorInputProtocol = MoviesCollectionConfigurator()
    
    private var section: SectionRowRepresentable = MovieSectionViewModel()
    
    private let itemsPerRow: CGFloat = 2
    private let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    private let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.getMovies()
        
        title = "Movies"
        collectionView.backgroundColor = .black
        
        self.collectionView!.register(MovieViewCell.self, forCellWithReuseIdentifier: MovieCellViewModel.reuseId)
        
        setupSearchController()
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellViewModel = section.rows[indexPath.row]
        presenter.didSelectCell(with: cellViewModel)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height && offsetY > 0 {
            if !fetchingMore {
                fetchingMore = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.page += 1
                    print(self.page)
                    self.presenter.getMoreMovies(for: self.page)
                    self.fetchingMore = false
                }
            }
        }
    }
}

extension MoviesCollectionViewController {
    private func setupSearchController() {
//        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search movie"
        navigationItem.searchController = searchController
        searchController.searchBar.searchTextField.textColor = .white
    }
}

extension MoviesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        let aspectRatio = 0.66
        let height = widthPerItem / aspectRatio + 50
        return CGSize(width: widthPerItem, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInserts
    }
}

extension MoviesCollectionViewController: MoviesCollectionViewInputProtocol {
    func reloadCells(section: MovieSectionViewModel) {
        self.section = section
        collectionView.reloadData()
    }
    
    func appendMoreCells(cells: [MovieCellViewModel]) {
        self.section.rows.append(contentsOf: cells)
        collectionView.reloadData()
    }
}
