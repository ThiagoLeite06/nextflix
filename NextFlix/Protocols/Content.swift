//
//  Content.swift
//  NextFlix
//
//  Created by Gui Feitosa on 05/11/21.
//

import Foundation

protocol Content {
    var title: String {get}
    var cover: URL? {get}
    var overview: String {get}
    var id: Int{get}
    
    var poster_path: String {get}
    var vote_average: Double {get}
}

extension Content {
    func convertToFavorite() -> Favorites {
        let favorite = Favorites()
        favorite.poster_path = poster_path
        favorite.title = title
        favorite.vote_average = vote_average
        
        return favorite
    }
    
}
