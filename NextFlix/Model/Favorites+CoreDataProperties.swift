//
//  Favorites+CoreDataProperties.swift
//  
//
//  Created by Gui Feitosa on 18/11/21.
//
//

import Foundation
import CoreData


extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var vote_average: Double
    @NSManaged public var title: String?
    @NSManaged public var poster_path: String?

}
