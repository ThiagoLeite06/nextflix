//
//  SerieViewModel.swift
//  NextFlix
//
//  Created by Gui Feitosa on 07/11/21.
//

import Foundation
import UIKit

protocol SerieViewModelDelegate {
    func loadData()
    func errorAddFavorite()
    func reloadData()
}

class SerieViewModel {
    
    var delegate: SerieViewModelDelegate?
    
    public let service = SerieService()
    
    var series = [Serie]()
    
    var favoriteSeries: [Favorites] = []
    
    private let serviceCD = CoreDataService()
    
    public func loadData() {
        delegate?.loadData()
//      series = serviceCD.getListFavoriteInCoreData()
        delegate?.reloadData()
    }
    
    func isFavorite(title: String) -> Bool {
        return serviceCD.isFavorite(title: title)
    }
    
    func addFavorite(title: String?, poster_path: String?, vote_average: Double, isMovie: Bool) {
        
        if checkValues(title: title) {
            favoriteSeries = serviceCD.addFavoriteInCoreData(title: title!, poster_path: poster_path, vote_average: vote_average, isMovie: isMovie)
            delegate?.reloadData()
        } else {
            delegate?.errorAddFavorite()
        }
    }
    
    func removeFavorite(image: String?, title: String?) {
        
        //favoriteSeries = serviceCD.removeFavoriteInCoreData(favorite: favorite)
        delegate?.reloadData()
    }
    
    func checkValues(title: String?) -> Bool {
        if let title = title, title.isEmpty {
            delegate?.errorAddFavorite()
            return false
        }
        
        return true
    }
    
    
    func numberOfFavoriteOnTheList() -> Int {
        return series.count
    }
}
