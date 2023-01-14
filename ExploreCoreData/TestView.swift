//
//  TestView.swift
//  ExploreCoreData
//
//  Created by dremobaba on 2023/1/14.
//

import SwiftUI

struct TestView: View {
    @State private var toogleState = true
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("iCloud Backup")
                        Spacer()
                        Toggle(isOn: $toogleState) {
                            
                        }
                    }
                } header: {
                    Text("Backup")
                } footer: {
                    Text("Automatically back up your apps and data to iCloud when this iPhone is connected to power, locked and on Wi-Fi")
                        .font(.caption)
                }
                Section {
                    Button("Back Up Now") {
                    }
                } footer: {
                    VStack(alignment: .leading) {
                        Text("This iPhone cannot be backeed up because there is not enough iCloud storage available.")
                            .font(.caption)
                        Spacer()
                        Text("Last successful backup: September 22, 2022 at 05: 55")
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Backup")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TestView()
        }
    }
}
