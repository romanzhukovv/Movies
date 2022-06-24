//
//  MovieViewCell.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import UIKit

class MovieViewCell: UICollectionViewCell {
    static let reuseId = "MovieCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .magenta
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
