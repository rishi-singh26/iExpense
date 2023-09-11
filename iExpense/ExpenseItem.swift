//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Rishi Singh on 11/09/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
