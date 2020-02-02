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
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        for transactionData in data.transactions ?? [] {
            if let id = transactionData?.id, let amount = transactionData?.amount, let date = dateFormatter.date(from: transactionData?.date ?? "") {
                let allocations = transactionData?.allocations?.map { allocation in
                    return Allocation(id: allocation!.id!, amount: allocation!.amount!, budgetId: allocation!.budget!.id!)
                }
                
                let transaction = Transaction(
                    id: id,
                    negative: amount.hasPrefix("-"),
                    name: transactionData?.name,
                    note: transactionData?.note,
                    amount: amount,
                    date: date,
                    categoryId:
                    transactionData?.category?.id,
                    allocations: allocations ?? []
                )
                
                transactionsFromData.append(transaction)
            }
        }
        
        transactions = transactionsFromData
    }
    
    func reload(transaction: Transaction) {
        apollo.client.fetch(query: GetTransactionQuery(id: transaction.id)) { result in
            guard let data = try? result.get().data?.transaction else { return }
            
            if let amount = data.amount, let date = self.dateFormatter.date(from: data.date!) {
                transaction.name = data.name
                transaction.note = data.note
                transaction.amount = amount
                transaction.date = date
                transaction.categoryId = data.category?.id
            }
        }
    }
    
    func update(transaction: Transaction) {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let allocations = transaction.allocations.map { allocation in
            return AllocationInputObject(
                amount: transaction.negative ? "-\(allocation.amount)" : allocation.amount,
                budgetId: allocation.budgetId,
                id: allocation.id
            )
        }
        
        let mutation = UpdateTransactionMutation(
            id: transaction.id,
            amount: transaction.negative ? "-\(transaction.amount)" : transaction.amount,
            name: transaction.name,
            date: self.dateFormatter.string(from: transaction.date),
            note: transaction.note,
            categoryId: transaction.categoryId,
            allocations: allocations
        )
        
        apollo.client.perform(mutation: mutation) { result in
            self.apollo.client.clearCache()
            self.loadBudgets()
        }
    }
}
