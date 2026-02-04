//
//  Expenses.swift
//  iExpense
//
//  Created by Guillaume Richard on 04/02/2026.
//

import Foundation

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }

    }
    
    init() {
        
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // .self refers to the type itself
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }

}
