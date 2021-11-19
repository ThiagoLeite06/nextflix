//
//  FavoritesViewModel.swift
//  NextFlix
//
//  Created by Thiago Leite on 17/11/21.
//

import Foundation

protocol FavoriteViewModelDelegate {
    func reloadData()
    
}

class FavoritesViewModel {
    
    // Titulo Seção
    //var titleSection = ["Filmes", "Séries"]
    
    var favorites: [Favorites] = []
    
    var delegate: FavoriteViewModelDelegate?
    
    private let service = CoreDataService()
    
    func getFavoriteCount() -> Int {
        return favorites.count
    }
    
    func loadData() {
        favorites = service.getListFavoriteInCoreData()
        delegate?.reloadData()
    }
    
    func removeFavorite(favorite: Favorites) {
        favorites = service.removeFavoriteInCoreData(favorite: favorite)
    }
    
    
}
