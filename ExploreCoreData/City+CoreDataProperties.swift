//
//  City+CoreDataProperties.swift
//  ExploreCoreData
//
//  Created by dremobaba on 2023/1/14.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var name: String?
    @NSManaged public var province: Province?
    
    var wrappedName: String {
        name ?? "unknown city"
    }

}

extension City : Identifiable {

}
