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
  //  @State private var lastNameFilter = "A"
    @FetchRequest(sortDescriptors: []) var provinces: FetchedResults<Province>
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(provinces) { province in
                        Section {
                            ForEach(province.cities) { city in
                                Text(city.wrappedName)
                            }
                        } header: {
                            Text(province.wrappedName)
                        }
                    }
                }
                Button("Add Examples") {
                    let nanchang = City(context: moc)
                    nanchang.name = "Nanchang"
                    nanchang.province = Province(context: moc)
                    nanchang.province?.name = "Jiangxi"
                    nanchang.province?.id = "1"
                    
                    let jiujiang = City(context: moc)
                    jiujiang.name = "JiuJiang"
                    jiujiang.province = Province(context: moc)
                    jiujiang.province?.name = "Jiangxi"
                    jiujiang.province?.id = "1"
                    
                    let wuhan = City(context: moc)
                    wuhan.name = "Wuhan"
                    wuhan.province = Province(context: moc)
                    wuhan.province?.name = "Hubei"
                    wuhan.province?.id = "2"
                    
                    try? moc.save()
                    
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
