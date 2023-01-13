//
//  ContentView.swift
//  ExploreCoreData
//
//  Created by dremobaba on 2023/1/11.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        NavigationStack {
            VStack {
                FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                    Text("\(singer.firstName ?? "") \(singer.lastName ?? "")")
                }
                Button("Add Examples") {
                    let taylor = Singer(context: moc)
                    taylor.firstName = "Taylor"
                    taylor.lastName = "Swift"
                    
                    let ed = Singer(context: moc)
                    ed.firstName = "Ed"
                    ed.lastName = "Sheeran"
                    
                    let adele = Singer(context: moc)
                    adele.firstName = "Adele"
                    adele.lastName = "Adkins"
                    
                    try? moc.save()
                }
                
                Button("Show A") {
                    lastNameFilter = "A"
                }
                
                Button("Show S") {
                    lastNameFilter = "S"
                }
            }
            .navigationTitle("Core Data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, DataController.shared.container.viewContext)
    }
}
