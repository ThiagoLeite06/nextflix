//
//  Movie.swift
//  NextFlix
//
//  Created by Thiago Leite on 16/10/21.
//

import Foundation
import UIKit

struct Movie: Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Float
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Float
    let vote_count: Int
    
//    let imageMovie: UIImage
//    let title: String
//    let release: String
    
}

struct Genre: Codable {
    let id: Int
    let name: String
}


