//
//  ContentView.swift
//  iExpense
//
//  Created by Rishi Singh on 11/09/23.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    var body: some View {
        NavigationView {
            List {
                Text("Second View \(name)")
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    var body: some View {
        NavigationView {
            List {
                Button("Show sheet") {
                    showingSheet.toggle()
                }
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "Rishi Singh")
            }
            .navigationTitle("IExpence")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
