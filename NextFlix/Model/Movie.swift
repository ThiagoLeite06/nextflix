//
//  Movie.swift
//  NextFlix
//
//  Created by Thiago Leite on 16/10/21.
//

import Foundation
import UIKit

struct Movie {
    
    let imageMovie: UIImage
    let title: String
    let release: String
   
    
}


// Retirado do modelo de retorno get/movies/popular
struct MovieResponse {
    let poster_path: String
    let adult: Bool
    let overview: String
    let release_date: String
    let genres: [Genre]
    let id: Int
    let original_title: String
    let original_language: String
    let title: String
    let backdrop_path: String
    let popularity: Float
    let vote_count: Int
    let video: Bool
    let vote_average: Decimal
    
}

