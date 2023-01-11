//
//  Movie+CoreDataProperties.swift
//  ExploreCoreData
//
//  Created by dremobaba on 2023/1/11.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var year: Int16
    @NSManaged public var director: String?
    
    public var wrappedTitle: String {
        title ?? "Unknown title"
    }
    public var wrappedDirector: String {
        director ?? "unknown director"
    }

}

extension Movie : Identifiable {

}
