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
    func getVoteColor(color: String)
}

protocol MovieDetailsViewOutputProtocol: AnyObject {
    init(view: MovieDetailsViewInputProtocol)
    func showDetails()
}

class MovieDetailsViewController: UIViewController {
    var presenter: MovieDetailsViewOutputProtocol!
    
    private let movieImageView = UIImageView()
    private let titleLabel = UILabel()
    private let horizontalStackView = UIStackView()
    private let releaseDateLabel = UILabel()
    private let voteAverageLabel = UILabel()
    private let overviewTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.showDetails()
    }
}

extension MovieDetailsViewController: MovieDetailsViewInputProtocol {
    func displayMovieImage(imagePath: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/original" + imagePath) else { return }
        movieImageView.kf.indicatorType = .activity
        movieImageView.kf.setImage(with: url, options: [.transition(.fade(0.7))])
    }
    
    func displayMovieTitle(movieTitle: String) {
        titleLabel.text = movieTitle
    }
    
    func displayReleaseDate(releaseDate: String) {
        releaseDateLabel.text = releaseDate
    }
    
    func displayVoteAverage(voteAverage: Double) {
        voteAverageLabel.text = "\(voteAverage)"
    }
    
    func displayOverview(overview: String) {
        overviewTextView.text = overview
    }
    
    func getVoteColor(color: String) {
        voteAverageLabel.textColor = color == "green" ? .systemGreen : .systemOrange
    }
}

extension MovieDetailsViewController {
    private func setupUI() {
        view.backgroundColor = .black
        
        movieImageView.contentMode = .scaleAspectFit
        
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        
        horizontalStackView.spacing = 20
        horizontalStackView.axis = .horizontal
        
        releaseDateLabel.textAlignment = .left
        releaseDateLabel.textColor = .lightGray
        
        voteAverageLabel.textAlignment = .right
        voteAverageLabel.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        
        overviewTextView.textAlignment = .justified
        overviewTextView.backgroundColor = .black
        overviewTextView.textColor = .white
        overviewTextView.isEditable = false
        overviewTextView.font = UIFont.systemFont(ofSize: 16)
        overviewTextView.textContainerInset = .zero
        overviewTextView.textContainer.lineFragmentPadding = 0
        
        view.addSubview(movieImageView)
        view.addSubview(titleLabel)
        view.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(releaseDateLabel)
        horizontalStackView.addArrangedSubview(voteAverageLabel)
        view.addSubview(overviewTextView)
        
        addConstraints()
    }
    
    private func addConstraints() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        overviewTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.778),
            
            titleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100),
            
            horizontalStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            horizontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50),
            
            overviewTextView.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 30),
            overviewTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            overviewTextView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50),
            overviewTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
