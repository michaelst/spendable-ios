//
//  TransactionsRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/8/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct TransactionRowView: View {
    var transaction: Transaction
    
    var body: some View {
        NavigationLink(destination: TransactionView()) {
            HStack {
                VStack {
                    HStack {
                        Text(transaction.name ?? "")
                        
                        Spacer()
                        
                        if transaction.amount < 0 {
                            Text("$" + String(format: "%.2f", abs(transaction.amount))).foregroundColor(.red)
                        } else {
                            Text("$" + String(format: "%.2f", transaction.amount)).foregroundColor(.green)
                        }
                    }
                    
                    HStack {
                        Spacer()
                        Text(transaction.category?.name ?? "").font(.caption).foregroundColor(.gray)
                    }
                }
                
                Image(systemName: "checkmark.circle").foregroundColor(.gray)
            }
        }
    }
}

struct TransactionRowView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRowView(transaction: Transaction(id: "1", name: "Uber", amount: Float("10.51")!, date: Date(), category: Category(id: "1", name: "Ride Share")))
    }
}
