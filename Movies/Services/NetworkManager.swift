//
//  NetworkManager.swift
//  Movies
//
//  Created by Roman Zhukov on 25.06.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private let url = "https://api.themoviedb.org/3/movie/popular?api_key=b03f24523307900f601ab7c02b3bcd4b&language=en-US&page="
    
    private init() {}
    
    func fetchMoviesData(for page: Int = 1, completion: @escaping(Result<MoviesData, NetworkError>) -> Void) {
        guard let url = URL(string: url + String(page)) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                completion(.failure(.noData))
                return
            }
            do {
                let moviesData = try JSONDecoder().decode(MoviesData.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(moviesData))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
