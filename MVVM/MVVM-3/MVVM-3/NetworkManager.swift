//
//  NetworkManager.swift
//  MVVM-3
//
//  Created by Олег Филатов on 14.02.2021.
//

import Foundation

class NetworkManager: NSObject {
    func fetchMovies(completion: ([String]) -> ()) {
        completion(["Movie 1", "Movie 2", "Movie 3"])
    }
}
