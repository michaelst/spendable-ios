//
//  TransactionData.swift
//  Spendable
//
//  Created by Michael St Clair on 11/8/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI
import Combine
import KeychainSwift

final class TransactionData: ObservableObject  {
    let objectWillChange = ObservableObjectPublisher()
    let apollo = Apollo()
    
    func setup() {
        loadCategories()
    }
    
    var categories: [Category] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    private func loadCategories() {
        apollo.client.fetch(query: ListCategoriesQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            guard let data = try? result.get().data else { return }
            self.categories = self.processCategoryData(data: data)
            self.loadTransactions()
        }
    }
    
    private func processCategoryData(data: ListCategoriesQuery.Data) -> [Category] {
        var categories: [Category] = []
        
        for categoryData in data.categories ?? [] {
            if let id = categoryData?.id, let name = categoryData?.name {
                let category = Category(id: id, name: name)
                categories.append(category)
            }
        }
        
        return categories
    }
    
    var transactions: [Date: [Transaction]] = [:] {
        willSet { self.objectWillChange.send() }
    }
    
    private func loadTransactions() {
        apollo.client.fetch(query: ListTransactionsQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            guard let data = try? result.get().data else { return }
            self.transactions = self.processTransactionData(data: data)
        }
    }
    
    private func processTransactionData(data: ListTransactionsQuery.Data) -> [Date: [Transaction]] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        var transactions: [Date: [Transaction]] = [:]
        
        for transactionData in data.transactions ?? [] {
            if let id = transactionData?.id, let amount = Float(transactionData?.amount ?? "0"), let date = formatter.date(from: transactionData?.date ?? "") {
                let category = self.categories.first(where: { $0.id == transactionData?.category?.id })
                let transaction = Transaction(id: id, name: transactionData?.name, note: transactionData?.note, amount: amount, date: date, category: category)
                if transactions[date] == nil {
                    transactions[date] = [transaction]
                } else {
                    transactions[date]!.append(transaction)
                }
            }
        }
        
        return transactions
    }
}
