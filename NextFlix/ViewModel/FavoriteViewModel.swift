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

class FavoriteViewModel {
    
    enum FavoriteType: Int {
        case film
        case serie
    }
    
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
    
    
    func loadData(with type: Int) {
        
        guard let favoriteType: FavoriteType = .init(rawValue: type) else { return }
        
        switch favoriteType {
        case .film:
            favorites = service.getListFavoriteMovies()
        case .serie:
            favorites = service.getListFavoriteSeries()
        }
        
        delegate?.reloadData()
    }
}
