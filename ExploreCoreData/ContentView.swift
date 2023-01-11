//
//  ContentView.swift
//  ExploreCoreData
//
//  Created by dremobaba on 2023/1/11.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: []) var movies: FetchedResults<Movie>
    
    var body: some View {
        NavigationStack {
            List(movies) { movie in
                Text(movie.wrappedTitle)
            }
            Button("Add") {
                let movie = Movie(context: context)
                movie.title = "Die hard"
            }
            Button("Save") {
                do {
                    try context.save()
                }catch {
                    print(error.localizedDescription)
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
