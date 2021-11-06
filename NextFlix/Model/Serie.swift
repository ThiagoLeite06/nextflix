//
//  Serie.swift
//  NextFlix
//
//  Created by Gui Feitosa on 22/10/21.
//

import Foundation
import UIKit

struct Serie: Codable {
    let poster_path: String
    let popularity: Double
    let id: Double
    let backdrop_path: String
    let vote_average: Double
    let overview: String
    let first_air_date: String
    let origin_country: [String]
    let genre_ids: [Int]
    let original_language: String
    let vote_count: Int
    let name: String
    let original_name: String
    
//    let imageSerie: UIImage
//    let titleSerie: String
//    let bornIn: String
//    let description: String
}

//struct Genre: Codable {
//    let id: Int
//}
struct Country: Codable {
    let country: String
}
