//
//  MovieViewModel.swift
//  NextFlix
//
//  Created by Thiago Leite on 04/11/21.
//

import Foundation

protocol MovieViewModelDelegate {
    func reloadData()
}

class MovieViewModel {
    var movies = [Movie]()
    
    var delegate: MovieViewModelDelegate?
    
    let numberOfRowsInSection = 1
    
    private let service = MovieService()
    
    func didLoad() {
        service.fetchData { movie in
            self.movies = movie
            self.delegate?.reloadData()
        }
    }
}
