//
//  MovieViewModel.swift
//  NextFlix
//
//  Created by Thiago Leite on 04/11/21.
//

import Foundation

class MovieViewModel {
    let service: MovieService = .init()
    
    func getMoviesByPopularity() {
        service.getMovieByPopularity { movie in
            if let movie = movie {
                print(movie)
            }
        }
    }
}
