//
//  Province+CoreDataProperties.swift
//  ExploreCoreData
//
//  Created by dremobaba on 2023/1/14.
//
//

import Foundation
import CoreData


extension Province {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Province> {
        return NSFetchRequest<Province>(entityName: "Province")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var city: NSSet?
    
    var cities: [City] {
        let data = city as? Set<City> ?? []
        return data.sorted(by: {$0.wrappedName < $1.wrappedName})
    }
    
    var wrappedName: String {
        name ?? "unknown province"
    }

}

// MARK: Generated accessors for city
extension Province {

    @objc(addCityObject:)
    @NSManaged public func addToCity(_ value: City)

    @objc(removeCityObject:)
    @NSManaged public func removeFromCity(_ value: City)

    @objc(addCity:)
    @NSManaged public func addToCity(_ values: NSSet)

    @objc(removeCity:)
    @NSManaged public func removeFromCity(_ values: NSSet)

}

extension Province : Identifiable {

}
