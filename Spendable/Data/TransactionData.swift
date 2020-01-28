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
        apollo.client.fetch(query: ListTransactionsQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            guard let data = try? result.get().data else { return }
            self.processData(data: data)
        }
    }
    
    private func processData(data: ListTransactionsQuery.Data) {
        var transactionsFromData: [Transaction] = []
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        for transactionData in data.transactions ?? [] {
            if let id = transactionData?.id, let amount = Double(transactionData?.amount ?? "0"), let date = formatter.date(from: transactionData?.date ?? "") {
                let transaction = Transaction(id: id, name: transactionData?.name, note: transactionData?.note, amount: amount, date: date, categoryId: transactionData?.category?.id, budgetId: transactionData?.budget?.id)
                transactionsFromData.append(transaction)
            }
        }
        
        transactions = transactionsFromData
    }
}
