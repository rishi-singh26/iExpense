//
//  Expenses.swift
//  iExpense
//
//  Created by Rishi Singh on 11/09/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let data = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(data, forKey: "expenseItems")
            }
        }
    }
    
    @Published var total = 0.0
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let savedItems = UserDefaults.standard.data(forKey: "expenseItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                for item in items {
                    total += item.amount
                }
                return
            }
        }
        
        items = []
    }
}
