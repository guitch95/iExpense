//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Guillaume Richard on 04/02/2026.
//

import Foundation

// Identifiable -> It means that this type of data can be identified uniquely.
// Has only one requirement -> To have a property called ID that contains some kind of unique identifier.
// UUID here.

// Codable -> To work with JSONDecoder et Encoder.

struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    let name:  String
    let type: String
    let amount : Double
}
