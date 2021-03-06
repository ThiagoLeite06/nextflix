//
//  Serie.swift
//  NextFlix
//
//  Created by Gui Feitosa on 22/10/21.
//

import Foundation
import UIKit
import SwiftUI

struct Serie: Codable {
    let poster_path: String
    let popularity: Double
    let id: Int
    let backdrop_path: String?
    let vote_average: Double
    let overview: String
    let first_air_date: String
    let origin_country: [String]
    let genre_ids: [Int]
    let original_language: String
    let vote_count: Int
    let name: String
    let original_name: String
}


struct Country: Codable {
    let country: String
}

extension Serie: Content {
   var title: String {
        return name
    }
    
    var cover: URL? {
        return URL(string: "https://image.tmdb.org/t/p/w500" + (backdrop_path ?? ""))
    }
}
