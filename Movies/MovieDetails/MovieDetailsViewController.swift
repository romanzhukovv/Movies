//
//  ViewController.swift
//  Movies
//
//  Created by Roman Zhukov on 23.06.2022.
//

import UIKit

protocol MovieDetailsViewInputProtocol: AnyObject {
    
}

protocol MovieDetailsViewOutputProtocol: AnyObject {
    init(view: MovieDetailsViewInputProtocol)
}

class MovieDetailsViewController: UIViewController {
    var presenter: MovieDetailsViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension MovieDetailsViewController: MovieDetailsViewInputProtocol {
    
}
