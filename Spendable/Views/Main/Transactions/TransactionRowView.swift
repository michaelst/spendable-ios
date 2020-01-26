//
//  TransactionsRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/8/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct TransactionRowView: View {
    @EnvironmentObject var data: TransactionData
    var transactionId: String
    
    private var transaction: Transaction {
        get {
            return data.transactions[transactionId]!
        }
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter
    }()
    
    var body: some View {
        NavigationLink(destination: TransactionView(transactionId: transactionId)) {
            HStack {
                VStack {
                    HStack {
                        Text(transaction.name ?? "").lineLimit(1)
                        Spacer()
                    }
                    
                    HStack {
                        Text("\(transaction.date, formatter: self.dateFormatter)").font(.caption).foregroundColor(.gray)
                        Spacer()
                    }.padding(.top, 8)
                }
                
                Spacer()
                
                
                HStack {
                    Spacer()
                    if transaction.amount < 0 {
                        Text("$" + String(format: "%.2f", abs(transaction.amount))).foregroundColor(.red)
                    } else {
                        Text("+ $" + String(format: "%.2f", transaction.amount)).foregroundColor(.green)
                    }
                }
            }
        }.padding(.vertical)
    }
}
