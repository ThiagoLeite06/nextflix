//
//  FavoritesViewModel.swift
//  NextFlix
//
//  Created by Thiago Leite on 17/11/21.
//

import Foundation

class FavoritesViewModel {
    var favorites: [String] = [
        "A", "B", "C"
    ]
    
    func getFavoriteCount() -> Int {
        return favorites.count
    }
    
    
    
}
