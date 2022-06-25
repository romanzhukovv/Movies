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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieViewCell {
    private func updateView() {
        guard let viewModel = viewModel as? MovieCellViewModel else { return }
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + viewModel.posterPath) else { return }
        posterImageView.kf.setImage(with: url)
        
        posterImageView.contentMode = .scaleAspectFit
//        posterImageView.clipsToBounds = true
        contentView.addSubview(posterImageView)
        addConstraints()
    }
    
    private func addConstraints() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            posterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            posterImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            posterImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
    }
}
