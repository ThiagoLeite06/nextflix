//
//  MovieViewModel.swift
//  NextFlix
//
//  Created by Thiago Leite on 04/11/21.
//

import Foundation

class MovieViewModel {
    var movies = [Movie]()
    
    private let service = MovieService()
    
    func getMoviesByPopularity() {
        service.fetchData { movie in
            self.movies = movie
        }
    }
}
