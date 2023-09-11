//
//  ContentView.swift
//  iExpense
//
//  Created by Rishi Singh on 11/09/23.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Mei", lastName: "Dhaka")

    var body: some View {
        NavigationView {
            List {
                Button("Save User") {
                    let encoder = JSONEncoder()
                    
                    if let data  = try? encoder.encode(user) {
                        UserDefaults.standard.set(data, forKey: "userData")
                    }
                }
            }
            .navigationTitle("iExpense")
            .onAppear(perform: decodeData)
        }
    }
    
    func decodeData() {
        let decoder = JSONDecoder()
        if let encodedData = UserDefaults.standard.data(forKey: "userData") {
            if let data = try? decoder.decode(User.self, from: encodedData) {
                user = data
            }
        }
        print(user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
