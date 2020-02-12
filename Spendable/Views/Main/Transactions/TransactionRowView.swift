//
//  TransactionsRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/8/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct TransactionRowView: View {
    @ObservedObject var transaction: Transaction
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter
    }()
    
    var body: some View {
        NavigationLink(destination: TransactionView(transaction: transaction)) {
            HStack {
                VStack(alignment: .leading) {
                    Text(transaction.name ?? "")
                        .lineLimit(1)
                    
                    Text("\(transaction.date, formatter: self.dateFormatter)")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    if transaction.negative {
                        Text("$" + String(format: "%.2f", transaction.amount.doubleValue)).foregroundColor(.red)
                    } else {
                        Text("+ $" + String(format: "%.2f", transaction.amount.doubleValue)).foregroundColor(.green)
                    }
                    
                    if transaction.pending {
                        Text("pending")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                    }
                }.frame(width: 80, alignment: .trailing)
            }
        }.padding(.vertical)
    }
}
