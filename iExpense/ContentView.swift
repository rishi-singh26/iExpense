//
//  ContentView.swift
//  iExpense
//
//  Created by Rishi Singh on 11/09/23.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    @StateObject private var user = User()
    
    var body: some View {
        Form {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First Name", text: $user.firstName)
            TextField("Last Name", text: $user.lastName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
