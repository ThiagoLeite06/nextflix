//
//  Favorites+CoreDataProperties.swift
//  
//
//  Created by Lilian on 01/12/21.
//
//

import Foundation
import CoreData


extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var poster_path: String?
    @NSManaged public var title: String?
    @NSManaged public var vote_average: Double
    @NSManaged public var isMovie: Bool

}
