//
//  MoviesData.swift
//  Movies
//
//  Created by Roman Zhukov on 25.06.2022.
//

import Foundation

struct MoviesData: Decodable {
    let page : Int
    let results: [Movie]
}
