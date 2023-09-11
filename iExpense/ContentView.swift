//
//  ContentView.swift
//  iExpense
//
//  Created by Rishi Singh on 11/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    var body: some View {
        NavigationView {
            List {
                ForEach(numbers, id: \.self) {
                    Text("Row \($0)")
                }
                .onDelete(perform: removeRows)
            }
            .navigationTitle("IExpence")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        withAnimation {
                            numbers.append(currentNumber)
                        }
                        currentNumber += 1
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add Number")
                                .fontWeight(.bold)
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
