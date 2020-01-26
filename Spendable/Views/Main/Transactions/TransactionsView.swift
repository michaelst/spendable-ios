//
//  TransactionsView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/3/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct TransactionsView: View {
    @EnvironmentObject var data: TransactionData
    
    var transactions: [Bool: [Transaction]] { Dictionary(grouping: data.transactions.values, by: { $0.reviewed }) }
    
    var body: some View {
        NavigationView {
            List {
                ForEach((transactions[false] ?? []).sorted { $0.date > $1.date}) { transaction in
                    TransactionRowView(transactionId: transaction.id)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Transactions")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: { self.data.setup() })
    }
}
