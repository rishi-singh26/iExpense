//
//  ContentView.swift
//  iExpense
//
//  Created by Rishi Singh on 11/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var searchText = ""
    
    let colors = [
        Color(red: 1, green: 0.38, blue: 0.38, opacity: 0.3),
        Color(red: 1, green: 0.38, blue: 0.38, opacity: 0.5),
        Color(red: 1, green: 0.38, blue: 0.38, opacity: 0.7)
    ]

    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    ForEach(expenses.items) {expense in
                        if expense.type == "Personal" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(expense.name)
                                        .font(.headline)
                                    Text(expense.type)
                                }
                                Spacer()
                                Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                            }
                            .listRowBackground(getColor(amount: expense.amount))
                        }
                    }
                    .onDelete(perform: removeItem)
                }
                Section("Business") {
                    ForEach(expenses.items) {expense in
                        if expense.type == "Business" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(expense.name)
                                        .font(.headline)
                                    Text(expense.type)
                                }
                                Spacer()
                                Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                            }
                            .listRowBackground(getColor(amount: expense.amount))
                        }
                    }
                    .onDelete(perform: removeItem)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add item") {
                        showingAddExpense = true
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Text("Total Expense")
                        Spacer()
                        Text(expenses.total, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                    }
                    .font(.headline)
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
        .searchable(text: $searchText)
    }
    
    func removeItem(at offsets: IndexSet) {
        if let index = offsets.first {
            expenses.total -= expenses.items[index].amount
        }
        expenses.items.remove(atOffsets: offsets)
    }
    
    func getColor(amount: Double) -> Color {
        if amount <= 50 {
            return colors[0]
        } else if amount > 50 && amount <= 100 {
            return colors[1]
        } else {
            return colors[2]
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
