//
//  ViewController.swift
//  Movies
//
//  Created by Roman Zhukov on 23.06.2022.
//

import UIKit

protocol MovieDetailsViewInputProtocol: AnyObject {
    func displayMovieImage(imagePath: String)
    func displayMovieTitle(movieTitle: String)
    func displayReleaseDate(releaseDate: String)
    func displayVoteAverage(voteAverage: Double)
    func displayOverview(overview: String)
}

protocol MovieDetailsViewOutputProtocol: AnyObject {
    init(view: MovieDetailsViewInputProtocol)
    func showDetails()
}

class MovieDetailsViewController: UIViewController {
    var presenter: MovieDetailsViewOutputProtocol!
    
    private let movieImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.showDetails()
    }
}

extension MovieDetailsViewController: MovieDetailsViewInputProtocol {
    
    
    func displayMovieImage(imagePath: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/original" + imagePath) else { return }
        movieImageView.kf.setImage(with: url, options: [.transition(.fade(0.7))])
    }
    
    func displayMovieTitle(movieTitle: String) {
        
    }
    
    func displayReleaseDate(releaseDate: String) {
        
    }
    
    func displayVoteAverage(voteAverage: Double) {
        
    }
    
    func displayOverview(overview: String) {
        
    }
}

extension MovieDetailsViewController {
    private func setupUI() {
        view.backgroundColor = .black
        
        movieImageView.contentMode = .scaleAspectFit
        
        view.addSubview(movieImageView)
        addConstraints()
    }
    
    private func addConstraints() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.778)
        ])
    }
}
