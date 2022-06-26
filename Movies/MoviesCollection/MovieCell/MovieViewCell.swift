//
//  MovieViewCell.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import UIKit
import Kingfisher

protocol CellModelRepresentable {
    var viewModel: CellIdentifiable? { get set }
}

class MovieViewCell: UICollectionViewCell, CellModelRepresentable {
    var viewModel: CellIdentifiable? {
        didSet {
            updateView()
        }
    }
    
    private let posterImageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieViewCell {
    private func updateView() {
        contentView.backgroundColor = .darkGray
        guard let viewModel = viewModel as? MovieCellViewModel else { return }
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + viewModel.posterPath) else { return }
        posterImageView.kf.setImage(with: url, options: [.transition(.fade(0.7))])
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.clipsToBounds = true
        
        titleLabel.text = viewModel.movieTitle
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        addConstraints()
    }
    
    private func addConstraints() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -50),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.width - 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -5)
        ])
    }
}
