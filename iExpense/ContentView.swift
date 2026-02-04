//
//  ContentView.swift
//  iExpense
//
//  Created by Guillaume Richard on 03/02/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack {
                            Text(item.name)
                                .font(.headline)

                            Text(item.type)
                        }
                        Spacer()

                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                // "Add Expense" n'apparait pas dans notre UI mais utile pour l'accessibilité.
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
                    .presentationDetents([.medium])
            }
        }

    }

    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }

}

#Preview {
    ContentView()
}
