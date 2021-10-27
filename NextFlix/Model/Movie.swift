//
//  Movie.swift
//  NextFlix
//
//  Created by Thiago Leite on 16/10/21.
//

import Foundation
import UIKit

class Movie {
    
    let imageMovie: String
    let titleMovie: String
    let bornIn: String
   
    init (imageMovie: String, titleMovie: String, bornIn: String) {
        
        self.imageMovie = imageMovie
        self.titleMovie = titleMovie
        self.bornIn = bornIn
    }
}



//struct Movie: Codable {
//    let adult: Bool
//    let backdrop_path: String
//    let belongs_to_collection: String?
//    let budget: Int
////    let genres: [Genre]
//    let homepage: String
//    let id: Int
//    let imdb_id: String
//    let original_language: String
//    let original_title: String
//    let overview: String
//    let popularity: Float
//    let poster_path: String
////    let production_companies: [Company]
////    let production_countries: [Country]
//    let release_date: String
//    let revenue: Int
//    let runtime: Int
////    let spoken_languages: [Language]
//    let status: String
//    let tagline: String
//    let title: String
//    let video: Bool
//    let vote_average: Decimal
//    let vote_count: Int
//    // let is_movie: Bool - pra usar a mesmo modelo 
//}
