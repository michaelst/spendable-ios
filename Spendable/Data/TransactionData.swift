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
    func loadTransactions(page: Int = 0) {
        loadingTransactions = true
        apollo.client.fetch(query: ListTransactionsQuery(offset: page * 100)) { result in
            guard let data = try? result.get().data else { return }
            if page == 0 { self.transactions = [] }
            self.load(data: data)
            self.loadingTransactions = false
        }
    }
    
    func load(data: ListTransactionsQuery.Data) {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if data.transactions?.count ?? 0 > 0 {
            for transactionData in data.transactions! {
                if let id = transactionData?.id, let amount = transactionData?.amount, let date = dateFormatter.date(from: transactionData?.date ?? "") {
                    let allocations = transactionData?.allocations?.map { allocation in
                        return Allocation(id: allocation!.id!, amount: allocation!.amount!, budgetId: allocation!.budget!.id!)
                    }
                    
                    let transaction = Transaction(
                        id: id,
                        pending: transactionData?.bankTransaction?.pending ?? false,
                        name: transactionData?.name,
                        note: transactionData?.note,
                        bankMemo: transactionData?.bankTransaction?.name,
                        amount: amount,
                        date: date,
                        categoryId: transactionData?.category?.id,
                        allocations: allocations ?? []
                    )
                    
                    transactions.append(transaction)
                }
            }
        } else {
            hasMoreTransactions = false
        }
    }
    
    func reload(transaction: Transaction) {
        apollo.client.fetch(query: GetTransactionQuery(id: transaction.id)) { result in
            guard let data = try? result.get().data?.transaction else { return }
            
            if let amount = data.amount, let date = self.dateFormatter.date(from: data.date!) {
                let allocations = data.allocations?.map { allocation in
                    return Allocation(id: allocation!.id!, amount: allocation!.amount!, budgetId: allocation!.budget!.id!)
                }
                
                transaction.pending = data.bankTransaction?.pending ?? false
                transaction.name = data.name
                transaction.note = data.note
                transaction.bankMemo = data.bankTransaction?.name
                transaction.amount = amount
                transaction.date = date
                transaction.categoryId = data.category?.id
                transaction.allocations = allocations ?? []
            }
        }
    }
    
    func create(transaction: Transaction) {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let allocations = transaction.allocations.map { allocation in
            return AllocationInputObject(
                amount: allocation.amount,
                budgetId: allocation.budgetId,
                id: allocation.id.hasPrefix("temp-") ? nil : allocation.id
            )
        }
        
        let mutation = CreateTransactionMutation(
            amount: transaction.amount,
            name: transaction.name,
            date: self.dateFormatter.string(from: transaction.date),
            note: transaction.note,
            categoryId: transaction.categoryId,
            allocations: allocations
        )
        
        apollo.client.perform(mutation: mutation) { result in
            guard let data = try? result.get().data?.createTransaction else { return }
            
            if let id = data.id, let amount = data.amount, let date = self.dateFormatter.date(from: data.date!) {
                let allocations = data.allocations?.map { allocation in
                    return Allocation(id: allocation!.id!, amount: allocation!.amount!, budgetId: allocation!.budget!.id!)
                }
                
                let transaction = Transaction(
                    id: id,
                    name: data.name,
                    note: data.note,
                    amount: amount,
                    date: date,
                    categoryId: data.category?.id,
                    allocations: allocations ?? []
                )
                
                self.transactions.append(transaction)
                self.apollo.client.clearCache()
            }
        }
    }
    
    func update(transaction: Transaction) {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let allocations = transaction.allocations.map { allocation in
            return AllocationInputObject(
                amount: allocation.amount,
                budgetId: allocation.budgetId,
                id: allocation.id.hasPrefix("temp-") ? nil : allocation.id
            )
        }
        
        let mutation = UpdateTransactionMutation(
            id: transaction.id,
            amount: transaction.amount,
            name: transaction.name,
            date: self.dateFormatter.string(from: transaction.date),
            note: transaction.note,
            categoryId: transaction.categoryId,
            allocations: allocations
        )
        
        apollo.client.perform(mutation: mutation) { result in
            self.apollo.client.clearCache()
        }
    }
    
    func deleteTransactions(at offsets: IndexSet) {
        let dispatch = DispatchGroup()
        
        for offset in Array(offsets) {
            dispatch.enter()
            print(sortedTransactions[offset].id)
            
            apollo.client.perform(mutation: DeleteTransactionMutation(id: sortedTransactions[offset].id)) { _result in
                dispatch.leave()
            }
        }
        
        dispatch.notify(queue: .main) {
            let unsoretdOffsets = IndexSet(offsets.compactMap {offset in
                self.transactions.firstIndex(where: { transaction in
                    self.sortedTransactions[offset].id == transaction.id
                })
            })
            
            self.transactions.remove(atOffsets: unsoretdOffsets)
            self.apollo.client.clearCache()
        }
    }
}
