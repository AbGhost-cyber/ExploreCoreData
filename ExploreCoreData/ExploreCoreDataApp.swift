//
//  ExploreCoreDataApp.swift
//  ExploreCoreData
//
//  Created by dremobaba on 2023/1/11.
//

import SwiftUI

@main
struct ExploreCoreDataApp: App {
    @StateObject var dataController: DataController = .shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
