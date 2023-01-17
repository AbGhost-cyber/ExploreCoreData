//
//  DataController.swift
//  ExploreCoreData
//
//  Created by dremobaba on 2023/1/11.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container: NSPersistentContainer
    static let shared: DataController = DataController()
    
   private init() {
        container = NSPersistentContainer(name: "datamodels")
       container.loadPersistentStores { des, error in
           if let error = error {
               print("Core Data failed to load: \(error.localizedDescription)")
           }
           self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
       }
    }
}
