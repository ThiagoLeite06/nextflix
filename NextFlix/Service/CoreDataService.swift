//
//  CoreDataService.swift
//  NextFlix
//
//  Created by Gui Feitosa on 18/11/21.
//

import Foundation
import UIKit

class CoreDataService {
    
    private var favorite: [Favorites] = []
    private let context = ((UIApplication.shared.delegate)
                           as! AppDelegate)
        .persistentContainer
        .viewContext
    
    func getListFavoriteInCoreData() -> [Favorites] {
        
        do {
            favorite = try context.fetch(Favorites.fetchRequest())
            return favorite
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func addFavoriteInCoreData(title: String, poster_path: String?, vote_average: Double) -> [Favorites] {
        
        let favorite: Favorites = .init(context: context)
        favorite.poster_path = poster_path
        favorite.title = title
        favorite.vote_average = vote_average
        
        saveContext()
        return getListFavoriteInCoreData()
    }
    
    func removeFavoriteInCoreData(favorite: Favorites) -> [Favorites] {
        
        context.delete(favorite)
        saveContext()
        return getListFavoriteInCoreData()
    }
    
    private func saveContext() {
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}