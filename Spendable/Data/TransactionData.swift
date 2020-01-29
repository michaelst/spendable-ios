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

extension UserData {
    func loadTransactions() {
        apollo.client.fetch(query: ListTransactionsQuery()) { result in
            guard let data = try? result.get().data else { return }
            self.load(data: data)
        }
    }
    
    func load(data: ListTransactionsQuery.Data) {
        var transactionsFromData: [Transaction] = []
        formatter.dateFormat = "yyyy-MM-dd"
        
        for transactionData in data.transactions ?? [] {
            if let id = transactionData?.id, let amount = transactionData?.amount, let date = formatter.date(from: transactionData?.date ?? "") {
                let transaction = Transaction(id: id, name: transactionData?.name, note: transactionData?.note, amount: amount, date: date, categoryId: transactionData?.category?.id, budgetId: transactionData?.budget?.id)
                transactionsFromData.append(transaction)
            }
        }
        
        transactions = transactionsFromData
    }
    
    func reload(transaction: Transaction) {
        apollo.client.fetch(query: GetTransactionQuery(id: transaction.id)) { result in
            guard let data = try? result.get().data else { return }
            
            if let amount = data.transaction?.amount, let date = self.formatter.date(from: data.transaction?.date ?? "") {
                transaction.name = data.transaction?.name
                transaction.note = data.transaction?.note
                transaction.amount = amount
                transaction.date = date
                transaction.categoryId = data.transaction?.category?.id
                transaction.budgetId = data.transaction?.budget?.id
            }
        }
    }
    
    func update(transaction: Transaction) {        
        apollo.client.perform(mutation: UpdateTransactionMutation(id: transaction.id, amount: transaction.amount, name: transaction.name, note: transaction.note, categoryId: transaction.categoryId, budgetId: transaction.budgetId)) { result in
            self.apollo.client.clearCache()
        }
    }
}
