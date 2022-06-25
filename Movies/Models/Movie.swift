//
//  Movies.swift
//  Movies
//
//  Created by Roman Zhukov on 24.06.2022.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let overview: String
    let poster_path: String
    let release_date: String
    let title: String
    let vote_average: Double
}
